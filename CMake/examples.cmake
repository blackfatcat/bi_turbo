Create_Example(
    NAME "bi_turbo.web"
    DIRECTORY "${PROJECT_SOURCE_DIR}/examples/web"
    DEPENDENCIES "bi_turbo.core"
    INCLUDE_DIRS "${bi_turbo.core_Include_Dir}" # TODO: swap out for bt_ecs
)