#include "calculator.h"
#include <assert.h>
#include <math.h>

/* Prototyper til test-funktioner */
void test_do_next_op_flip_sign(void);
void test_do_next_op_divide_by_10(void);
void test_do_next_op_example_sequence(void);
/* Prototype til en funktion der sammenligner doubles men tillader små afrundingsfejl. */
int is_almost_equal(double, double);

int main(void) {
    /* Kør alle test-funktioner. */
    test_do_next_op_flip_sign();
    test_do_next_op_divide_by_10();
    test_do_next_op_example_sequence();
}

/*********************************************
 * Skriv dine egne unit test af 'do_next_op' *
 *********************************************/
void test_do_next_op_flip_sign(void) {
    /* Arrange */
    double akkumulator = 20.0;

    /* Act */
    do_next_op('%', 0.0, &akkumulator);

    /* Assert */
    assert(is_almost_equal(akkumulator, -20.0));
}

void test_do_next_op_divide_by_10(void) {
    /* Arrange */
    double akkumulator = 10.0;

    /* Act */
    do_next_op('/', 10.0, &akkumulator);

    /* Assert */
    assert(is_almost_equal(akkumulator, 1.0));
}


/* Her har Morten implementeret regne-eksemplet fra opgavebeskrivelsen */
void test_do_next_op_example_sequence(void) {
    double akkumulator = 0.0;
    do_next_op('+', 5.0, &akkumulator);             /* Enter operator, and an optional operand: + 5.000000 */
    assert(is_almost_equal(akkumulator, 5.0));      /* Result so far is 5.000000. */

    do_next_op('-', 6.0, &akkumulator);             /* Enter operator, and an optional operand: - 6.000000 */
    assert(is_almost_equal(akkumulator, -1.0));     /* Result so far is -1.000000. */

    do_next_op('*', 3.0, &akkumulator);             /* Enter operator, and an optional operand: * 3.000000 */
    assert(is_almost_equal(akkumulator, -3.0));     /* Result so far is -3.000000. */

    do_next_op('#', 0.0, &akkumulator);             /* Enter operator, and an optional operand: # */
    assert(is_almost_equal(akkumulator, -3.0));     /* Result so far is -3.000000. */

    do_next_op('%', 0.0, &akkumulator);             /* Enter operator, and an optional operand: % */
    assert(is_almost_equal(akkumulator, 3.0));      /* Result so far is 3.000000. */

    do_next_op('#', 0.0, &akkumulator);             /* Enter operator, and an optional operand: # */
    assert(is_almost_equal(akkumulator, 1.732051)); /* Result so far is 1.732051. */

    do_next_op('^', 2.0, &akkumulator);             /* Enter operator, and an optional operand: ^ 2.000000 */
    assert(is_almost_equal(akkumulator, 3.0));      /* Result so far is 3.000000. */

    do_next_op('*', 4.0, &akkumulator);             /* Enter operator, and an optional operand: * 4.000000 */
    assert(is_almost_equal(akkumulator, 12.0));     /* Result so far is 12.000000. */

    do_next_op('!', 0.0, &akkumulator);             /* Enter operator, and an optional operand: ! */
    assert(is_almost_equal(akkumulator, 0.083333)); /* Result so far is 0.083333. */
}

/* Due to the inaccuracies (rounding errors) of operations on floating-point number,
 * we allow a small error in our comparison between the actual and expected values. */
int is_almost_equal(double actual, double expected) {
    return fabs(actual - expected) < 0.000001;
}
