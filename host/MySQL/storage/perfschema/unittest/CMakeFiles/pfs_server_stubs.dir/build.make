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
include storage/perfschema/unittest/CMakeFiles/pfs_server_stubs.dir/depend.make

# Include the progress variables for this target.
include storage/perfschema/unittest/CMakeFiles/pfs_server_stubs.dir/progress.make

# Include the compile flags for this target's objects.
include storage/perfschema/unittest/CMakeFiles/pfs_server_stubs.dir/flags.make

storage/perfschema/unittest/CMakeFiles/pfs_server_stubs.dir/pfs_server_stubs.cc.o: storage/perfschema/unittest/CMakeFiles/pfs_server_stubs.dir/flags.make
storage/perfschema/unittest/CMakeFiles/pfs_server_stubs.dir/pfs_server_stubs.cc.o: storage/perfschema/unittest/pfs_server_stubs.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/csoyee/git/mysql-dwblr-salloc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object storage/perfschema/unittest/CMakeFiles/pfs_server_stubs.dir/pfs_server_stubs.cc.o"
	cd /home/csoyee/git/mysql-dwblr-salloc/storage/perfschema/unittest && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pfs_server_stubs.dir/pfs_server_stubs.cc.o -c /home/csoyee/git/mysql-dwblr-salloc/storage/perfschema/unittest/pfs_server_stubs.cc

storage/perfschema/unittest/CMakeFiles/pfs_server_stubs.dir/pfs_server_stubs.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pfs_server_stubs.dir/pfs_server_stubs.cc.i"
	cd /home/csoyee/git/mysql-dwblr-salloc/storage/perfschema/unittest && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/csoyee/git/mysql-dwblr-salloc/storage/perfschema/unittest/pfs_server_stubs.cc > CMakeFiles/pfs_server_stubs.dir/pfs_server_stubs.cc.i

storage/perfschema/unittest/CMakeFiles/pfs_server_stubs.dir/pfs_server_stubs.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pfs_server_stubs.dir/pfs_server_stubs.cc.s"
	cd /home/csoyee/git/mysql-dwblr-salloc/storage/perfschema/unittest && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/csoyee/git/mysql-dwblr-salloc/storage/perfschema/unittest/pfs_server_stubs.cc -o CMakeFiles/pfs_server_stubs.dir/pfs_server_stubs.cc.s

# Object files for target pfs_server_stubs
pfs_server_stubs_OBJECTS = \
"CMakeFiles/pfs_server_stubs.dir/pfs_server_stubs.cc.o"

# External object files for target pfs_server_stubs
pfs_server_stubs_EXTERNAL_OBJECTS =

storage/perfschema/unittest/libpfs_server_stubs.a: storage/perfschema/unittest/CMakeFiles/pfs_server_stubs.dir/pfs_server_stubs.cc.o
storage/perfschema/unittest/libpfs_server_stubs.a: storage/perfschema/unittest/CMakeFiles/pfs_server_stubs.dir/build.make
storage/perfschema/unittest/libpfs_server_stubs.a: storage/perfschema/unittest/CMakeFiles/pfs_server_stubs.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/csoyee/git/mysql-dwblr-salloc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libpfs_server_stubs.a"
	cd /home/csoyee/git/mysql-dwblr-salloc/storage/perfschema/unittest && $(CMAKE_COMMAND) -P CMakeFiles/pfs_server_stubs.dir/cmake_clean_target.cmake
	cd /home/csoyee/git/mysql-dwblr-salloc/storage/perfschema/unittest && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pfs_server_stubs.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
storage/perfschema/unittest/CMakeFiles/pfs_server_stubs.dir/build: storage/perfschema/unittest/libpfs_server_stubs.a

.PHONY : storage/perfschema/unittest/CMakeFiles/pfs_server_stubs.dir/build

storage/perfschema/unittest/CMakeFiles/pfs_server_stubs.dir/clean:
	cd /home/csoyee/git/mysql-dwblr-salloc/storage/perfschema/unittest && $(CMAKE_COMMAND) -P CMakeFiles/pfs_server_stubs.dir/cmake_clean.cmake
.PHONY : storage/perfschema/unittest/CMakeFiles/pfs_server_stubs.dir/clean

storage/perfschema/unittest/CMakeFiles/pfs_server_stubs.dir/depend:
	cd /home/csoyee/git/mysql-dwblr-salloc && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/csoyee/git/mysql-dwblr-salloc /home/csoyee/git/mysql-dwblr-salloc/storage/perfschema/unittest /home/csoyee/git/mysql-dwblr-salloc /home/csoyee/git/mysql-dwblr-salloc/storage/perfschema/unittest /home/csoyee/git/mysql-dwblr-salloc/storage/perfschema/unittest/CMakeFiles/pfs_server_stubs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : storage/perfschema/unittest/CMakeFiles/pfs_server_stubs.dir/depend

