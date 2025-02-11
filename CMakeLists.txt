cmake_minimum_required(VERSION 3.10)
project(musiCpp)

set(CMAKE_CXX_STANDARD 17)  

set(SOURCES
    src/main.cpp
    src/player.cpp
    src/playlist.cpp
    src/audio.cpp
    src/filemanager.cpp
    src/controls.cpp
    src/logger.cpp
    src/config.cpp
)

include_directories(include)

find_package(SFML 2.5 COMPONENTS audio REQUIRED)

add_executable(musiCpp ${SOURCES})

target_link_libraries(musiCpp sfml-audio)

target_precompile_headers(musiCpp PRIVATE include/common.h)
