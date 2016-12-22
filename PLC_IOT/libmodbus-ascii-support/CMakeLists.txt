cmake_minimum_required(VERSION 2.8.11)

project(Modbus)

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





#compileAsC99()
#add_subdirectory(src)

set(MODBUS_SRC_FILES
 	    ./src/modbus.c 
        ./src/modbus-data.c 
        ./src/modbus-serial.c 
        ./src/modbus-rtu.c 
        ./src/modbus-ascii.c       
        ./src/modbus-tcp.c 
)

set(MODBUS_HEDER_FILES
		 ./src/config.h
	 	./src/modbus.h 
	    ./src/modbus-private.h 
	    ./src/modbus-serial.h 
	  	./src/modbus-serial-private.h 
	    ./src/modbus-rtu-private.h 
	    ./src/modbus-ascii.h 
	    ./src/modbus-ascii-private.h 
	    ./src/modbus-tcp.h 
        ./src/modbus-tcp-private.h 
        ./src/modbus-version.h
      
)

set(MODBUS_SRC_FOLDER ${CMAKE_CURRENT_LIST_DIR}/src CACHE INTERNAL "this is what needs to be included if using modbus lib" FORCE)
#include_directories(${MODBUS_SRC_FOLDER})

add_library(modbus 
       ${MODBUS_SRC_FILES} 
      ${MODBUS_HEDER_FILES}
)

target_link_libraries(modbus)   
    
#set_property(TARGET modbus PROPERTY C_STANDARD 99) 
