Function(create_example)
    Set(options "")
    Set(oneValueArgs NAME MODULE DIRECTORY)
    Set(multiValueArgs DEPENDENCIES INCLUDE_DIRS)

    CMake_Parse_Arguments(EXAMPLE "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    if (NOT EXAMPLE_NAME OR NOT EXAMPLE_DIRECTORY)
        Message(FATAL_ERROR "create_example requires a valid NAME, MODULE and DIRECTORY.")
    endif ()

    File(GLOB_RECURSE EXAMPLE_FILES "${EXAMPLE_DIRECTORY}/private/*.cpp")

    Add_Executable(${EXAMPLE_NAME} ${EXAMPLE_FILES})

    Set_Target_Properties(${EXAMPLE_NAME} PROPERTIES LINKER_LANGUAGE CXX)
    Target_Link_Libraries(${EXAMPLE_NAME} PRIVATE ${EXAMPLE_DEPENDENCIES})
    Target_Include_Directories(${EXAMPLE_NAME} PUBLIC "${EXAMPLE_DIRECTORY}/public" "${EXAMPLE_INCLUDE_DIRS}" PRIVATE "${EXAMPLE_DIRECTORY}/private")

EndFunction()

Function(create_module)
    Set(options "")
    Set(oneValueArgs NAME DIRECTORY LANGUAGE)
    Set(multiValueArgs DEPENDENCIES INCLUDE_DIRS)

    CMake_Parse_Arguments(MODULE "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    if (NOT MODULE_NAME OR NOT MODULE_DIRECTORY OR NOT MODULE_LANGUAGE)
        Message(FATAL_ERROR "create_module requires a valid NAME, DIRECTORY and LANGUAGE.")
    endif ()

    File(GLOB_RECURSE MODULE_FILES "${MODULE_DIRECTORY}/public/*.hpp" "${MODULE_DIRECTORY}/private/*.cpp" "${MODULE_DIRECTORY}/*.mm")
    Add_Library(${MODULE_NAME} STATIC ${MODULE_FILES})

    Set_Target_Properties(${MODULE_NAME} PROPERTIES LINKER_LANGUAGE ${MODULE_LANGUAGE})
    Target_Link_Libraries(${MODULE_NAME} PUBLIC ${MODULE_DEPENDENCIES})
    Target_Include_Directories(${MODULE_NAME} PUBLIC "${MODULE_DIRECTORY}/public" PUBLIC "${MODULE_INCLUDE_DIRS}" PRIVATE "${MODULE_DIRECTORY}/private")
    message(${MODULE_INCLUDE_DIRS})
    Set(${MODULE_NAME}_Include_Dir "${MODULE_DIRECTORY}/public" PARENT_SCOPE)
EndFunction()

Function(create_interface)
    Set(options "")
    Set(oneValueArgs NAME DIRECTORY LANGUAGE)
    Set(multiValueArgs DEPENDENCIES)

    CMake_Parse_Arguments(MODULE "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    if (NOT MODULE_NAME OR NOT MODULE_DIRECTORY OR NOT MODULE_LANGUAGE)
        Message(FATAL_ERROR "create_interface requires a valid NAME, DIRECTORY and LANGUAGE.")
    endif ()

    File(GLOB_RECURSE MODULE_FILES "${MODULE_DIRECTORY}/*.hpp")
    Add_Library(${MODULE_NAME} INTERFACE ${MODULE_FILES})

    Set_Target_Properties(${MODULE_NAME} PROPERTIES LINKER_LANGUAGE ${MODULE_LANGUAGE})
    Target_Link_Libraries(${MODULE_NAME} INTERFACE ${MODULE_DEPENDENCIES})
    Target_Include_Directories(${MODULE_NAME} INTERFACE "${MODULE_DIRECTORY}/public")
EndFunction()