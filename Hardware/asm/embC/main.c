// #include <avr/m328Pdef.inc>
#include <avr/io.h>
#include <util/delay.h>

extern void init(void);
extern void clock(void);
extern void delay(uint8_t);
extern void display(void);

int main(void){

    init();
    while(1){
        display();

        clock();
        delay(32);

        clock();
        delay(32);
    }
    return 0;
}