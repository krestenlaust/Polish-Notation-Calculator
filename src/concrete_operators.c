//
// Created by kress on 23-10-2023.
//
#include "concrete_operators.h"
#include <math.h>
#include <stdlib.h>

double add(double x, double y){
    return x + y;
}

double subtract(double x, double y) {
    return x - y;
}

double multiply(double x, double y){
    return x * y;
}

double divide(double x, double y) {
    if (y == 0) {
        // Return accumulator.
        return x;
    }

    return x / y;
}

double power(double x, double y){
    return pow(x, y);
}

double squareroot(double x){
    if (x < 0){
        // Return accumulator.
        return x;
    }

    return sqrt(x);
}

double negate(double x) {
    return -x;
}

double reciprocal(double x){
    if (x == 0){
        // Return accumulator.
        return x;
    }

    return 1 / x;
}

double quit(double x){
    // Since the Quit operator is considered unary (and not nullary)
    // it's only natural for it to make use of its operand.
    // Normally, I'd have a struct represent a more complex result ( 'Maybe(double)' otherwise quit ).
    // NOTE: This impure function disrupts the control flow in the application.
    printf("The final result is: %lf", x);
    exit(EXIT_SUCCESS);
}