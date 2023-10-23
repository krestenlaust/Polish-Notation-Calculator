#include "calculator.h"

bool is_op_binary(char operator);
unary_operator unary_op_factory(char operator);
binary_operator binary_op_factory(char operator);

void do_next_op(char operator, double operand, double* accumulator) {
    double result;

    if (is_op_binary(operator)){
        binary_operator op_func = binary_op_factory(operator);
        result = op_func(*accumulator, operand);
    }else{
        unary_operator op_func = unary_op_factory(operator);
        result = op_func(*accumulator);
    }

    *accumulator = result;
}

bool is_op_valid(char operator) {
    return operator == PLUS_OP ||
        operator == MINUS_OP ||
        operator == MULTIPLICATION_OP ||
        operator == DIVISION_OP ||
        operator == POWER_OP ||
        operator == SQUAREROOT_OP ||
        operator == NEGATE_OP ||
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
    switch (operator) {
        case PLUS_OP:
            return add;
        case MINUS_OP:
            return subtract;
        case MULTIPLICATION_OP:
            return multiply;
        case DIVISION_OP:
            return divide;
        case POWER_OP:
            return power;
        default:
            return NULL;
    }
}

unary_operator unary_op_factory(char operator) {
    switch (operator) {
        case SQUAREROOT_OP:
            return squareroot;
        case NEGATE_OP:
            return negate;
        case RECIPROCAL_OP:
            return reciprocal;
        case EXIT_OP:
            return quit;
        default:
            return NULL;
    }
}
