const std = @import("std");
const print = @import("std").debug.print;

pub fn main() void {
    var final_value: i32 = calculate();

    print("\nYour final result is: {}", .{final_value});
}

pub fn calculate() i32 {
    var result: i32 = 123;

    while (true) {
        if (query_next_operation()) |op| {
            _ = op;
        } else |err| {
            _ = err;
        }

        // Do operation.

        print("Result so far: {d}\n", .{result});
    }

    return result;
}

pub fn query_next_operation() !Operation {
    print("Enter operator and an optional operand: ", .{});
    // Get operator.
    const stdin = std.io.getStdIn().reader();

    var buf: [std.mem.page_size]u8 = undefined;
    var line: []u8 = stdin.readUntilDelimiterOrEof(buf[0..], '\n');
    var iter = std.mem.split(u8, line, " ");

    var operator_symbol: ?[]u8 = iter.next();
    _ = operator_symbol;

    var operand: ?[]u8 = iter.next();
    print("{any}", .{operand});

    if (operand == null) {}
}

const Operation = struct {
    operator: u8,
    operand: ?i32,
};

pub fn unary_factory(operator: u8) ?fn (i32) i32 {
    _ = operator;
    // Return function for computing result of unary operator.
}

pub fn binary_factory(operator: u8) ?fn (i32, i32) i32 {
    _ = operator;
    // Return function for computing result of binary operator.
}
