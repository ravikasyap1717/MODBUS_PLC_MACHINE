# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.0

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
CMAKE_SOURCE_DIR = /home/pi/Documents/Thingtrax/azure_example

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pi/Documents/Thingtrax/azure_example/build

# Include any dependencies generated for this target.
include azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/depend.make

# Include the progress variables for this target.
include azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/progress.make

# Include the compile flags for this target's objects.
include azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/flags.make

azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/remote_monitoring.c.o: azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/flags.make
azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/remote_monitoring.c.o: ../azure-iot-develop/c/serializer/samples/remote_monitoring/remote_monitoring.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/pi/Documents/Thingtrax/azure_example/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/remote_monitoring.c.o"
	cd /home/pi/Documents/Thingtrax/azure_example/build/azure-iot-develop/c/serializer/samples/remote_monitoring && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/remote_monitoring.dir/remote_monitoring.c.o   -c /home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/serializer/samples/remote_monitoring/remote_monitoring.c

azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/remote_monitoring.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/remote_monitoring.dir/remote_monitoring.c.i"
	cd /home/pi/Documents/Thingtrax/azure_example/build/azure-iot-develop/c/serializer/samples/remote_monitoring && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/serializer/samples/remote_monitoring/remote_monitoring.c > CMakeFiles/remote_monitoring.dir/remote_monitoring.c.i

azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/remote_monitoring.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/remote_monitoring.dir/remote_monitoring.c.s"
	cd /home/pi/Documents/Thingtrax/azure_example/build/azure-iot-develop/c/serializer/samples/remote_monitoring && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/serializer/samples/remote_monitoring/remote_monitoring.c -o CMakeFiles/remote_monitoring.dir/remote_monitoring.c.s

azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/remote_monitoring.c.o.requires:
.PHONY : azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/remote_monitoring.c.o.requires

azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/remote_monitoring.c.o.provides: azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/remote_monitoring.c.o.requires
	$(MAKE) -f azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/build.make azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/remote_monitoring.c.o.provides.build
.PHONY : azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/remote_monitoring.c.o.provides

azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/remote_monitoring.c.o.provides.build: azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/remote_monitoring.c.o

# Object files for target remote_monitoring
remote_monitoring_OBJECTS = \
"CMakeFiles/remote_monitoring.dir/remote_monitoring.c.o"

# External object files for target remote_monitoring
remote_monitoring_EXTERNAL_OBJECTS =

azure-iot-develop/c/serializer/samples/remote_monitoring/remote_monitoring: azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/remote_monitoring.c.o
azure-iot-develop/c/serializer/samples/remote_monitoring/remote_monitoring: azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/build.make
azure-iot-develop/c/serializer/samples/remote_monitoring/remote_monitoring: azure-iot-develop/c/serializer/libserializer.a
azure-iot-develop/c/serializer/samples/remote_monitoring/remote_monitoring: azure-iot-develop/c/iothub_client/libiothub_client.a
azure-iot-develop/c/serializer/samples/remote_monitoring/remote_monitoring: azure-iot-develop/c/iothub_client/libiothub_client_amqp_transport.a
azure-iot-develop/c/serializer/samples/remote_monitoring/remote_monitoring: azure-iot-develop/c/c-utility/libaziotsharedutil.a
azure-iot-develop/c/serializer/samples/remote_monitoring/remote_monitoring: azure-iot-develop/c/uamqp/libuamqp.a
azure-iot-develop/c/serializer/samples/remote_monitoring/remote_monitoring: azure-iot-develop/c/c-utility/libaziotsharedutil.a
azure-iot-develop/c/serializer/samples/remote_monitoring/remote_monitoring: azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable remote_monitoring"
	cd /home/pi/Documents/Thingtrax/azure_example/build/azure-iot-develop/c/serializer/samples/remote_monitoring && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/remote_monitoring.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/build: azure-iot-develop/c/serializer/samples/remote_monitoring/remote_monitoring
.PHONY : azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/build

azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/requires: azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/remote_monitoring.c.o.requires
.PHONY : azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/requires

azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/clean:
	cd /home/pi/Documents/Thingtrax/azure_example/build/azure-iot-develop/c/serializer/samples/remote_monitoring && $(CMAKE_COMMAND) -P CMakeFiles/remote_monitoring.dir/cmake_clean.cmake
.PHONY : azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/clean

azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/depend:
	cd /home/pi/Documents/Thingtrax/azure_example/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/Documents/Thingtrax/azure_example /home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/serializer/samples/remote_monitoring /home/pi/Documents/Thingtrax/azure_example/build /home/pi/Documents/Thingtrax/azure_example/build/azure-iot-develop/c/serializer/samples/remote_monitoring /home/pi/Documents/Thingtrax/azure_example/build/azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : azure-iot-develop/c/serializer/samples/remote_monitoring/CMakeFiles/remote_monitoring.dir/depend

