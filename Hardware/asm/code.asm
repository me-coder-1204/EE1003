;7447 decoder i/o
; regs in use:  r16,17,18,19,25,27,26, 24
; reg in use for delay: r28, r29, r30,r31
.include "m328Pdef.inc"
; setup for the delay:
	    ldi r25, 0b00100000
	    out DDRB, r25
	    ldi r25, 0b00111100
	    out DDRD, r25
	    ;ldi r25, 0b00000000
	    ;out PORTB, r25
	    clr r25
	    ldi r16, 05  ; Set prescaler to 1024 (101 in last 3 bits)
	    out TCCR0B, r16      ; Configure Timer0
	    
	    
	    
	
loop:
	    in r26, PINB ; taking input
	    ;lsr r26
	    ;lsr r26
	    mov r16, r26 ; setting the bits for W	 
	    andi r16, 0b00000001
	    ; X
	    mov r17, r26
	    lsr r17
	    andi r17, 0b00000001 
	    ; Y
	    mov r18, r26
	    lsr r18
	    lsr r18 	    	    
	    andi r18, 0b00000001 
	    ; Z
	    mov r19, r26
	    lsr r19
	    lsr r19
	    lsr r19
	    andi r19, 0b00000001 
	    
	    
	    ;ldi r16, 01
	    ;ldi r17, 01
	    ;ldi r18, 00
	    ;ldi r19, 00
	    
	    ; temp vars are r24,25,26,31
	    mov r20, r16
	    com r20 ; compute A = W'
	    
	    ; B value computation (WX'Z' + W'X) 
	    mov r21, r17
	    com r21
	    and r21, r16
	    mov r24, r19
	    com r24
	    and r21, r24 ;(WX'Z')
	    mov r24, r17
	    and r24, r20
	    or r21, r24
            
            
	    ; C(r22) value Computation(X'Y + YW' + XWY')
	    mov r22, r17
	    com r22
	    or r22, r20
	    and r22, r18
	    mov r24, r18
	    com r24
	    and r24, r16
	    and r24, r17
	    or r22, r24	 	

	    ;D(r23) value Computation(W'Z + WXY)
	    mov r24, r16
	    and r24, r17
	    and r24, r18
	    mov r23, r19
	    and r23, r20
	    or r23, r24

	    ;we need to get it so that on the last bit has a value and remaining has 0
	    andi r23, 0b00000001
	    andi r22, 0b00000001	
	    andi r21, 0b00000001	
	    andi r20, 0b00000001		
	    lsl r23
	    lsl r23
	    lsl r23
	    lsl r22
	    lsl r22
	    lsl r21
	    mov r24, r20
	    or r24, r22
            or r24, r21
            or r24, r23	
            ; final output

		lsl	r24
		lsl r24
	    out PORTD, r24
	    ;at the end, we get A->D in r20->r23
	    

	    ;ori r24, 0b00100000   
	    ;out PORTB, r24        ; Update PORTB
	    sbi PORTB, 5
	    ldi r19, 42           ; Loop count for ~500ms delay
	    rcall PAUSE           ; Call delay function

	    ;andi r24, 0b00001111  
	    ;out PORTB, r24        ; Update PORTB
	    cbi PORTB, 5
	    ldi r19, 42           ; Loop count for ~500ms delay
	    rcall PAUSE           ; Call delay function
		; lsr	r24
		; lsr	r24
	    ; mov r26, r24;

		;in	r26, PORTB
	    ;lsl r26
	    ;lsl r26
	rjmp loop

PAUSE:                    ; Delay function (~500ms)
lp2:
    in r16, TIFR0         ; read Timer0 interrupt flag
    ldi r17, 0b00000010   ; mask for overflow flag (bit 1)
    and r16, r17          ; check if overflow occurred
    breq PAUSE            ; wait until Timer0 overflows
    out TIFR0, r17        ; clear overflow flag
    dec r19               ; decrement loop counter
    brne lp2              ; repeat until counter is zero
    ret                   ; return from subroutine

