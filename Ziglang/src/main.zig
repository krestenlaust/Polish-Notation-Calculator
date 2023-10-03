const std = @import("std");
const print = @import("std").debug.print;

pub fn main() void {
    var final_value: f32 = calculate();

    print("\nYour final result is: {}", .{final_value});
}

pub fn calculate() f32 {
    var result: f32 = 123;

    while (true) {
        if (query_next_operation()) |op| {
            result = do_operation(op, result);
            print("Result so far: {d}\n", .{result});
        } else |err| {
            print("Error: {any}", .{err});
        }
    }

    return result;
}

const ParseOperationError = error{
    InvalidOperator,
    InvalidOperand,
    WrongOperandAmount,
    NoInput,
};

const Operation = struct {
    operator: u8,
    operand: ?f32,
};

pub fn do_operation(operation: Operation, first_operand: f32) f32 {
    _ = first_operand;
    _ = operation;
    return 1234;
}

pub fn query_next_operation() !Operation {
    print("Enter operator and an optional operand: ", .{});
    // Get operator.
    const stdin = std.io.getStdIn().reader();

    var buf: [std.mem.page_size]u8 = undefined;
    var line: []u8 = try stdin.readUntilDelimiter(buf[0..], '\n');

    // Ignore errors as specified in task.
    return try parse_operation(line);
}

fn parse_operation(operation_string: []const u8) ParseOperationError!Operation {
    var iter = std.mem.split(u8, operation_string, " ");

    var first_parameter: ?[]const u8 = iter.next();

    // No input provided.
    if (first_parameter == null) {
        return ParseOperationError.NoInput;
    }

    if (std.mem.len(first_parameter.?) != 1) {
        return ParseOperationError.InvalidOperator;
    }

    var operator_symbol: u8 = first_parameter.?[0];
    var operand_count: ?i32 = get_operator_info(operator_symbol);

    // Operator not recognized.
    if (operand_count == null) {
        return ParseOperationError.InvalidOperator;
    }

    var second_parameter: ?[]const u8 = iter.next();
    if (second_parameter == null) {
        if (operand_count.? > 1) {
            return ParseOperationError.WrongOperandAmount;
        }

        return Operation{
            .operator = operator_symbol,
            .operand = null,
        };
    }

    var operand_value: f32 = std.fmt.parseFloat(f32, second_parameter.?) catch return ParseOperationError.InvalidOperand;

    return Operation{
        .operator = operator_symbol,
        .operand = operand_value,
    };
}

pub fn get_operator_info(operator: u8) ?i32 {
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
        else => null,
    };
}

pub fn unary_factory(operator: u8) ?fn (i32) i32 {
    _ = operator;
    // Return function for computing result of unary operator.
}

pub fn binary_factory(operator: u8) ?fn (i32, i32) i32 {
    _ = operator;
    // Return function for computing result of binary operator.
}
