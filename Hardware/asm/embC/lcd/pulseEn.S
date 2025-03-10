#define __SFR_OFFSET 0
#include <avr/io.h>

.global pulseEn
.section .text
pulseEn:
    ; ldi r16, 0b00000010
    sbi PORTB, 1
    ldi r19, 0xFF
    ldi r20, 0x28
    rcall loop
    cbi PORTB, 1
loop:
    dec r19
    brne loop
    dec r20
    brne loop
    ret