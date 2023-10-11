const OperatorFactoryError: type = error{
    InvalidOperator,
};

const OperationError: type = error{
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

pub fn unary_factory(operator_type: u8) OperatorFactoryError!fn (f32) OperationError!f32 {
    _ = operator_type;
    // Return function for computing result of unary operator.

    return OperatorFactoryError.InvalidOperator;
}

pub fn binary_factory(operator_type: u8) OperatorFactoryError!fn (f32, f32) OperationError!f32 {
    // Return function for computing result of binary operator.
    return switch (operator_type) {
        '+' => plus_operator,
        else => OperatorFactoryError.InvalidOperator,
    };
}

fn plus_operator(operand1: f32, operand2: f32) OperationError!f32 {
    return operand1 + operand2;
}
