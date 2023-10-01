const std = @import("std");
const print = @import("std").debug.print;

pub fn main() !void {
    var final_value: i32 = calculate();

    print("\nYour final result is: {}", .{final_value});
}

pub fn calculate() i32 {
    var result: i32 = 123;

    while (true) {
        var op = query_next_operation();
        _ = op;

        // Do operation.

        print("Result so far: {d}\n", .{result});
    }

    return result;
}

pub fn query_next_operation() Operation {
    print("Enter operator and an optional operand: ", .{});
    // Get operator.
}

const Operation = struct {
    operator: u8,
    operand: ?i32,
};
