const std = @import("std");
const print = @import("std").debug.print;
const operators = @import("operators.zig");

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

const Operation = struct {
    operator: u8,
    operand: ?f32,
};

const ParseOperationError = error{
    InvalidOperator,
    InvalidOperand,
    WrongOperandAmount,
    NoInput,
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
    return try parse_operation_input(line);
}

fn parse_operation_input(operation_string: []const u8) ParseOperationError!Operation {
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
    var operand_count: operators.OperatorFactoryError!i32 = operators.get_operator_info(operator_symbol);

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
