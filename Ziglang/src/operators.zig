const std = @import("std");
const math = std.math;

pub const OperatorFactoryError: type = error{
    InvalidOperator,
};

pub const OperationError: type = error{
    DivideByZero,
    ExitProgram,
};

pub fn get_operator_info(operator: u8) OperatorFactoryError!i32 {
    return switch (operator) {
        '+' => 2,
        '-' => 2,
        '*' => 2,
        '/' => 2,
        '^' => 2,
        '#' => 1,
        '%' => 1,
        '!' => 1,
        'q' => 1,
        else => OperatorFactoryError.InvalidOperator,
    };
}

pub fn unary_factory(operator_type: u8) OperatorFactoryError!*const fn (f32) OperationError!f32 {
    return switch (operator_type) {
        '#' => squareroot_operator,
        '%' => flip_sign_operator,
        '!' => division_of_1_operator,
        'q' => quit_operator,
        else => OperatorFactoryError.InvalidOperator,
    };
}

fn squareroot_operator(radicand: f32) OperationError!f32 {
    return @sqrt(radicand);
}

fn flip_sign_operator(value: f32) OperationError!f32 {
    return value * -1;
}

fn division_of_1_operator(divisor: f32) OperationError!f32 {
    return 1 / divisor;
}

fn quit_operator(_: f32) OperationError!f32 {
    return OperationError.ExitProgram;
}

pub fn binary_factory(operator_type: u8) OperatorFactoryError!*const fn (f32, f32) OperationError!f32 {
    // Return function for computing result of binary operator.
    return switch (operator_type) {
        '+' => addition_operator,
        '-' => subtraction_operator,
        '*' => multiplication_operator,
        '/' => division_operator,
        '^' => exponent_operator,
        else => OperatorFactoryError.InvalidOperator,
    };
}

fn addition_operator(summand1: f32, summand2: f32) OperationError!f32 {
    return summand1 + summand2;
}

fn subtraction_operator(subtrahend: f32, minuend: f32) OperationError!f32 {
    return subtrahend - minuend;
}

fn multiplication_operator(multiplicand: f32, multiplicator: f32) OperationError!f32 {
    return multiplicand * multiplicator;
}

fn division_operator(dividend: f32, divisor: f32) OperationError!f32 {
    return dividend / divisor;
}

fn exponent_operator(base: f32, exponent: f32) OperationError!f32 {
    return math.pow(f32, base, exponent);
}
