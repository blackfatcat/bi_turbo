Create_Example(
    NAME "bi_turbo.web"
    DIRECTORY "${CMAKE_SOURCE_DIR}/examples/web"
    DEPENDENCIES "bi_turbo.core"
    INCLUDE_DIRS "${bi_turbo.core_Include_Dir}" "${tasker_SOURCE_DIR}/src/public" "${tasker_SOURCE_DIR}/src/extern"
)