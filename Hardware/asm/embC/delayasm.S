#define __SFR_OFFSET 0
#include <avr/io.h>

.global delay

.section .text

delay:
    in r16, TIFR0         ; read Timer0 interrupt flag
    ldi r17, 0b00000010   ; mask for overflow flag (bit 1)
    and r16, r17          ; check if overflow occurred
    breq delay            ; wait until Timer0 overflows
    out TIFR0, r17        ; clear overflow flag
    dec r24               ; decrement loop counter
    brne delay            ; repeat until counter is zero
    ret                   ; return from subroutine
