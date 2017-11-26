;                                                           Hex     Com       Args          Size
			
codes db 	05h, rNBB,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 00	ADD 	r/m, reg		Byte
			05h, rNBB,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 01	ADD 	r/m, reg		Word
			05h, rNBB,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 02	ADD 	reg, r/m		Byte
			05h, rNBB,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 03	ADD 	reg, r/m		Word
			05h, rNBB,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 04	ADD 	AL, LSB			Byte
			05h, rNBB,001h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 05	ADD 	AX, MSB LSB		Word
			44h, rSEG,000h,wNAM,wSEG,  0h,  0h,  0h,  0h,0,	; 06	PUSH	ES
			42h, rSEG,000h,wNAM,wSEG,  0h,  0h,  0h,  0h,0,	; 07	POP		ES
			
			40h, rNBB,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 08	OR 		r/m, reg		Byte
			40h, rNBB,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 09	OR 		r/m, reg		Word
			40h, rNBB,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 0A	OR 		reg, r/m		Byte
			40h, rNBB,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 0B	OR 		reg, r/m		Word
			40h, rNBB,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 0C	OR 		AL, LSB			Byte
			40h, rNBB,001h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 0D	OR 		AX, MSB LSB		Word
			44h, rSEG,001h,wNAM,wSEG,  0h,  0h,  0h,  0h,0,	; 0E	PUSH	CS
			42h, rSEG,001h,wNAM,wSEG,  0h,  0h,  0h,  0h,0,	; 0F	POP		CS
			
			04h, rNBB,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 10	ADC		r/m, reg		Byte
			04h, rNBB,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 11	ADC		r/m, reg		Word
			04h, rNBB,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 12	ADC		reg, r/m		Byte
			04h, rNBB,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 13	ADC		reg, r/m		Word
			04h, rNBB,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 14	ADC		AL, LSB			Byte
			04h, rNBB,001h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 15	ADC		AX, MSB LSB		Word
			44h, rSEG,002h,wNAM,wSEG,  0h,  0h,  0h,  0h,0,	; 16	PUSH	SS
			42h, rSEG,002h,wNAM,wSEG,  0h,  0h,  0h,  0h,0,	; 17	POP		SS
			
			50h, rNBB,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 18	SBB 	r/m, reg		Byte
			50h, rNBB,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 19	SBB 	r/m, reg		Word
			50h, rNBB,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 1A	SBB 	reg, r/m		Byte
			50h, rNBB,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 1B	SBB 	reg, r/m		Word
			50h, rNBB,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 1C	SBB 	AL, LSB			Byte
			50h, rNBB,001h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 1D	SBB 	AX, MSB LSB		Word
			44h, rSEG,003h,wNAM,wSEG,  0h,  0h,  0h,  0h,0,	; 1E	PUSH	DS
			42h, rSEG,003h,wNAM,wSEG,  0h,  0h,  0h,  0h,0,	; 1F	POP		DS
			
			06h, rNBB,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 20	AND		r/m, reg		Byte
			06h, rNBB,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 21	AND		r/m, reg		Word
			06h, rNBB,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 22	AND		reg, r/m		Byte
			06h, rNBB,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 23	AND		reg, r/m		Word
			06h, rNBB,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 24	AND		AL, LSB			Byte
			06h, rNBB,001h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 25	AND		AX, MSB LSB		Word
			00h, rSEG,000h,sPRE,  0h,  0h,  0h,  0h,  0h,0,	; 26	Prefix	ES
			11h, wNAM,000h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 27	DAA		
			
			5Eh, rNBB,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 28	SUB		r/m, reg		Byte
			5Eh, rNBB,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 29	SUB		r/m, reg		Word
			5Eh, rNBB,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 2A	SUB		reg, r/m		Byte
			5Eh, rNBB,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 2B	SUB		reg, r/m		Word
			5Eh, rNBB,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 2C	SUB		AL, LSB			Byte
			5Eh, rNBB,001h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 2D	SUB		AX, MSB LSB		Word
			00h, rSEG,001h,sPRE,  0h,  0h,  0h,  0h,  0h,0,	; 2E	Prefix	CS
			12h, wNAM,000h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 2F	DAS	
			
			63h, rNBB,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 30	XOR		r/m, reg		Byte
			63h, rNBB,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 31	XOR		r/m, reg		Word
			63h, rNBB,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 32	XOR		reg, r/m		Byte
			63h, rNBB,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 33	XOR		reg, r/m		Word
			63h, rNBB,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 34	XOR		AL, LSB			Byte
			63h, rNBB,001h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 35	XOR		AX, MSB LSB		Word
			00h, rSEG,002h,sPRE,  0h,  0h,  0h,  0h,  0h,0,	; 36	Prefix	SS
			00h, wNAM,000h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 37	AAA	
			
			0Dh, rNBB,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 38	CMP		r/m, reg		Byte
			0Dh, rNBB,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 39	CMP		r/m, reg		Word
			0Dh, rNBB,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 3A	CMP		reg, r/m		Byte
			0Dh, rNBB,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 3B	CMP		reg, r/m		Word
			0Dh, rNBB,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 3C	CMP		AL, LSB			Byte
			0Dh, rNBB,001h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 3D	CMP		AX, MSB LSB		Word
			00h, rSEG,003h,sPRE,  0h,  0h,  0h,  0h,  0h,0,	; 3E	Prefix	DS
			03h, wNAM,000h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 3F	AAS	

			19h, rNBB,001h,rREG,000h,wNAM,wREG,  0h,  0h,0,	; 40	INC		AX				Word
			19h, rNBB,001h,rREG,001h,wNAM,wREG,  0h,  0h,0,	; 41	INC		CX				Word
			19h, rNBB,001h,rREG,002h,wNAM,wREG,  0h,  0h,0,	; 42	INC		DX				Word
			19h, rNBB,001h,rREG,003h,wNAM,wREG,  0h,  0h,0,	; 43	INC		BX				Word
			19h, rNBB,001h,rREG,004h,wNAM,wREG,  0h,  0h,0,	; 44	INC		SP				Word
			19h, rNBB,001h,rREG,005h,wNAM,wREG,  0h,  0h,0,	; 45	INC		BP				Word
			19h, rNBB,001h,rREG,006h,wNAM,wREG,  0h,  0h,0,	; 46	INC		SI				Word
			19h, rNBB,001h,rREG,007h,wNAM,wREG,  0h,  0h,0,	; 47	INC		DI				Word

			13h, rNBB,001h,rREG,000h,wNAM,wREG,  0h,  0h,0,	; 48	DEC		AX				Word
			13h, rNBB,001h,rREG,001h,wNAM,wREG,  0h,  0h,0,	; 49	DEC		CX				Word
			13h, rNBB,001h,rREG,002h,wNAM,wREG,  0h,  0h,0,	; 4A	DEC		DX				Word
			13h, rNBB,001h,rREG,003h,wNAM,wREG,  0h,  0h,0,	; 4B	DEC		BX				Word
			13h, rNBB,001h,rREG,004h,wNAM,wREG,  0h,  0h,0,	; 4C	DEC		SP				Word
			13h, rNBB,001h,rREG,005h,wNAM,wREG,  0h,  0h,0,	; 4D	DEC		BP				Word
			13h, rNBB,001h,rREG,006h,wNAM,wREG,  0h,  0h,0,	; 4E	DEC		SI				Word
			13h, rNBB,001h,rREG,007h,wNAM,wREG,  0h,  0h,0,	; 4F	DEC		DI				Word
			
			44h, rNBB,001h,rREG,000h,wNAM,wREG,  0h,  0h,0,	; 50	PUSH	AX				Word
			44h, rNBB,001h,rREG,001h,wNAM,wREG,  0h,  0h,0,	; 51	PUSH	CX				Word
			44h, rNBB,001h,rREG,002h,wNAM,wREG,  0h,  0h,0,	; 52	PUSH	DX				Word
			44h, rNBB,001h,rREG,003h,wNAM,wREG,  0h,  0h,0,	; 53	PUSH	BX				Word
			44h, rNBB,001h,rREG,004h,wNAM,wREG,  0h,  0h,0,	; 54	PUSH	SP				Word
			44h, rNBB,001h,rREG,005h,wNAM,wREG,  0h,  0h,0,	; 55	PUSH	BP				Word
			44h, rNBB,001h,rREG,006h,wNAM,wREG,  0h,  0h,0,	; 56	PUSH	SI				Word
			44h, rNBB,001h,rREG,007h,wNAM,wREG,  0h,  0h,0,	; 57	PUSH	DI				Word

			42h, rNBB,001h,rREG,000h,wNAM,wREG,  0h,  0h,0,	; 58	POP		AX				Word
			42h, rNBB,001h,rREG,001h,wNAM,wREG,  0h,  0h,0,	; 59	POP		CX				Word
			42h, rNBB,001h,rREG,002h,wNAM,wREG,  0h,  0h,0,	; 5A	POP		DX				Word
			42h, rNBB,001h,rREG,003h,wNAM,wREG,  0h,  0h,0,	; 5B	POP		BX				Word
			42h, rNBB,001h,rREG,004h,wNAM,wREG,  0h,  0h,0,	; 5C	POP		SP				Word
			42h, rNBB,001h,rREG,005h,wNAM,wREG,  0h,  0h,0,	; 5D	POP		BP				Word
			42h, rNBB,001h,rREG,006h,wNAM,wREG,  0h,  0h,0,	; 5E	POP		SI				Word
			42h, rNBB,001h,rREG,007h,wNAM,wREG,  0h,  0h,0,	; 5F	POP		DI				Word
			
			00h,   0h,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 60	NO COMMAND
			00h,   0h,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 61	NO COMMAND
			00h,   0h,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 62	NO COMMAND
			00h,   0h,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 63	NO COMMAND
			00h,   0h,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 64	NO COMMAND
			00h,   0h,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 65	NO COMMAND
			00h,   0h,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 66	NO COMMAND
			00h,   0h,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 67	NO COMMAND
			
			00h,   0h,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 68	NO COMMAND
			00h,   0h,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 69	NO COMMAND
			00h,   0h,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 6A	NO COMMAND
			00h,   0h,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 6B	NO COMMAND
			00h,   0h,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 6C	NO COMMAND
			00h,   0h,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 6D	NO COMMAND
			00h,   0h,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 6E	NO COMMAND
			00h,   0h,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 6F	NO COMMAND
			
			2Ah, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0,	; 70	JO		IP+offset
			27h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0,	; 71	JNO		IP+offset
			1Fh, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0,	; 72	JB		IP+offset
			1Eh, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0,	; 73	JNB		IP+offset
			2Eh, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0,	; 74	JE		IP+offset
			29h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0,	; 75	JNE		IP+offset
			20h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0,	; 76	JNA		IP+offset
			1Dh, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0,	; 77	JA		IP+offset
			
			2Dh, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0,	; 78	JS		IP+offset
			28h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0,	; 79	JNS		IP+offset
			2Bh, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0,	; 7A	JP		IP+offset
			2Ch, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0,	; 7B	JNP		IP+offset
			24h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0,	; 7C	JL		IP+offset
			23h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0,	; 7D	JNL		IP+offset
			25h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0,	; 7E	JNG		IP+offset
			22h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0,	; 7F	JG		IP+offset
			
			00h, rNBB,000h,rMWN,rILM,wNAM,wROM,wCOM,wIML,0,	; 80	Comm depends on code	Byte
			00h, rNBB,001h,rMWN,rILM,wNAM,wROM,wCOM,wIML,0,	; 81	Comm depends on code	Word
			00h, rNBB,002h,rMWN,rILM,wNAM,wROM,wCOM,wIML,0,	; 82	Comm depends on code	Byte
			00h, rNBB,003h,rMWN,rILM,wNAM,wROM,wCOM,wIML,0,	; 83	Comm depends on code	Word
			5Fh, rNBB,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 84	TEST	reg, r/m		Byte
			5Fh, rNBB,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 85	TEST	reg, r/m		Word
			61h, rNBB,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 86	XCHG	reg, r/m		Byte
			61h, rNBB,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 87	XCHG	reg, r/m		Word
			
			39h, rNBB,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 88	MOV		r/m, reg		Byte
			39h, rNBB,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 89	MOV		r/m, reg		Word
			39h, rNBB,002h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 8A	MOV		reg, r/m		Byte
			39h, rNBB,003h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 8B	MOV		reg, r/m		Word
			39h, rMWR,sSEG,wNAM,wROM,wCOM,wSEG,  0h,  0h,0,	; 8C	MOV		r/m, SEG
			31h, rMWR,wNAM,wREG,wCOM,wROM,  0h,  0h,  0h,0,	; 8D	LEA		reg, r/m
			39h, rMWR,sSEG,wNAM,wSEG,wCOM,wROM,  0h,  0h,0, ; 8E	MOV		SEG, r/m
			42h, rMWR,wNAM,wROM,  0h,  0h,  0h,  0h,  0h,0,	; 8F	POP		r/m
			
			3Eh, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 90	NOP
			
			
			
