# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/mugunthan/Rently/Training/notes/cmake

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mugunthan/Rently/Training/notes/cmake/build

# Include any dependencies generated for this target.
include CMakeFiles/CMake_eg.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/CMake_eg.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/CMake_eg.dir/flags.make

CMakeFiles/CMake_eg.dir/main.c.o: CMakeFiles/CMake_eg.dir/flags.make
CMakeFiles/CMake_eg.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mugunthan/Rently/Training/notes/cmake/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/CMake_eg.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/CMake_eg.dir/main.c.o   -c /home/mugunthan/Rently/Training/notes/cmake/main.c

CMakeFiles/CMake_eg.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/CMake_eg.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mugunthan/Rently/Training/notes/cmake/main.c > CMakeFiles/CMake_eg.dir/main.c.i

CMakeFiles/CMake_eg.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/CMake_eg.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mugunthan/Rently/Training/notes/cmake/main.c -o CMakeFiles/CMake_eg.dir/main.c.s

# Object files for target CMake_eg
CMake_eg_OBJECTS = \
"CMakeFiles/CMake_eg.dir/main.c.o"

# External object files for target CMake_eg
CMake_eg_EXTERNAL_OBJECTS =

CMake_eg: CMakeFiles/CMake_eg.dir/main.c.o
CMake_eg: CMakeFiles/CMake_eg.dir/build.make
CMake_eg: CMakeFiles/CMake_eg.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mugunthan/Rently/Training/notes/cmake/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable CMake_eg"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/CMake_eg.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/CMake_eg.dir/build: CMake_eg

.PHONY : CMakeFiles/CMake_eg.dir/build

CMakeFiles/CMake_eg.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/CMake_eg.dir/cmake_clean.cmake
.PHONY : CMakeFiles/CMake_eg.dir/clean

CMakeFiles/CMake_eg.dir/depend:
	cd /home/mugunthan/Rently/Training/notes/cmake/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mugunthan/Rently/Training/notes/cmake /home/mugunthan/Rently/Training/notes/cmake /home/mugunthan/Rently/Training/notes/cmake/build /home/mugunthan/Rently/Training/notes/cmake/build /home/mugunthan/Rently/Training/notes/cmake/build/CMakeFiles/CMake_eg.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/CMake_eg.dir/depend

