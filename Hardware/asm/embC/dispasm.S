#define __SFR_OFFSET 0
#include <avr/io.h>

.global clock

.section .text

clock:
    ldi  r16, 0b00100000
    in  r17, PINB
    eor r17, r16
    out PORTB, r17
    ret