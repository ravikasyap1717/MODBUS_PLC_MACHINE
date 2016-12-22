# Install script for directory: /home/pi/Documents/Thingtrax/azure_example/azure-iot-develop/c/iothub_service_client/tests

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

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/pi/Documents/Thingtrax/azure_example/build/azure-iot-develop/c/iothub_service_client/tests/connectionstringparser_ut/cmake_install.cmake")
  include("/home/pi/Documents/Thingtrax/azure_example/build/azure-iot-develop/c/iothub_service_client/tests/iothub_msging_ll_ut/cmake_install.cmake")
  include("/home/pi/Documents/Thingtrax/azure_example/build/azure-iot-develop/c/iothub_service_client/tests/iothub_rm_ut/cmake_install.cmake")
  include("/home/pi/Documents/Thingtrax/azure_example/build/azure-iot-develop/c/iothub_service_client/tests/iothub_srv_client_auth_ut/cmake_install.cmake")

endif()
