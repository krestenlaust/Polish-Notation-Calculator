
add_library(calculator calculator.c)
target_link_libraries(calculator m)
target_include_directories(calculator PUBLIC .)

add_executable(project1 project1.c)
target_link_libraries(project1 calculator)
