use std::error::Error;

fn main() {
    println!("Hello, world!");
}

fn calculate() -> f32 {
    let mut accumulator: f32 = 0.0;

    while true {
        match query_next_operation() {
            Ok(op) => {
                match do_operation(op, accumulator) {
                    Ok(result) => accumulator = result,
                    Err(e) => {
                        
                    },
                }
            },
            Err(e) => println!("Error: {}", e),
        }
    }

    accumulator
}

fn query_next_operation() -> Result<Operation, Error> {
    println!("Enter operator and an optional operand: ");


}

struct Operation {
    operator: char,
    operand: f32,
}