#define __SFR_OFFSET 0
#include <avr/io.h>

.global display

.section .text
display:
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
        ret 