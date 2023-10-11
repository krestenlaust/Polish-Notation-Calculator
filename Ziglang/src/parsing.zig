const std = @import("std");
const Operation = @import("operation.zig").Operation;
const operators = @import("operators.zig");

pub const ParseOperationError = error{
    InvalidOperator,
    InvalidOperand,
    WrongOperandAmount,
    NoInput,
};

pub fn parse_operation_input(operation_string: []const u8) ParseOperationError!Operation {
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
    var operand_count: i32 = operators.get_operator_info(operator_symbol) catch return ParseOperationError.InvalidOperator;

    var second_parameter: ?[]const u8 = iter.next();
    if (second_parameter == null) {
        if (operand_count > 1) {
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
