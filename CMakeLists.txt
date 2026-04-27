CMake_Minimum_Required(VERSION 4.0.0)

Project(bi_turbo VERSION 0.0.1 LANGUAGES CXX)

If (APPLE)
    Enable_Language(OBJCXX)
Endif ()

Set(CMAKE_CXX_STANDARD 23)
Set(CMAKE_CXX_STANDARD_REQUIRED ON)
Set(CMAKE_CXX_EXTENSIONS OFF)

Set(OUTPUT_DIR ${CMAKE_BINARY_DIR}/bin)
Set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${OUTPUT_DIR})
Set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${OUTPUT_DIR})

Include(CMake/funcs.cmake)

Include(CMake/deps.cmake)
Include(CMake/mods.cmake)
Include(CMake/examples.cmake)