#pragma once

#include <stdio.h>
#include <stdbool.h>
#include "calculator.h"
#include "input_reader.h"

double run_calculator();

int main(void) {
    double result = run_calculator();
}

double run_calculator(void){
    // declare mutable variables
    double accumulator = 0.0;

    while (true) {
        printf("\nEnter operator, and an optional operand: ");

        // retrieve operation information (read and parse user input)
        operation op = scan_data();

        // pass operation to do_next_op and return result
        do_next_op(op.operator, op.operand, &accumulator);

        // inform user of calculator state / output accumulator
        printf("\nResult so far is %lf", accumulator);
    }

    // Never reached, since quit is unary.
    return accumulator;
}
