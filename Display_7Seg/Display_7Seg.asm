.include "m32def.inc" 
 
.CSEG 
.ORG $0000 

 
 
 rjmp Start 
 
Start: 
	ldi r16,high(RAMEND)    ;Creación de la pila 
	out SPH, r16 
	ldi r16, low(RAMEND) 
	out SPL, r16 

	ldi r16, 0b11111111
	out DDRC, r16  
	ldi r16, 0b00000000
	out DDRB, r16
	ldi r16, 0b00001111 
	out DDRA, r16 

	ldi r16, 0b00000001
	out PORTA, r16

Programa:
	
	sbis PINB, 1
	
	rjmp Programa

	/**/
	ldi r16, 0b00000001
	out PORTA, r16

	rcall Numero9
	rcall Retardo
	
	/**/
	ldi r16, 0b00000010
	out PORTA, r16

	rcall Numero8
	rcall Retardo

	/**/
	ldi r16, 0b00000100
	out PORTA, r16

	rcall Numero7
	rcall Retardo

	/**/
	ldi r16, 0b00001000
	out PORTA, r16

	rcall Numero6
	rcall Retardo

	/**/
	ldi r16, 0b00000100
	out PORTA, r16

	rcall Numero5
	rcall Retardo

	/**/
	ldi r16, 0b00000010
	out PORTA, r16

	rcall Numero4
	rcall Retardo

	/**/
	ldi r16, 0b00000001
	out PORTA, r16

	rcall Numero3
	rcall Retardo

	/**/
	ldi r16, 0b00000010
	out PORTA, r16

	rcall Numero2
	rcall Retardo

	/**/
	ldi r16, 0b00000100
	out PORTA, r16

	rcall Numero1
	rcall Retardo

	/**/
	ldi r16, 0b00001111
	out PORTA, r16

	rcall Numero0
	rcall Retardo

	rcall NoNumb

	rjmp Programa


NoNumb:

	ldi r16, 0b00000000
	out PORTC, r16
	ret


Numero0:

	ldi r16, 0b00111111
	out PORTC, r16
	ret

Numero1:

	ldi r16, 0b00000110
	out PORTC, r16
	ret

Numero2:

	ldi r16, 0b01011011
	out PORTC, r16
	ret

Numero3:

	ldi r16, 0b01001111
	out PORTC, r16
	ret
Numero4:

	ldi r16, 0b01100110
	out PORTC, r16
	ret

Numero5:

	ldi r16, 0b01101101
	out PORTC, r16
	ret

Numero6:

	ldi r16, 0b01111101
	out PORTC, r16
	ret

Numero7:

	ldi r16, 0b00000111
	out PORTC, r16
	ret

Numero8:

	ldi r16, 0b01111111
	out PORTC, r16
	ret

Numero9:

	ldi r16, 0b01100111
	out PORTC, r16
	ret

Retardo: 
		ldi r20, 10

		bucle1:

			ldi r19, 100
		
		bucle2:

			ldi r18, 255

		bucle3:

			dec r18
			BRNE bucle3
			dec r19
			BRNE bucle2
			dec r20
			BRNE bucle1
			ret 