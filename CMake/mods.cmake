# Core API
Create_Module(
    NAME bi_turbo.core
    LANGUAGE CXX
    DIRECTORY "${CMAKE_SOURCE_DIR}/src/core"
    DEPENDENCIES tasker
    INCLUDE_DIRS "${tasker_SOURCE_DIR}/src/public"
)