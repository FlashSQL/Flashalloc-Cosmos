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
include storage/perfschema/CMakeFiles/gen_pfs_lex_token.dir/depend.make

# Include the progress variables for this target.
include storage/perfschema/CMakeFiles/gen_pfs_lex_token.dir/progress.make

# Include the compile flags for this target's objects.
include storage/perfschema/CMakeFiles/gen_pfs_lex_token.dir/flags.make

storage/perfschema/CMakeFiles/gen_pfs_lex_token.dir/gen_pfs_lex_token.cc.o: storage/perfschema/CMakeFiles/gen_pfs_lex_token.dir/flags.make
storage/perfschema/CMakeFiles/gen_pfs_lex_token.dir/gen_pfs_lex_token.cc.o: storage/perfschema/gen_pfs_lex_token.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/csoyee/git/mysql-dwblr-salloc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object storage/perfschema/CMakeFiles/gen_pfs_lex_token.dir/gen_pfs_lex_token.cc.o"
	cd /home/csoyee/git/mysql-dwblr-salloc/storage/perfschema && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/gen_pfs_lex_token.dir/gen_pfs_lex_token.cc.o -c /home/csoyee/git/mysql-dwblr-salloc/storage/perfschema/gen_pfs_lex_token.cc

storage/perfschema/CMakeFiles/gen_pfs_lex_token.dir/gen_pfs_lex_token.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gen_pfs_lex_token.dir/gen_pfs_lex_token.cc.i"
	cd /home/csoyee/git/mysql-dwblr-salloc/storage/perfschema && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/csoyee/git/mysql-dwblr-salloc/storage/perfschema/gen_pfs_lex_token.cc > CMakeFiles/gen_pfs_lex_token.dir/gen_pfs_lex_token.cc.i

storage/perfschema/CMakeFiles/gen_pfs_lex_token.dir/gen_pfs_lex_token.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gen_pfs_lex_token.dir/gen_pfs_lex_token.cc.s"
	cd /home/csoyee/git/mysql-dwblr-salloc/storage/perfschema && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/csoyee/git/mysql-dwblr-salloc/storage/perfschema/gen_pfs_lex_token.cc -o CMakeFiles/gen_pfs_lex_token.dir/gen_pfs_lex_token.cc.s

# Object files for target gen_pfs_lex_token
gen_pfs_lex_token_OBJECTS = \
"CMakeFiles/gen_pfs_lex_token.dir/gen_pfs_lex_token.cc.o"

# External object files for target gen_pfs_lex_token
gen_pfs_lex_token_EXTERNAL_OBJECTS =

storage/perfschema/gen_pfs_lex_token: storage/perfschema/CMakeFiles/gen_pfs_lex_token.dir/gen_pfs_lex_token.cc.o
storage/perfschema/gen_pfs_lex_token: storage/perfschema/CMakeFiles/gen_pfs_lex_token.dir/build.make
storage/perfschema/gen_pfs_lex_token: storage/perfschema/CMakeFiles/gen_pfs_lex_token.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/csoyee/git/mysql-dwblr-salloc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable gen_pfs_lex_token"
	cd /home/csoyee/git/mysql-dwblr-salloc/storage/perfschema && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gen_pfs_lex_token.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
storage/perfschema/CMakeFiles/gen_pfs_lex_token.dir/build: storage/perfschema/gen_pfs_lex_token

.PHONY : storage/perfschema/CMakeFiles/gen_pfs_lex_token.dir/build

storage/perfschema/CMakeFiles/gen_pfs_lex_token.dir/clean:
	cd /home/csoyee/git/mysql-dwblr-salloc/storage/perfschema && $(CMAKE_COMMAND) -P CMakeFiles/gen_pfs_lex_token.dir/cmake_clean.cmake
.PHONY : storage/perfschema/CMakeFiles/gen_pfs_lex_token.dir/clean

storage/perfschema/CMakeFiles/gen_pfs_lex_token.dir/depend:
	cd /home/csoyee/git/mysql-dwblr-salloc && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/csoyee/git/mysql-dwblr-salloc /home/csoyee/git/mysql-dwblr-salloc/storage/perfschema /home/csoyee/git/mysql-dwblr-salloc /home/csoyee/git/mysql-dwblr-salloc/storage/perfschema /home/csoyee/git/mysql-dwblr-salloc/storage/perfschema/CMakeFiles/gen_pfs_lex_token.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : storage/perfschema/CMakeFiles/gen_pfs_lex_token.dir/depend
