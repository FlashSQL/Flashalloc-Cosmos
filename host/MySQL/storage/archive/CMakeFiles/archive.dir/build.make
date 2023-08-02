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
include storage/archive/CMakeFiles/archive.dir/depend.make

# Include the progress variables for this target.
include storage/archive/CMakeFiles/archive.dir/progress.make

# Include the compile flags for this target's objects.
include storage/archive/CMakeFiles/archive.dir/flags.make

storage/archive/CMakeFiles/archive.dir/azio.c.o: storage/archive/CMakeFiles/archive.dir/flags.make
storage/archive/CMakeFiles/archive.dir/azio.c.o: storage/archive/azio.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/csoyee/git/mysql-dwblr-salloc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object storage/archive/CMakeFiles/archive.dir/azio.c.o"
	cd /home/csoyee/git/mysql-dwblr-salloc/storage/archive && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/archive.dir/azio.c.o   -c /home/csoyee/git/mysql-dwblr-salloc/storage/archive/azio.c

storage/archive/CMakeFiles/archive.dir/azio.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/archive.dir/azio.c.i"
	cd /home/csoyee/git/mysql-dwblr-salloc/storage/archive && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/csoyee/git/mysql-dwblr-salloc/storage/archive/azio.c > CMakeFiles/archive.dir/azio.c.i

storage/archive/CMakeFiles/archive.dir/azio.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/archive.dir/azio.c.s"
	cd /home/csoyee/git/mysql-dwblr-salloc/storage/archive && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/csoyee/git/mysql-dwblr-salloc/storage/archive/azio.c -o CMakeFiles/archive.dir/azio.c.s

storage/archive/CMakeFiles/archive.dir/ha_archive.cc.o: storage/archive/CMakeFiles/archive.dir/flags.make
storage/archive/CMakeFiles/archive.dir/ha_archive.cc.o: storage/archive/ha_archive.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/csoyee/git/mysql-dwblr-salloc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object storage/archive/CMakeFiles/archive.dir/ha_archive.cc.o"
	cd /home/csoyee/git/mysql-dwblr-salloc/storage/archive && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/archive.dir/ha_archive.cc.o -c /home/csoyee/git/mysql-dwblr-salloc/storage/archive/ha_archive.cc

storage/archive/CMakeFiles/archive.dir/ha_archive.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/archive.dir/ha_archive.cc.i"
	cd /home/csoyee/git/mysql-dwblr-salloc/storage/archive && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/csoyee/git/mysql-dwblr-salloc/storage/archive/ha_archive.cc > CMakeFiles/archive.dir/ha_archive.cc.i

storage/archive/CMakeFiles/archive.dir/ha_archive.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/archive.dir/ha_archive.cc.s"
	cd /home/csoyee/git/mysql-dwblr-salloc/storage/archive && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/csoyee/git/mysql-dwblr-salloc/storage/archive/ha_archive.cc -o CMakeFiles/archive.dir/ha_archive.cc.s

# Object files for target archive
archive_OBJECTS = \
"CMakeFiles/archive.dir/azio.c.o" \
"CMakeFiles/archive.dir/ha_archive.cc.o"

# External object files for target archive
archive_EXTERNAL_OBJECTS =

storage/archive/libarchive.a: storage/archive/CMakeFiles/archive.dir/azio.c.o
storage/archive/libarchive.a: storage/archive/CMakeFiles/archive.dir/ha_archive.cc.o
storage/archive/libarchive.a: storage/archive/CMakeFiles/archive.dir/build.make
storage/archive/libarchive.a: storage/archive/CMakeFiles/archive.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/csoyee/git/mysql-dwblr-salloc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library libarchive.a"
	cd /home/csoyee/git/mysql-dwblr-salloc/storage/archive && $(CMAKE_COMMAND) -P CMakeFiles/archive.dir/cmake_clean_target.cmake
	cd /home/csoyee/git/mysql-dwblr-salloc/storage/archive && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/archive.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
storage/archive/CMakeFiles/archive.dir/build: storage/archive/libarchive.a

.PHONY : storage/archive/CMakeFiles/archive.dir/build

storage/archive/CMakeFiles/archive.dir/clean:
	cd /home/csoyee/git/mysql-dwblr-salloc/storage/archive && $(CMAKE_COMMAND) -P CMakeFiles/archive.dir/cmake_clean.cmake
.PHONY : storage/archive/CMakeFiles/archive.dir/clean

storage/archive/CMakeFiles/archive.dir/depend:
	cd /home/csoyee/git/mysql-dwblr-salloc && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/csoyee/git/mysql-dwblr-salloc /home/csoyee/git/mysql-dwblr-salloc/storage/archive /home/csoyee/git/mysql-dwblr-salloc /home/csoyee/git/mysql-dwblr-salloc/storage/archive /home/csoyee/git/mysql-dwblr-salloc/storage/archive/CMakeFiles/archive.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : storage/archive/CMakeFiles/archive.dir/depend
