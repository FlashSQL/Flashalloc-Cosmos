# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/csoyee/git/mysql-dwblr-salloc

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/csoyee/git/mysql-dwblr-salloc

# Include any dependencies generated for this target.
include unittest/examples/CMakeFiles/no_plan-t.dir/depend.make

# Include the progress variables for this target.
include unittest/examples/CMakeFiles/no_plan-t.dir/progress.make

# Include the compile flags for this target's objects.
include unittest/examples/CMakeFiles/no_plan-t.dir/flags.make

unittest/examples/CMakeFiles/no_plan-t.dir/no_plan-t.c.o: unittest/examples/CMakeFiles/no_plan-t.dir/flags.make
unittest/examples/CMakeFiles/no_plan-t.dir/no_plan-t.c.o: unittest/examples/no_plan-t.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/csoyee/git/mysql-dwblr-salloc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object unittest/examples/CMakeFiles/no_plan-t.dir/no_plan-t.c.o"
	cd /home/csoyee/git/mysql-dwblr-salloc/unittest/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/no_plan-t.dir/no_plan-t.c.o   -c /home/csoyee/git/mysql-dwblr-salloc/unittest/examples/no_plan-t.c

unittest/examples/CMakeFiles/no_plan-t.dir/no_plan-t.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/no_plan-t.dir/no_plan-t.c.i"
	cd /home/csoyee/git/mysql-dwblr-salloc/unittest/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/csoyee/git/mysql-dwblr-salloc/unittest/examples/no_plan-t.c > CMakeFiles/no_plan-t.dir/no_plan-t.c.i

unittest/examples/CMakeFiles/no_plan-t.dir/no_plan-t.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/no_plan-t.dir/no_plan-t.c.s"
	cd /home/csoyee/git/mysql-dwblr-salloc/unittest/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/csoyee/git/mysql-dwblr-salloc/unittest/examples/no_plan-t.c -o CMakeFiles/no_plan-t.dir/no_plan-t.c.s

# Object files for target no_plan-t
no_plan__t_OBJECTS = \
"CMakeFiles/no_plan-t.dir/no_plan-t.c.o"

# External object files for target no_plan-t
no_plan__t_EXTERNAL_OBJECTS =

unittest/examples/no_plan-t: unittest/examples/CMakeFiles/no_plan-t.dir/no_plan-t.c.o
unittest/examples/no_plan-t: unittest/examples/CMakeFiles/no_plan-t.dir/build.make
unittest/examples/no_plan-t: unittest/mytap/libmytap.a
unittest/examples/no_plan-t: mysys/libmysys.a
unittest/examples/no_plan-t: dbug/libdbug.a
unittest/examples/no_plan-t: mysys/libmysys.a
unittest/examples/no_plan-t: dbug/libdbug.a
unittest/examples/no_plan-t: strings/libstrings.a
unittest/examples/no_plan-t: zlib/libzlib.a
unittest/examples/no_plan-t: unittest/examples/CMakeFiles/no_plan-t.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/csoyee/git/mysql-dwblr-salloc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable no_plan-t"
	cd /home/csoyee/git/mysql-dwblr-salloc/unittest/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/no_plan-t.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
unittest/examples/CMakeFiles/no_plan-t.dir/build: unittest/examples/no_plan-t

.PHONY : unittest/examples/CMakeFiles/no_plan-t.dir/build

unittest/examples/CMakeFiles/no_plan-t.dir/clean:
	cd /home/csoyee/git/mysql-dwblr-salloc/unittest/examples && $(CMAKE_COMMAND) -P CMakeFiles/no_plan-t.dir/cmake_clean.cmake
.PHONY : unittest/examples/CMakeFiles/no_plan-t.dir/clean

unittest/examples/CMakeFiles/no_plan-t.dir/depend:
	cd /home/csoyee/git/mysql-dwblr-salloc && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/csoyee/git/mysql-dwblr-salloc /home/csoyee/git/mysql-dwblr-salloc/unittest/examples /home/csoyee/git/mysql-dwblr-salloc /home/csoyee/git/mysql-dwblr-salloc/unittest/examples /home/csoyee/git/mysql-dwblr-salloc/unittest/examples/CMakeFiles/no_plan-t.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : unittest/examples/CMakeFiles/no_plan-t.dir/depend

