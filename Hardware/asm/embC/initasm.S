#define __SFR_OFFSET 0
#include <avr/io.h>

.global init

.section .text

init:
	ldi r16,0b00100000
	OUT DDRB, r16
    LDI r16,0b00111100
    OUT DDRD, r16
    ; RET
    ldi r16, 05  ; Set prescaler to 1024 (101 in last 3 bits)
	out TCCR0B, r16      ; Configure Timer0
    ret
