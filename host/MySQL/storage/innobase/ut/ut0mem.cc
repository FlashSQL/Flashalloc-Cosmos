/*****************************************************************************

Copyright (c) 1994, 2013, Oracle and/or its affiliates. All Rights Reserved.

This program is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation; version 2 of the License.

This program is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Suite 500, Boston, MA 02110-1335 USA

*****************************************************************************/

/********************************************************************//**
@file ut/ut0mem.cc
Memory primitives

Created 5/11/1994 Heikki Tuuri
*************************************************************************/

#include "ut0mem.h"

#ifdef UNIV_NONINL
#include "ut0mem.ic"
#endif

#ifndef UNIV_HOTBACKUP
# include "os0thread.h"
# include "srv0srv.h"

#include <stdlib.h>

/** The total amount of memory currently allocated from the operating
system with os_mem_alloc_large() or malloc().  Does not count malloc()
if srv_use_sys_malloc is set.  Protected by ut_list_mutex. */
ulint		ut_total_allocated_memory	= 0;

/** Mutex protecting ut_total_allocated_memory and ut_mem_block_list */
SysMutex		ut_list_mutex;

/** Dynamically allocated memory block */
struct ut_mem_block_t{
	UT_LIST_NODE_T(ut_mem_block_t) mem_block_list;
			/*!< mem block list node */
	ulint	size;	/*!< size of allocated memory */
	ulint	magic_n;/*!< magic number (UT_MEM_MAGIC_N) */
};

/** The value of ut_mem_block_t::magic_n.  Used in detecting
memory corruption. */
#define UT_MEM_MAGIC_N	1601650166

/** List of all memory blocks allocated from the operating system
with malloc.  Protected by ut_list_mutex. */
static UT_LIST_BASE_NODE_T(ut_mem_block_t)   ut_mem_block_list;

/** Flag: has ut_mem_block_list been initialized? */
static bool  ut_mem_block_list_inited = false;

/** A dummy pointer for generating a null pointer exception in
ut_malloc_low() */
static ulint*	ut_mem_null_ptr	= NULL;

/**********************************************************************//**
Initializes the mem block list at database startup. */

void
ut_mem_init(void)
/*=============*/
{
	ut_a(!ut_mem_block_list_inited);
	mutex_create("ut_list_mutex", &ut_list_mutex);

	UT_LIST_INIT(ut_mem_block_list, &ut_mem_block_t::mem_block_list);

	ut_mem_block_list_inited = true;
}
#endif /* !UNIV_HOTBACKUP */

/**********************************************************************//**
Allocates memory.
@return own: allocated memory */

void*
ut_malloc_low(
/*==========*/
	ulint	n,		/*!< in: number of bytes to allocate */
	ibool	assert_on_error)/*!< in: if TRUE, we crash mysqld if the
				memory cannot be allocated */
{
#ifndef UNIV_HOTBACKUP
	ulint	retry_count;
	void*	ret;

	if (UNIV_LIKELY(srv_use_sys_malloc)) {
		ret = malloc(n);
		ut_a(ret || !assert_on_error);

		return(ret);
	}

	/* check alignment ok */
	ut_ad((sizeof(ut_mem_block_t) % 8) == 0);
	ut_a(ut_mem_block_list_inited);

	retry_count = 0;
retry:
	mutex_enter(&ut_list_mutex);

	ret = malloc(n + sizeof(ut_mem_block_t));

	if (ret == NULL && retry_count < 60) {
		if (retry_count == 0) {
			ut_print_timestamp(stderr);

			ib_logf(IB_LOG_LEVEL_ERROR,
				"Cannot allocate %lu bytes of memory with "
				"malloc! Total allocated memory by InnoDB "
				"is %lu bytes. Operating system errno: %lu "
				"Check if you should increase the swap file "
				"or ulimits of your operating system. "
				"On FreeBSD check that you have compiled the "
				"OS with a big enough maximum process size. "
				"Note that on most 32-bit computers the "
				"process memory space is limited to 2 GB "
				"or 4 GB. We keep retrying the allocation "
				"for 60 seconds...",
				(ulong) n,
				(ulong) ut_total_allocated_memory,
#ifdef _WIN32
				(ulong) GetLastError()
#else
				(ulong) errno
#endif /* _WIN32 */
				);
		}

		mutex_exit(&ut_list_mutex);

		/* Sleep for a second and retry the allocation; maybe this is
		just a temporary shortage of memory */

		os_thread_sleep(1000000);

		retry_count++;

		goto retry;
	}

	if (ret == NULL) {
		/* Flush stderr to make more probable that the error
		message gets in the error file before we generate a seg
		fault */

		fflush(stderr);

		mutex_enter(&ut_list_mutex);

		/* Make an intentional seg fault so that we get a stack
		trace */
		if (assert_on_error) {
			ut_print_timestamp(stderr);

			ib_logf(IB_LOG_LEVEL_ERROR,
				"We now intentionally generate a seg fault "
				"so that on Linux we get a stack trace.");

			if (*ut_mem_null_ptr) {
				ut_mem_null_ptr = 0;
			}
		} else {
			return(NULL);
		}
	}

	UNIV_MEM_ALLOC(ret, n + sizeof(ut_mem_block_t));

	((ut_mem_block_t*) ret)->size = n + sizeof(ut_mem_block_t);
	((ut_mem_block_t*) ret)->magic_n = UT_MEM_MAGIC_N;

	ut_total_allocated_memory += n + sizeof(ut_mem_block_t);

	UT_LIST_ADD_FIRST(ut_mem_block_list, ((ut_mem_block_t*) ret));
	mutex_exit(&ut_list_mutex);

	return((void*)((byte*) ret + sizeof(ut_mem_block_t)));
#else /* !UNIV_HOTBACKUP */
	void*	ret = malloc(n);
	ut_a(ret || !assert_on_error);

	return(ret);
#endif /* !UNIV_HOTBACKUP */
}

