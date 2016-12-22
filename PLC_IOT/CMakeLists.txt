cmake_minimum_required(VERSION 2.8.11)

project(Thingtrax)


macro(compileAsC99)
  if (CMAKE_VERSION VERSION_LESS "3.1")
    if (CMAKE_C_COMPILER_ID STREQUAL "GNU")
      set (CMAKE_C_FLAGS "--std=c99 ${CMAKE_C_FLAGS}")
    if (NOT IN_OPENWRT)
      set (CMAKE_CXX_FLAGS "--std=c++11 ${CMAKE_CXX_FLAGS}")
    endif()
    endif()
  else()
    set (CMAKE_C_STANDARD 99)
    set (CMAKE_CXX_STANDARD 11)
  endif()
endmacro(compileAsC99)

macro(compileAsC11)
  if (CMAKE_VERSION VERSION_LESS "3.1")
    if (CMAKE_C_COMPILER_ID STREQUAL "GNU")
      set (CMAKE_C_FLAGS "--std=c11 ${CMAKE_C_FLAGS}")
      set (CMAKE_C_FLAGS "-D_POSIX_C_SOURCE=200112L ${CMAKE_C_FLAGS}")
      set (CMAKE_CXX_FLAGS "--std=c++11 ${CMAKE_CXX_FLAGS}")
    endif()
  else()
    set (CMAKE_C_STANDARD 11)
    set (CMAKE_CXX_STANDARD 11)
  endif()
endmacro(compileAsC11)

compileAsC11()




add_subdirectory(azure-iot-develop/c)
add_subdirectory(libmodbus-ascii-support)

include_directories(${SERIALIZER_INC_FOLDER} ${SHARED_UTIL_INC_FOLDER} ${IOTHUB_CLIENT_INC_FOLDER})
include_directories(${MODBUS_SRC_FOLDER})
set(sample_application_c_files
	./buf.c
	./log.c
	./json.c
	./jsmn.c
	./modbus_json.c
 	./remote_monitoring.c
 	./main.c
)
	
set(sample_application_h_files
	./buf.h
	./log.h
	./json.h
	./jsmn.h
	./modbus_json.h
  ./remote_monitoring.h
    
)

add_executable(sample_app ${sample_application_c_files} ${sample_application_h_files})


target_link_libraries(
sample_app
    serializer
    iothub_client
    iothub_client_amqp_transport
    aziotsharedutil
    uamqp
    modbus
   
)

#set_property(TARGET sample_app PROPERTY C_STANDARD 99) 
