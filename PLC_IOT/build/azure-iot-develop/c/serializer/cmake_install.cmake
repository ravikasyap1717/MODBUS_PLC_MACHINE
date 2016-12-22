# Install script for directory: /home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/serializer

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/pi/Documents/Thingtrax/azure_example/build/azure-iot-develop/c/serializer/libserializer.a")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/azureiot" TYPE FILE FILES
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/serializer/./inc/agenttypesystem.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/serializer/./inc/codefirst.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/serializer/./inc/commanddecoder.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/serializer/./inc/datamarshaller.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/serializer/./inc/datapublisher.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/serializer/./inc/dataserializer.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/serializer/./inc/iotdevice.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/serializer/./inc/jsondecoder.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/serializer/./inc/jsonencoder.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/serializer/./inc/multitree.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/serializer/./inc/schema.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/serializer/./inc/schemalib.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/serializer/./inc/schemaserializer.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/serializer/./inc/serializer.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/pi/Documents/Thingtrax/azure_example/build/azure-iot-develop/c/serializer/samples/cmake_install.cmake")
  include("/home/pi/Documents/Thingtrax/azure_example/build/azure-iot-develop/c/serializer/tests/cmake_install.cmake")

endif()

