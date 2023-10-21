#include "calculator.h"

void do_next_op(char operator, double operand, double* akkumulator) {

}

bool is_op_valid(char operator) {
    return operator == PLUS_OP ||
        operator == MINUS_OP ||
        operator == MULTIPLICATION_OP ||
        operator == DIVISION_OP ||
        operator == POWER_OP ||
        operator == SQUAREROOT_OP ||
        operator == FLIP_SIGN_OP ||
        operator == RECIPROCAL_OP ||
        operator == EXIT_OP;
}

bool is_op_binary(char operator) {
    return operator == PLUS_OP ||
        operator == MINUS_OP ||
        operator == MULTIPLICATION_OP ||
        operator == DIVISION_OP ||
        operator == POWER_OP;
}

binary_operator binary_op_factory(char operator){

}

unary_operator unary_op_factory(char operator) {

}

unary_operator partial_binary_op(binary_operator op, double second_operand) {
    
}