/**********************************************************************//**
Frees a memory block allocated with ut_malloc. Freeing a NULL pointer is
a nop. */

void
ut_free(
/*====*/
	void* ptr)  /*!< in, own: memory block, can be NULL */
{
#ifndef UNIV_HOTBACKUP
	ut_mem_block_t* block;

	if (ptr == NULL) {
		return;
	} else if (UNIV_LIKELY(srv_use_sys_malloc)) {
		free(ptr);
		return;
	}

	block = (ut_mem_block_t*)((byte*) ptr - sizeof(ut_mem_block_t));

	mutex_enter(&ut_list_mutex);

	ut_a(block->magic_n == UT_MEM_MAGIC_N);
	ut_a(ut_total_allocated_memory >= block->size);

	ut_total_allocated_memory -= block->size;

	UT_LIST_REMOVE(ut_mem_block_list, block);

	free(block);

	mutex_exit(&ut_list_mutex);

#else /* !UNIV_HOTBACKUP */
	free(ptr);
#endif /* !UNIV_HOTBACKUP */
}

#ifndef UNIV_HOTBACKUP
/**********************************************************************//**
Implements realloc. This is needed by /pars/lexyy.cc. Otherwise, you should not
use this function because the allocation functions in mem0mem.h are the
recommended ones in InnoDB.

man realloc in Linux, 2004:

       realloc()  changes the size of the memory block pointed to
       by ptr to size bytes.  The contents will be  unchanged  to
       the minimum of the old and new sizes; newly allocated mem-
       ory will be uninitialized.  If ptr is NULL,  the	 call  is
       equivalent  to malloc(size); if size is equal to zero, the
       call is equivalent to free(ptr).	 Unless ptr is	NULL,  it
       must  have  been	 returned by an earlier call to malloc(),
       calloc() or realloc().

RETURN VALUE
       realloc() returns a pointer to the newly allocated memory,
       which is suitably aligned for any kind of variable and may
       be different from ptr, or NULL if the  request  fails.  If
       size  was equal to 0, either NULL or a pointer suitable to
       be passed to free() is returned.	 If realloc()  fails  the
       original	 block	is  left  untouched  - it is not freed or
       moved.
@return own: pointer to new mem block or NULL */

void*
ut_realloc(
/*=======*/
	void*	ptr,	/*!< in: pointer to old block or NULL */
	ulint	size)	/*!< in: desired size */
{
	ut_mem_block_t* block;
	ulint		old_size;
	ulint		min_size;
	void*		new_ptr;

	if (UNIV_LIKELY(srv_use_sys_malloc)) {
		return(realloc(ptr, size));
	}

	if (ptr == NULL) {

		return(ut_malloc(size));
	}

	if (size == 0) {
		ut_free(ptr);

		return(NULL);
	}

	block = (ut_mem_block_t*)((byte*) ptr - sizeof(ut_mem_block_t));

	ut_a(block->magic_n == UT_MEM_MAGIC_N);

	old_size = block->size - sizeof(ut_mem_block_t);

	if (size < old_size) {
		min_size = size;
	} else {
		min_size = old_size;
	}

	new_ptr = ut_malloc(size);

	if (new_ptr == NULL) {

		return(NULL);
	}

	/* Copy the old data from ptr */
	ut_memcpy(new_ptr, ptr, min_size);

	ut_free(ptr);

	return(new_ptr);
}

/**********************************************************************//**
Frees in shutdown all allocated memory not freed yet. */

