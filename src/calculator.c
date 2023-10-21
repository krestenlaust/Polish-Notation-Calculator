#include "calculator.h"

void do_next_op(char operator, double operand, double* akkumulator) {

}

bool is_op_valid(char operator) {

}

bool is_op_binary(char operator) {
    return operator == '+' || operator == '-' || operator == '*' || operator == '/' || operator == '^';
}

binary_operator binary_op_factory(char operator){

}

unary_operator unary_op_factory(char operator) {

}

unary_operator partial_binary_op(binary_operator op, double second_operand) {
    
}