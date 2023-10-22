#include <stdbool.h>

#define MINUS_OP '-'
#define PLUS_OP '+'
#define MULTIPLICATION_OP '*'
#define DIVISION_OP '/'
#define POWER_OP '^'

#define SQUAREROOT_OP '#'
#define FLIP_SIGN_OP '%'
#define RECIPROCAL_OP '!'
#define EXIT_OP 'q'

typedef double (*binary_operator) (double, double);
typedef double (*unary_operator) (double);

void do_next_op(char operator, double operand, double* akkumulator);
