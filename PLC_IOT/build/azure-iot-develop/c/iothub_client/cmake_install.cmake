# Install script for directory: /home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/pi/Documents/Thingtrax/azure_example/build/azure-iot-develop/c/iothub_client/libiothub_client.a")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/pi/Documents/Thingtrax/azure_example/build/azure-iot-develop/c/iothub_client/libiothub_client_http_transport.a")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/pi/Documents/Thingtrax/azure_example/build/azure-iot-develop/c/iothub_client/libiothub_client_amqp_transport.a")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/pi/Documents/Thingtrax/azure_example/build/azure-iot-develop/c/iothub_client/libiothub_client_mqtt_transport.a")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/azureiot" TYPE FILE FILES
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothub_message.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothub_client_ll.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothub_client_version.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothub_transport_ll.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/blob.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/../parson/parson.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothub_client_ll_uploadtoblob.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothub_client.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothub_client_options.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothub_client_version.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothubtransport.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothub_client_private.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothub_message.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothub_client_ll.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothub_client_version.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothub_transport_ll.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/blob.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/../parson/parson.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothub_client_ll_uploadtoblob.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothubtransporthttp.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothub_transport_ll.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothub_message.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothub_client_ll.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothub_client_version.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothub_transport_ll.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/blob.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/../parson/parson.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothub_client_ll_uploadtoblob.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothubtransportamqp.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothubtransportamqp_auth.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/uamqp_messaging.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothub_message.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothub_client_ll.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothub_client_version.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothub_transport_ll.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/blob.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/../parson/parson.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothub_client_ll_uploadtoblob.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothubtransport_mqtt_common.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_client/./inc/iothubtransportmqtt.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/pi/Documents/Thingtrax/azure_example/build/azure-iot-develop/c/iothub_client/samples/cmake_install.cmake")

endif()

