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
        else => OperatorFactoryError.InvalidOperator,
    };
}

pub fn binary_factory(operator_type: u8) OperatorFactoryError!*const fn (f32, f32) OperationError!f32 {
    // Return function for computing result of binary operator.
    return switch (operator_type) {
        '+' => plus_operator,
        else => OperatorFactoryError.InvalidOperator,
    };
}

fn plus_operator(summand1: f32, summand2: f32) OperationError!f32 {
    return summand1 + summand2;
}

fn squareroot_operator(radicand: f32) OperationError!f32 {
    return math.Sqrt(radicand);
}
