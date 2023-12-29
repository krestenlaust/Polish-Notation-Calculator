
add_executable(test_calculator test_calculator.c)
target_link_libraries(test_calculator calculator m)

add_test(NAME test_calculator COMMAND test_calculator)
