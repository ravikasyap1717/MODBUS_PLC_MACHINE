# Install script for directory: /home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/pi/Documents/Thingtrax/azure_example/build/azure-iot-develop/c/c-utility/libaziotsharedutil.a")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/azureiot/azure_c_shared_utility" TYPE FILE FILES
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/agenttime.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/base64.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/buffer_.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/crt_abstractions.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/constmap.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/condition.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/consolelogger.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/doublylinkedlist.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/gballoc.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/gb_stdio.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/gb_time.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/hmac.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/hmacsha256.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/singlylinkedlist.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/lock.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/macro_utils.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/map.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/platform.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/refcount.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/sastoken.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/sha-private.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/shared_util_options.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/sha.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/socketio.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/stdint_ce6.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/strings.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/string_tokenizer.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/tickcounter.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/threadapi.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/xio.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/umock_c_prod.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/uniqueid.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/urlencode.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/vector.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/xlogging.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/constbuffer.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/tlsio.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/optionhandler.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/httpapi.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/httpapiex.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/httpapiexsas.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/httpheaders.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/tlsio_openssl.h"
    "/home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/c-utility/./inc/azure_c_shared_utility/x509_openssl.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/pi/Documents/Thingtrax/azure_example/build/azure-iot-develop/c/c-utility/samples/cmake_install.cmake")

endif()

