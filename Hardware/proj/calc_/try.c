#include "tinyexpr.h"
// #include "mathN.h"
// #include <math.h>
#include <stdio.h>

int main(void){
    // printf("%lf", te_interp("2^3", 0));
    // printf("%lf", arcsin_cordic(PI/4));
    // float d = 2.5;
    // char a[10] = {};
    // sprintf(a, "%f", d);
    // printf(a);
    char a[] = "2+2";
    float b = te_interp(a, 0);
    // printf("%f", b);
    char c[10] = "";
    sprintf(c, "%f", b);
    printf(c);
}