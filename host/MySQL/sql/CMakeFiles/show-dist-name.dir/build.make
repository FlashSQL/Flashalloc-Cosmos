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

# Utility rule file for show-dist-name.

# Include the progress variables for this target.
include sql/CMakeFiles/show-dist-name.dir/progress.make

sql/CMakeFiles/show-dist-name:
	cd /home/csoyee/git/mysql-dwblr-salloc/sql && /usr/local/bin/cmake -E echo mysql-5.7.2-m12-linux-x86_64

show-dist-name: sql/CMakeFiles/show-dist-name
show-dist-name: sql/CMakeFiles/show-dist-name.dir/build.make

.PHONY : show-dist-name

# Rule to build all files generated by this target.
sql/CMakeFiles/show-dist-name.dir/build: show-dist-name

.PHONY : sql/CMakeFiles/show-dist-name.dir/build

sql/CMakeFiles/show-dist-name.dir/clean:
	cd /home/csoyee/git/mysql-dwblr-salloc/sql && $(CMAKE_COMMAND) -P CMakeFiles/show-dist-name.dir/cmake_clean.cmake
.PHONY : sql/CMakeFiles/show-dist-name.dir/clean

sql/CMakeFiles/show-dist-name.dir/depend:
	cd /home/csoyee/git/mysql-dwblr-salloc && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/csoyee/git/mysql-dwblr-salloc /home/csoyee/git/mysql-dwblr-salloc/sql /home/csoyee/git/mysql-dwblr-salloc /home/csoyee/git/mysql-dwblr-salloc/sql /home/csoyee/git/mysql-dwblr-salloc/sql/CMakeFiles/show-dist-name.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : sql/CMakeFiles/show-dist-name.dir/depend
