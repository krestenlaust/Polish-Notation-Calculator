#pragma once

#include <stdio.h>
#include "calculator.h"

typedef struct {
    char operator;
    double operand;
} operation;

operation scan_data(void);