; Read functions			
rMWR equ 01h	; Read MOD with REG
rMWN equ 02h	; Read MOD with name code
rNBB equ 03h	; Read next byte as bits
rSEG equ 04h	; Read next byte as SR
rREG equ 05h	; Read next byte as REG
rOFF equ 06h	; Read offset
rILM equ 07h	; Read immediate LSB [MSB]
rALM equ 08h	; Read address ALSB AMSB
rNUM equ 09h	; Read number

; Write functions
wROM equ 10h	; Write r/m
wREG equ 11h	; Write REG
wNAM equ 12h	; Write command name
wCOM equ 13h	; Write comma (,)
wACC equ 14h	; Write accumulator
wIML equ 15h	; Write MSB LSB
wIAM equ 16h	; Write MSB LSB:AMSB ALSB
wAML equ 17h	; Write [AMSB ALSB]
wIPO equ 18h	; Write IP+offset
wSEG equ 19h	; Write SR

; Special functions
sPRE equ 20h	; Set the prefix for next command
sSEG equ 21h	; Get segment from last two bits of REG


			
regs0 db 	'AL',		; 0
			'CL',		; 1
			'DL',		; 2
			'BL',		; 3
			'AH',		; 4
			'CH',		; 5
			'DH',		; 6
			'BH'		; 7
			
