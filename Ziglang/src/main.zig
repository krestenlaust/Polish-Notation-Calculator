const std = @import("std");
const print = std.debug.print;
const operators = @import("operators.zig");
const parsing = @import("parsing.zig");
const Operation = @import("operation.zig").Operation;

pub fn main() void {
    var final_value: f32 = calculate();

    print("\nYour final result is: {}", .{final_value});
}

fn calculate() f32 {
    var accumulator: f32 = 0;

    while (true) {
        if (query_next_operation()) |op| {
            if (do_operation(op, accumulator)) |result| {
                accumulator = result;
            } else |err| switch (err) {
                operators.OperationError.DivideByZero => {
                    print("Divide by zero\n", .{});
                    continue;
                },
                operators.OperationError.ExitProgram => {
                    print("Exit program\n", .{});
                    break;
                },
            }

            print("Result so far: {d}\n", .{accumulator});
        } else |err| {
            print("Error: {any}\n", .{err});
        }
    }

    return accumulator;
}

fn do_operation(operation: Operation, first_operand: f32) operators.OperationError!f32 {
    // We expect operation to only contain valid operators.
    const operator_info = operators.get_operator_info(operation.operator) catch unreachable;

    if (operator_info == 1) {
        const unary_func = operators.unary_factory(operation.operator) catch unreachable;

        return unary_func(first_operand);
    }

    const binary_func = operators.binary_factory(operation.operator) catch unreachable;
    return binary_func(first_operand, operation.operand.?);
}

fn query_next_operation() !Operation {
    print("Enter operator and an optional operand: ", .{});
    // Get operator.
    const stdin = std.io.getStdIn().reader();

    var buf: [std.mem.page_size]u8 = undefined;
    var line: []u8 = try stdin.readUntilDelimiter(buf[0..], '\n');

    // Ignore errors as specified in task.
    return try parsing.parse_operation_input(line);
}
