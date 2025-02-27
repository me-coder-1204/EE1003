        .include    "./m328Pdef.inc"

        .cseg
        .org    0x00
        .def    mask = r20
        .def    ledWrite = r18

        

start:
        ; ldi     r16, (1<<PINB5)
        ; out     DDRB, r16
        sbi     DDRB, 5
        ldi     r16, 0b00000101
        out     TCCR0B, r16

        clr     ledWrite
        ldi     mask, (1<<PINB5)

loop:
        eor     ledWrite, mask
        out     PORTB, ledWrite
        ldi     r19, 0b00100000
        rcall    PAUSE
        rjmp    loop
PAUSE:  
lp2:
        ; push    r16
        ; push    r17
        in      r16, TIFR0
        ldi     r17, 0b00000010
        and     r16, r17
        breq    PAUSE
        out     TIFR0, r17
        dec     r19
        brne    lp2

        ; pop     r17
        ; pop     r16

        ret