regs1 db 	'AX',		; 0
			'CX',		; 1
			'DX',		; 2
			'BX',		; 3
			'SP',		; 4
			'BP',		; 5
			'SI',		; 6
			'DI'		

regsS db	'ES',		; 0
			'CS',		; 1
			'SS',		; 2
			'DS'		; 3
			
			
names db    'AAA',		; 00
			'AAD',		; 01
			'AAM',		; 02
			'AAS',		; 03
			'ADC',		; 04
			'ADD',		; 05
			'AND',		; 06
			'CALL', 	; 07
			'CBW',		; 08
			'CLC',		; 09
			'CLD',		; 0A
			'CLI',		; 0B
			'CMC',		; 0C
			'CMP',		; 0D
			'CMPSB',	; 0E
			'CMPSW',	; 0F
			'CWD',		; 10
			'DAA',		; 11
			'DAS',		; 12
			'DEC',		; 13
			'DIV',		; 14
			'HLT',		; 15
			'IDIV', 	; 16
			'IMUL', 	; 17
			'IN',		; 18
			'INC',		; 19
			'INT',		; 1A
			'INTO', 	; 1B
			'IRET', 	; 1C
			'JA',		; 1D
			'JNB',		; 1E
			'JB',		; 1F
			'JNA',		; 20
			'JCXZ', 	; 21
			'JG',		; 22
			'JNL',		; 23
			'JL',		; 24
			'JNG',		; 25
			'JMP',		; 26
			'JNO',		; 27
			'JNS',		; 28
			'JNE',		; 29
			'JO', 		; 2A
			'JP', 		; 2B
			'JNP', 		; 2C
			'JS', 		; 2D
			'JE', 		; 2E
			'LAHF', 	; 2F
			'LDS', 		; 30
			'LEA', 		; 31
			'LES', 		; 32
			'LOCK', 	; 33
			'LODSB',	; 34
			'LODSW',	; 35
			'LOOP', 	; 36
			'LOOPNZ'	; 37
			'LOOPZ',	; 38
			'MOV', 		; 39
			'MOVSB',	; 3A
			'MOVSW',	; 3B
			'MUL', 		; 3C
			'NEG', 		; 3D
			'NOP', 		; 3E
			'NOT', 		; 3F
			'OR', 		; 40
			'OUT', 		; 41
			'POP', 		; 42
			'POPF', 	; 43
			'PUSH', 	; 44
			'PUSHF',	; 45
			'RCL', 		; 46
			'RCR', 		; 47
			'REP', 		; 48
			'REPNE',	; 49
			'RETF', 	; 4A
			'RETN', 	; 4B
			'ROL', 		; 4C
			'ROR', 		; 4D
			'SAHF', 	; 4E
			'SAR', 		; 4F
			'SBB', 		; 50
			'SCASB',	; 51
			'SCASW',	; 52
			'SEGCS',	; 53
			'SEGDS',	; 54
			'SEGES',	; 55
			'SEGSS',	; 56
			'SHL', 		; 57
			'SHR', 		; 58
			'STC', 		; 59
			'STD', 		; 5A
			'STI', 		; 5B
			'STOSB',	; 5C
			'STOSW',	; 5D
			'SUB', 		; 5E
			'TEST', 	; 5F
			'WAIT', 	; 60
			'XCHG', 	; 61
			'XLAT', 	; 62
			'XOR' 		; 63