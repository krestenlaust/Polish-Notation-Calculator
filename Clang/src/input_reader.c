#include "input_reader.h"

operation scan_data(void){
    char operator_character;

    do {
        scanf("%c", &operator_character, sizeof(char));
    } while (!is_op_valid(operator_character));

    double operand_input = 0.0;
    if (is_op_binary(operator_character)){
        scanf("%lf", &operand_input);
    }

    // Flush input buffer to not leave mistakenly inputted operands for unary operators,
    // be read as operator the next time scan_data is called.
    fflush(stdin);

    // Went with this syntax, because I couldn't figure out how to
    // initialize a struct declared using typedef.
    operation result = {};
    result.operator = operator_character;
    result.operand = operand_input;

    return result;
}