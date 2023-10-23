#pragma once

#include "concrete_operators.h"
#include <stdio.h>
#include <stdbool.h>

#define MINUS_OP '-'
#define PLUS_OP '+'
#define MULTIPLICATION_OP '*'
#define DIVISION_OP '/'
#define POWER_OP '^'

#define SQUAREROOT_OP '#'
#define NEGATE_OP '%'
#define RECIPROCAL_OP '!'
#define EXIT_OP 'q'

typedef double (*binary_operator) (double, double);
typedef double (*unary_operator) (double);

void do_next_op(char operator, double operand, double* accumulator);
bool is_op_valid(char operator);
bool is_op_binary(char operator);