const std = @import("std");
const print = @import("std").debug.print;

pub fn main() !void {
    var final_value: i32 = calculate();

    print("\nYour final result is: {}", .{final_value});
}

pub fn calculate() i32 {
}
