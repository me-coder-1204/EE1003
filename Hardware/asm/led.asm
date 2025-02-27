        .include    "m328Pdef.inc"

        .cseg
        .org    0x00

        ldi     r16,(1<<PIND2)
        ori     r16,(1<<PIND3)
        ori     r16,(1<<PIND4)
        ori     r16,(1<<PIND5)
        sbi     DDRB, 5
        ; ldi     r16, 0b00111100
        out     DDRD, r16
loop:   
        ldi     r17, 0b00000000
        out     PORTD, r17
        rjmp    loop