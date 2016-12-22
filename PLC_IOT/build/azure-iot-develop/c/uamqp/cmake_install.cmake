# Install script for directory: /home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/uamqp

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/pi/Documents/Thingtrax/azure_example/build/azure-iot-develop/c/uamqp/libuamqp.a")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/azureiot/azure_uamqp_c" TYPE FILE FILES
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/uamqp/./inc/azure_uamqp_c/amqp_definitions.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/uamqp/./inc/azure_uamqp_c/amqp_frame_codec.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/uamqp/./inc/azure_uamqp_c/amqp_management.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/uamqp/./inc/azure_uamqp_c/amqp_types.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/uamqp/./inc/azure_uamqp_c/amqpalloc.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/uamqp/./inc/azure_uamqp_c/amqpvalue.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/uamqp/./inc/azure_uamqp_c/amqpvalue_to_string.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/uamqp/./inc/azure_uamqp_c/cbs.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/uamqp/./inc/azure_uamqp_c/connection.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/uamqp/./inc/azure_uamqp_c/frame_codec.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/uamqp/./inc/azure_uamqp_c/header_detect_io.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/uamqp/./inc/azure_uamqp_c/link.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/uamqp/./inc/azure_uamqp_c/message.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/uamqp/./inc/azure_uamqp_c/message_receiver.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/uamqp/./inc/azure_uamqp_c/message_sender.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/uamqp/./inc/azure_uamqp_c/messaging.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/uamqp/./inc/azure_uamqp_c/sasl_anonymous.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/uamqp/./inc/azure_uamqp_c/sasl_frame_codec.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/uamqp/./inc/azure_uamqp_c/sasl_mechanism.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/uamqp/./inc/azure_uamqp_c/sasl_mssbcbs.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/uamqp/./inc/azure_uamqp_c/sasl_plain.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/uamqp/./inc/azure_uamqp_c/saslclientio.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/uamqp/./inc/azure_uamqp_c/session.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/uamqp/./inc/azure_uamqp_c/socket_listener.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/pi/Documents/Thingtrax/azure_example/build/azure-iot-develop/c/uamqp/c-utility/cmake_install.cmake")

endif()