void
ut_free_all_mem(void)
/*=================*/
{
	ut_mem_block_t* block;

	ut_a(ut_mem_block_list_inited);

	ut_mem_block_list_inited = false;

	mutex_free(&ut_list_mutex);

	while ((block = UT_LIST_GET_FIRST(ut_mem_block_list))) {

		ut_a(block->magic_n == UT_MEM_MAGIC_N);
		ut_a(ut_total_allocated_memory >= block->size);

		ut_total_allocated_memory -= block->size;

		UT_LIST_REMOVE(ut_mem_block_list, block);

		::free(block);
	}

	if (ut_total_allocated_memory != 0) {
		ib_logf(IB_LOG_LEVEL_WARN,
			"after shutdown total allocated memory is %lu",
			(ulong) ut_total_allocated_memory);
	}

	ut_mem_block_list_inited = false;
}
#endif /* !UNIV_HOTBACKUP */

/**********************************************************************//**
Copies up to size - 1 characters from the NUL-terminated string src to
dst, NUL-terminating the result. Returns strlen(src), so truncation
occurred if the return value >= size.
@return strlen(src) */

ulint
ut_strlcpy(
/*=======*/
	char*		dst,	/*!< in: destination buffer */
	const char*	src,	/*!< in: source buffer */
	ulint		size)	/*!< in: size of destination buffer */
{
	ulint	src_size = strlen(src);

	if (size != 0) {
		ulint	n = ut_min(src_size, size - 1);

		memcpy(dst, src, n);
		dst[n] = '\0';
	}

	return(src_size);
}

/**********************************************************************//**
Like ut_strlcpy, but if src doesn't fit in dst completely, copies the last
(size - 1) bytes of src, not the first.
@return strlen(src) */

ulint
ut_strlcpy_rev(
/*===========*/
	char*		dst,	/*!< in: destination buffer */
	const char*	src,	/*!< in: source buffer */
	ulint		size)	/*!< in: size of destination buffer */
{
	ulint	src_size = strlen(src);

	if (size != 0) {
		ulint	n = ut_min(src_size, size - 1);

		memcpy(dst, src + src_size - n, n + 1);
	}

	return(src_size);
}

#ifndef UNIV_HOTBACKUP
/**********************************************************************//**
Return the number of times s2 occurs in s1. Overlapping instances of s2
are only counted once.
@return the number of times s2 occurs in s1 */

ulint
ut_strcount(
/*========*/
	const char*	s1,	/*!< in: string to search in */
	const char*	s2)	/*!< in: string to search for */
{
	ulint	count = 0;
	ulint	len = strlen(s2);

	if (len == 0) {

		return(0);
	}

	for (;;) {
		s1 = strstr(s1, s2);

		if (!s1) {

			break;
		}

		count++;
		s1 += len;
	}

	return(count);
}

/********************************************************************
Concatenate 3 strings.*/

char*
ut_str3cat(
/*=======*/
				/* out, own: concatenated string, must be
				freed with mem_free() */
	const char*	s1,	/* in: string 1 */
	const char*	s2,	/* in: string 2 */
	const char*	s3)	/* in: string 3 */
{
	char*	s;
	ulint	s1_len = strlen(s1);
	ulint	s2_len = strlen(s2);
	ulint	s3_len = strlen(s3);

	s = static_cast<char*>(mem_alloc(s1_len + s2_len + s3_len + 1));

	memcpy(s, s1, s1_len);
	memcpy(s + s1_len, s2, s2_len);
	memcpy(s + s1_len + s2_len, s3, s3_len);

	s[s1_len + s2_len + s3_len] = '\0';

	return(s);
}
/**********************************************************************//**
Replace every occurrence of s1 in str with s2. Overlapping instances of s1
are only replaced once.
@return own: modified string, must be freed with mem_free() */

char*
ut_strreplace(
/*==========*/
	const char*	str,	/*!< in: string to operate on */
	const char*	s1,	/*!< in: string to replace */
	const char*	s2)	/*!< in: string to replace s1 with */
{
	char*		new_str;
	char*		ptr;
	const char*	str_end;
	ulint		str_len = strlen(str);
	ulint		s1_len = strlen(s1);
	ulint		s2_len = strlen(s2);
	ulint		count = 0;
	int		len_delta = (int) s2_len - (int) s1_len;

	str_end = str + str_len;

	if (len_delta <= 0) {
		len_delta = 0;
	} else {
		count = ut_strcount(str, s1);
	}

	new_str = static_cast<char*>(
		mem_alloc(str_len + count * len_delta + 1));

	ptr = new_str;

	while (str) {
		const char*	next = strstr(str, s1);

		if (!next) {
			next = str_end;
		}

		memcpy(ptr, str, next - str);
		ptr += next - str;

		if (next == str_end) {

			break;
		}

		memcpy(ptr, s2, s2_len);
		ptr += s2_len;

		str = next + s1_len;
	}

	*ptr = '\0';

	return(new_str);
}

#endif /* !UNIV_HOTBACKUP */
