const std = @import("std");
const print = @import("std").debug.print;
const operators = @import("operators.zig");
const parsing = @import("parsing.zig");
const Operation = @import("operation.zig").Operation;

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

pub fn do_operation(operation: Operation, first_operand: f32) !f32 {
    const operator_info: i32 = try operators.get_operator_info(operation.operator);

    if (operator_info == 1) {
        const unary_func = try operators.unary_factory(operation.operator);

        return unary_func(first_operand);
    }

    const binary_func = try operators.binary_factory(operation.operator);

    return binary_func(first_operand, operation.operand);
}

pub fn query_next_operation() !Operation {
    print("Enter operator and an optional operand: ", .{});
    // Get operator.
    const stdin = std.io.getStdIn().reader();

    var buf: [std.mem.page_size]u8 = undefined;
    var line: []u8 = try stdin.readUntilDelimiter(buf[0..], '\n');

    // Ignore errors as specified in task.
    return try parsing.parse_operation_input(line);
}
