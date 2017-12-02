names   db  'UNKNOWN'	; 00
		db  'AAA    '	; 01
		db  'AAD    '	; 02
		db  'AAM    '	; 03
		db  'AAS    '	; 04
		db  'ADC    '	; 05
		db  'ADD    '	; 06
		db  'AND    '	; 07
		db  'CALL   '	; 08
		db  'CBW    '	; 09
		db  'CLC    '	; 0A
		db  'CLD    '	; 0B
		db  'CLI    '	; 0C
		db  'CMC    '	; 0D
		db  'CMP    '	; 0E
		db  'CMPSB  '	; 0F
		db  'CMPSW  '	; 10
		db  'CWD    '	; 11
		db  'DAA    '	; 12
		db  'DAS    '	; 13
		db  'DEC    '	; 14
		db  'DIV    '	; 15
		db  'ESC    '	; 16
		db  'HLT    '	; 17
		db  'IDIV   '	; 18
		db  'IMUL   '	; 19
		db  'IN     '	; 1A
		db  'INC    '	; 1B
		db  'INT    '	; 1C
		db  'INTO   '	; 1D
		db  'IRET   '	; 1E
		db  'JA     '	; 1F
		db  'JB     '	; 20
		db  'JCXZ   '	; 21
		db  'JE     '	; 22
		db  'JG     '	; 23
		db  'JL     '	; 24
		db  'JMP    '	; 25
		db  'JNA    '	; 26
		db  'JNB    '	; 27
		db  'JNE    '	; 28
		db  'JNG    '	; 29
		db  'JNL    '	; 2A
		db  'JNO    '	; 2B
		db  'JNP    '	; 2C
		db  'JNS    '	; 2D
		db  'JO     '	; 2E
		db  'JP     '	; 2F
		db  'JS     '	; 30
		db  'LAHF   '	; 31
		db  'LDS    '	; 32
		db  'LEA    '	; 33
		db  'LES    '	; 34
		db  'LOCK   '	; 35
		db  'LODSB  '	; 36
		db  'LODSW  '	; 37
		db  'LOOP   '	; 38
		db  'LOOPE  '	; 39
		db  'LOOPNE '	; 3A
		db  'MOV    '	; 3B
		db  'MOVSB  '	; 3C
		db  'MOVSW  '	; 3D
		db  'MUL    '	; 3E
		db  'NEG    '	; 3F
		db  'NOP    '	; 40
		db  'NOT    '	; 41
		db  'OR     '	; 42
		db  'OUT    '	; 43
		db  'POP    '	; 44
		db  'POPF   '	; 45
		db  'PUSH   '	; 46
		db  'PUSHF  '	; 47
		db  'RCL    '	; 48
		db  'RCR    '	; 49
		db  'REP    '	; 4A
		db  'REPNE  '	; 4B
		db  'RET    '	; 4C
		db  'RETF   '	; 4D
		db  'RETN   '	; 4E
		db  'ROL    '	; 4F
		db  'ROR    '	; 50
		db  'SAHF   '	; 51
		db  'SAR    '	; 52
		db  'SBB    '	; 53
		db  'SCASB  '	; 54
		db  'SCASW  '	; 55
		db  'SEGCS  '	; 56
		db  'SEGDS  '	; 57
		db  'SEGES  '	; 58
		db  'SEGSS  '	; 59
		db  'SHL    '	; 5A
		db  'SHR    '	; 5B
		db  'STC    '	; 5C
		db  'STD    '	; 5D
		db  'STI    '	; 5E
		db  'STOSB  '	; 5F
		db  'STOSW  '	; 60
		db  'SUB    '	; 61
		db  'TEST   '	; 62
		db  'WAIT   '	; 63
		db  'XCHG   '	; 64
		db  'XLAT   '	; 65
		db  'XOR    '	; 66

;			 0    1    2    3    4    5    6    7
regs	dw 	'AL','CL','DL','BL','AH','CH','DH','BH'
regs2	dw 	'AX','CX','DX','BX','SP','BP','SI','DI'

mem		db	'BX+SI','BS+DI','BP+SI','BP+DI'
mem2	dw	0h,0h,0h,0h,'SI','DI','BP','BX'

regsS   dw	'ES'	; 0
		dw	'CS'	; 1
		dw	'SS'	; 2
		dw	'DS'	; 3

farTxt 	db 'far '

; Bits composition
; Xreg scvw
; sc - subcode, specifies which block of names to look at for rMWN command

; Read functions
rMWR equ 01h	; Read MOD with REG
rMWN equ 02h	; Read MOD with name code
rBIT equ 03h	; Read next command byte as bits
rOFF equ 04h	; Read offset
rILM equ 05h	; Read immediate LSB [MSB]
rALM equ 06h	; Read address ALSB AMSB

; Write functions
wROM equ 10h	; Write r/m
wREG equ 11h	; Write REG
wNAM equ 12h	; Write command name
wCOM equ 13h	; Write comma (,)
wACC equ 14h	; Write accumulator
wIML equ 15h	; Write MSB LSB
wAML equ 16h	; Write [AMSB ALSB]
wIPO equ 17h	; Write IP+offset
wSEG equ 18h	; Write SR

; Special functions
sPRE equ 20h	; Set the prefix for next command
sEXP equ 21h	; Write sign-extended LSB
sSPC equ 22h	; reg = 0: write 1; reg = 1: write AL; reg = 2: write AX; reg = 3: write 3; reg = 4: write "far"
sESC equ 23h	; Read next command byte as yyy and then write hex("reg yyy")
sIAM equ 24h	; Write MSB LSB:AMSB ALSB
sEXT equ 25h	; Execute extended function

outOffset equ 40h
namOffset equ 58h
argOffset equ 60h

emptySpace 	db 38h DUP(' ')
			db 0Ah, 0Dh

functions 	dw    0h, frMWR, frMWN, frBIT, frOFF, frILM, frALM,    0h,    0h,0h,0h,0h,0h,0h,0h,0h
			dw fwROM, fwREG, fwNAM, fwCOM, fwACC, fwIML, fwAML, fwIPO, fwSEG,0h,0h,0h,0h,0h,0h,0h
			dw fsPRE, fsEXP, fsSPC, fsESC, fsIAM, fsEXT,    0h,    0h,0h,0h,0h,0h,0h,0h,0h

;               000  001  010  011  100  101  110  111
subNames 	db	19h, 13h, 07h, 07h, 26h, 26h, 44h, 00h	; 0xFE - 0xFF
			db	5Fh, 00h, 3Fh, 3Dh, 3Ch, 17h, 14h, 16h	; 0xF6 - 0xF7
			db	4Ch, 4Dh, 46h, 47h, 57h, 58h, 00h, 4Fh	; 0xD0 - 0xD3
			db	05h, 40h, 04h, 50h, 06h, 5Eh, 63h, 0Dh	; 0x80 - 0x83


;                                                           Hex     Com       Args          Size

codes   db 	06h, rBIT,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0	; 00	ADD 	r/m, reg		Byte
		db	06h, rBIT,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0	; 01	ADD 	r/m, reg		Word
		db	06h, rBIT,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0	; 02	ADD 	reg, r/m		Byte
		db	06h, rBIT,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0	; 03	ADD 	reg, r/m		Word
		db	06h, rBIT,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0	; 04	ADD 	AL, LSB			Byte
		db	06h, rBIT,001h,rILM,wNAM,wACC,wCOM,wIML,  0h,0	; 05	ADD 	AX, MSB LSB		Word
		db	46h, rBIT,000h,wNAM,wSEG,  0h,  0h,  0h,  0h,0	; 06	PUSH	ES
		db	44h, rBIT,000h,wNAM,wSEG,  0h,  0h,  0h,  0h,0	; 07	POP		ES

		db	42h, rBIT,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0	; 08	OR 		r/m, reg		Byte
		db	42h, rBIT,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0	; 09	OR 		r/m, reg		Word
		db	42h, rBIT,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0	; 0A	OR 		reg, r/m		Byte
		db	42h, rBIT,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0	; 0B	OR 		reg, r/m		Word
		db	42h, rBIT,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0	; 0C	OR 		AL, LSB			Byte
		db	42h, rBIT,001h,rILM,wNAM,wACC,wCOM,wIML,  0h,0	; 0D	OR 		AX, MSB LSB		Word
		db	46h, rBIT,010h,wNAM,wSEG,  0h,  0h,  0h,  0h,0	; 0E	PUSH	CS
		db	44h, rBIT,010h,wNAM,wSEG,  0h,  0h,  0h,  0h,0	; 0F	POP		CS

		db	05h, rBIT,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0	; 10	ADC		r/m, reg		Byte
		db	05h, rBIT,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0	; 11	ADC		r/m, reg		Word
		db	05h, rBIT,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0	; 12	ADC		reg, r/m		Byte
		db	05h, rBIT,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0	; 13	ADC		reg, r/m		Word
		db	05h, rBIT,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0	; 14	ADC		AL, LSB			Byte
		db	05h, rBIT,001h,rILM,wNAM,wACC,wCOM,wIML,  0h,0	; 15	ADC		AX, MSB LSB		Word
		db	46h, rBIT,020h,wNAM,wSEG,  0h,  0h,  0h,  0h,0	; 16	PUSH	SS
		db	44h, rBIT,020h,wNAM,wSEG,  0h,  0h,  0h,  0h,0	; 17	POP		SS

		db	53h, rBIT,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0	; 18	SBB 	r/m, reg		Byte
		db	53h, rBIT,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0	; 19	SBB 	r/m, reg		Word
		db	53h, rBIT,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0	; 1A	SBB 	reg, r/m		Byte
		db	53h, rBIT,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0	; 1B	SBB 	reg, r/m		Word
		db	53h, rBIT,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0	; 1C	SBB 	AL, LSB			Byte
		db	53h, rBIT,001h,rILM,wNAM,wACC,wCOM,wIML,  0h,0	; 1D	SBB 	AX, MSB LSB		Word
		db	46h, rBIT,030h,wNAM,wSEG,  0h,  0h,  0h,  0h,0	; 1E	PUSH	DS
		db	44h, rBIT,030h,wNAM,wSEG,  0h,  0h,  0h,  0h,0	; 1F	POP		DS

		db	07h, rBIT,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0	; 20	AND		r/m, reg		Byte
		db	07h, rBIT,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0	; 21	AND		r/m, reg		Word
		db	07h, rBIT,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0	; 22	AND		reg, r/m		Byte
		db	07h, rBIT,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0	; 23	AND		reg, r/m		Word
		db	07h, rBIT,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0	; 24	AND		AL, LSB			Byte
		db	07h, rBIT,001h,rILM,wNAM,wACC,wCOM,wIML,  0h,0	; 25	AND		AX, MSB LSB		Word
		db	00h, rBIT,000h,sPRE,  0h,  0h,  0h,  0h,  0h,0	; 26	Prefix	ES
		db	12h, wNAM,000h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 27	DAA

		db	61h, rBIT,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0	; 28	SUB		r/m, reg		Byte
		db	61h, rBIT,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0	; 29	SUB		r/m, reg		Word
		db	61h, rBIT,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0	; 2A	SUB		reg, r/m		Byte
		db	61h, rBIT,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0	; 2B	SUB		reg, r/m		Word
		db	61h, rBIT,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0	; 2C	SUB		AL, LSB			Byte
		db	61h, rBIT,001h,rILM,wNAM,wACC,wCOM,wIML,  0h,0	; 2D	SUB		AX, MSB LSB		Word
		db	00h, rBIT,010h,sPRE,  0h,  0h,  0h,  0h,  0h,0	; 2E	Prefix	CS
		db	13h, wNAM,000h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 2F	DAS

		db	66h, rBIT,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0	; 30	XOR		r/m, reg		Byte
		db	66h, rBIT,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0	; 31	XOR		r/m, reg		Word
		db	66h, rBIT,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0	; 32	XOR		reg, r/m		Byte
		db	66h, rBIT,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0	; 33	XOR		reg, r/m		Word
		db	66h, rBIT,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0	; 34	XOR		AL, LSB			Byte
		db	66h, rBIT,001h,rILM,wNAM,wACC,wCOM,wIML,  0h,0	; 35	XOR		AX, MSB LSB		Word
		db	00h, rBIT,002h,sPRE,  0h,  0h,  0h,  0h,  0h,0	; 36	Prefix	SS
		db	01h, wNAM,000h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 37	AAA

		db	0Eh, rBIT,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0	; 38	CMP		r/m, reg		Byte
		db	0Eh, rBIT,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0	; 39	CMP		r/m, reg		Word
		db	0Eh, rBIT,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0	; 3A	CMP		reg, r/m		Byte
		db	0Eh, rBIT,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0	; 3B	CMP		reg, r/m		Word
		db	0Eh, rBIT,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0	; 3C	CMP		AL, LSB			Byte
		db	0Eh, rBIT,001h,rILM,wNAM,wACC,wCOM,wIML,  0h,0	; 3D	CMP		AX, MSB LSB		Word
		db	00h, rBIT,030h,sPRE,  0h,  0h,  0h,  0h,  0h,0	; 3E	Prefix	DS
		db	04h, wNAM,000h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 3F	AAS

		db	1Bh, rBIT,001h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 40	INC		AX				Word
		db	1Bh, rBIT,011h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 41	INC		CX				Word
		db	1Bh, rBIT,021h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 42	INC		DX				Word
		db	1Bh, rBIT,031h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 43	INC		BX				Word
		db	1Bh, rBIT,041h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 44	INC		SP				Word
		db	1Bh, rBIT,051h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 45	INC		BP				Word
		db	1Bh, rBIT,061h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 46	INC		SI				Word
		db	1Bh, rBIT,071h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 47	INC		DI				Word

		db	14h, rBIT,001h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 48	DEC		AX				Word
		db	14h, rBIT,011h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 49	DEC		CX				Word
		db	14h, rBIT,021h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 4A	DEC		DX				Word
		db	14h, rBIT,031h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 4B	DEC		BX				Word
		db	14h, rBIT,041h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 4C	DEC		SP				Word
		db	14h, rBIT,051h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 4D	DEC		BP				Word
		db	14h, rBIT,061h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 4E	DEC		SI				Word
		db	14h, rBIT,071h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 4F	DEC		DI				Word

		db	46h, rBIT,001h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 50	PUSH	AX				Word
		db	46h, rBIT,011h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 51	PUSH	CX				Word
		db	46h, rBIT,021h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 52	PUSH	DX				Word
		db	46h, rBIT,031h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 53	PUSH	BX				Word
		db	46h, rBIT,041h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 54	PUSH	SP				Word
		db	46h, rBIT,051h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 55	PUSH	BP				Word
		db	46h, rBIT,061h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 56	PUSH	SI				Word
		db	46h, rBIT,071h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 57	PUSH	DI				Word

		db	44h, rBIT,001h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 58	POP		AX				Word
		db	44h, rBIT,011h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 59	POP		CX				Word
		db	44h, rBIT,021h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 5A	POP		DX				Word
		db	44h, rBIT,031h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 5B	POP		BX				Word
		db	44h, rBIT,041h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 5C	POP		SP				Word
		db	44h, rBIT,051h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 5D	POP		BP				Word
		db	44h, rBIT,061h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 5E	POP		SI				Word
		db	44h, rBIT,071h,wNAM,wREG,  0h,  0h,  0h,  0h,0	; 5F	POP		DI				Word

		db	00h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 60	NO COMMAND
		db	00h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 61	NO COMMAND
		db	00h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 62	NO COMMAND
		db	00h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 63	NO COMMAND
		db	00h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 64	NO COMMAND
		db	00h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 65	NO COMMAND
		db	00h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 66	NO COMMAND
		db	00h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 67	NO COMMAND

		db	00h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 68	NO COMMAND
		db	00h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 69	NO COMMAND
		db	00h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 6A	NO COMMAND
		db	00h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 6B	NO COMMAND
		db	00h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 6C	NO COMMAND
		db	00h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 6D	NO COMMAND
		db	00h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 6E	NO COMMAND
		db	00h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 6F	NO COMMAND

		db	2Eh, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0	; 70	JO		IP+offset
		db	2Bh, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0	; 71	JNO		IP+offset
		db	20h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0	; 72	JB		IP+offset
		db	27h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0	; 73	JNB		IP+offset
		db	22h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0	; 74	JE		IP+offset
		db	28h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0	; 75	JNE		IP+offset
		db	26h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0	; 76	JNA		IP+offset
		db	1Fh, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0	; 77	JA		IP+offset

		db	30h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0	; 78	JS		IP+offset
		db	2Dh, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0	; 79	JNS		IP+offset
		db	2Fh, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0	; 7A	JP		IP+offset
		db	25h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0	; 7B	JNP		IP+offset
		db	24h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0	; 7C	JL		IP+offset
		db	2Ah, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0	; 7D	JNL		IP+offset
		db	29h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0	; 7E	JNG		IP+offset
		db	23h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0	; 7F	JG		IP+offset

		db	00h, rBIT,00Ch,rMWN,rILM,wNAM,wROM,wCOM,wIML,0	; 80	Comm depends on code	Byte
		db	00h, rBIT,00Dh,rMWN,rILM,wNAM,wROM,wCOM,wIML,0	; 81	Comm depends on code	Word
		db	00h, rBIT,00Ch,rMWN,rILM,wNAM,wROM,wCOM,wIML,0	; 82	Comm depends on code	Byte
		db	00h, rBIT,00Dh,rMWN,rILM,wNAM,wROM,wCOM,sEXP,0	; 83	Comm depends on code	Word
		db	62h, rBIT,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0	; 84	TEST	reg, r/m		Byte
		db	62h, rBIT,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0	; 85	TEST	reg, r/m		Word
		db	64h, rBIT,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0	; 86	XCHG	reg, r/m		Byte
		db	64h, rBIT,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0	; 87	XCHG	reg, r/m		Word

		db	3Bh, rBIT,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0	; 88	MOV		r/m, reg		Byte
		db	3Bh, rBIT,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0	; 89	MOV		r/m, reg		Word
		db	3Bh, rBIT,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0	; 8A	MOV		reg, r/m		Byte
		db	3Bh, rBIT,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0	; 8B	MOV		reg, r/m		Word
		db	3Bh, rMWR,wNAM,wROM,wCOM,wSEG,  0h,  0h,  0h,0	; 8C	MOV		r/m, SEG
		db	33h, rMWR,wNAM,wREG,wCOM,wROM,  0h,  0h,  0h,0	; 8D	LEA		reg, r/m
		db	3Bh, rMWR,wNAM,wSEG,wCOM,wROM,  0h,  0h,  0h,0 ; 8E	MOV		SEG, r/m
		db	44h, rMWR,wNAM,wROM,  0h,  0h,  0h,  0h,  0h,0	; 8F	POP		r/m

		db	40h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 90	NOP
		db	64h, rBIT,011h,wNAM,wREG,wCOM,wACC,  0h,  0h,0	; 91	XCHG	CX, AX			Word
		db	64h, rBIT,021h,wNAM,wREG,wCOM,wACC,  0h,  0h,0	; 92	XCHG	DX, AX			Word
		db	64h, rBIT,031h,wNAM,wREG,wCOM,wACC,  0h,  0h,0	; 93	XCHG	BX, AX			Word
		db	64h, rBIT,041h,wNAM,wREG,wCOM,wACC,  0h,  0h,0	; 94	XCHG	SP, AX			Word
		db	64h, rBIT,051h,wNAM,wREG,wCOM,wACC,  0h,  0h,0	; 95	XCHG	BP, AX			Word
		db	64h, rBIT,061h,wNAM,wREG,wCOM,wACC,  0h,  0h,0	; 96	XCHG	SI, AX			Word
		db	64h, rBIT,071h,wNAM,wREG,wCOM,wACC,  0h,  0h,0	; 97	XCHG	DI, AX			Word

		db	09h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 98	CBW
		db	11h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 99	CWD
		db	08h, rBIT,001h,rALM,rILM,wNAM,sIAM,  0h,  0h,0	; 9A	CALL	MSB LSB:AMSB ALSB
		db	63h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 9B	WAIT
		db	47h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 9C	PUSHF
		db	45h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 9D	POPF
		db	51h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 9E	SAHF
		db	31h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; 9F	LAHF

		db	3Bh, rBIT,000h,rALM,wNAM,wACC,wCOM,wAML,  0h,0	; A0	MOV  	AL, AMSB ALSB	Byte
		db	3Bh, rBIT,001h,rALM,wNAM,wACC,wCOM,wAML,  0h,0	; A1	MOV  	AX, AMSB ALSB	Word
		db	3Bh, rBIT,000h,rALM,wNAM,wAML,wCOM,wACC,  0h,0	; A2	MOV  	AMSB ALSB, AL	Byte
		db	3Bh, rBIT,001h,rALM,wNAM,wAML,wCOM,wACC,  0h,0	; A3	MOV  	AMSB ALSB, AX	Word
		db	3Ch, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; A4	MOVSB
		db	3Dh, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; A5	MOVSW
		db	0Fh, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; A6	CMPSB
		db	10h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; A7	CMPSW

		db	62h, rBIT,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0	; A8	TEST	AL, LSB			Byte
		db	62h, rBIT,001h,rILM,wNAM,wACC,wCOM,wIML,  0h,0	; A9	TEST	AX, MSB, LSB	Byte
		db	5Fh, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; AA	STOSB
		db	60h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; AB	STOSW
		db	36h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; AC	LODSB
		db	37h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; AD	LODSW
		db	54h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; AE	SCASB
		db	55h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; AF	SCASW

		db	3Bh, rBIT,000h,rILM,wNAM,wREG,wCOM,wIML,  0h,0	; B0	MOV 	AL, LSB			Byte
		db	3Bh, rBIT,010h,rILM,wNAM,wREG,wCOM,wIML,  0h,0	; B1	MOV 	CL, LSB			Byte
		db	3Bh, rBIT,020h,rILM,wNAM,wREG,wCOM,wIML,  0h,0	; B2	MOV 	DL, LSB			Byte
		db	3Bh, rBIT,030h,rILM,wNAM,wREG,wCOM,wIML,  0h,0	; B3	MOV 	BL, LSB			Byte
		db	3Bh, rBIT,040h,rILM,wNAM,wREG,wCOM,wIML,  0h,0	; B4	MOV 	AH, LSB			Byte
		db	3Bh, rBIT,050h,rILM,wNAM,wREG,wCOM,wIML,  0h,0	; B5	MOV 	CH, LSB			Byte
		db	3Bh, rBIT,060h,rILM,wNAM,wREG,wCOM,wIML,  0h,0	; B6	MOV 	DH, LSB			Byte
		db	3Bh, rBIT,070h,rILM,wNAM,wREG,wCOM,wIML,  0h,0	; B7	MOV 	BH, LSB			Byte

		db	3Bh, rBIT,001h,rILM,wNAM,wREG,wCOM,wIML,  0h,0	; B8	MOV 	AX, MSB LSB		Word
		db	3Bh, rBIT,011h,rILM,wNAM,wREG,wCOM,wIML,  0h,0	; B9	MOV 	CX, MSB LSB		Word
		db	3Bh, rBIT,021h,rILM,wNAM,wREG,wCOM,wIML,  0h,0	; BA	MOV 	DX, MSB LSB		Word
		db	3Bh, rBIT,031h,rILM,wNAM,wREG,wCOM,wIML,  0h,0	; BB	MOV 	BX, MSB LSB		Word
		db	3Bh, rBIT,041h,rILM,wNAM,wREG,wCOM,wIML,  0h,0	; BC	MOV 	SP, MSB LSB		Word
		db	3Bh, rBIT,051h,rILM,wNAM,wREG,wCOM,wIML,  0h,0	; BD	MOV 	BP, MSB LSB		Word
		db	3Bh, rBIT,061h,rILM,wNAM,wREG,wCOM,wIML,  0h,0	; BE	MOV 	SI, MSB LSB		Word
		db	3Bh, rBIT,071h,rILM,wNAM,wREG,wCOM,wIML,  0h,0	; BF	MOV 	DI, MSB LSB		Word

		db	00h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; C0	NO COMMAND
		db	00h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; C1	NO COMMAND
		db	4Ch, rBIT,001h,rILM,wNAM,wIML,  0h,  0h,  0h,0	; C2	RET		MSB LSB			Word
		db	4Ch, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; C3	RET
		db	34h, rBIT,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0	; C4	LES		reg, r/m
		db	32h, rBIT,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0	; C5	LDS		reg, r/m
		db	3Bh, rBIT,000h,rMWR,rILM,wNAM,wROM,wCOM,wIML,0	; C6	MOV		r/m, LSB
		db	3Bh, rBIT,001h,rMWR,rILM,wNAM,wROM,wCOM,wIML,0	; C7	MOV		r/m, MSB LSB

		db	00h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; C8	NO COMMAND
		db	00h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; C9	NO COMMAND
		db	40h, rBIT,001h,rILM,wNAM,wIML,  0h,  0h,  0h,0	; CA	RETF	MSB LSB
		db	40h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; CB	RETF
		db	1Ch, rBIT,030h,wNAM,sSPC,  0h,  0h,  0h,  0h,0	; CC	INT 	3
		db	1Ch, rBIT,000h,rILM,wNAM,wIML,  0h,  0h,  0h,0	; CD	INT		number
		db	1Dh, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; CE	INTO
		db	1Eh, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; CF	IRET

		db	00h, rBIT,008h,rMWN,wNAM,wROM,wCOM,sSPC,  0h,0	; D0	Comm depends on code	Byte
		db	00h, rBIT,009h,rMWN,wNAM,wROM,wCOM,sSPC,  0h,0	; D1	Comm depends on code	Word
		db	00h, rBIT,008h,rMWN,wNAM,wROM,wCOM,wACC,  0h,0	; D2	Comm depends on code	Byte
		db	00h, rBIT,019h,rMWN,wNAM,wROM,wCOM,sSPC,  0h,0	; D3	Comm depends on code	Word
		db	03h, rOFF,wNAM,  0h,  0h,  0h,  0h,  0h,  0h,0	; D4	AAM
		db	02h, rOFF,wNAM,  0h,  0h,  0h,  0h,  0h,  0h,0	; D5	AAD
		db	00h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; D6	NO COMMAND
		db	65h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; D7	XLAT

		db	16h, rBIT,000h,rMWR,wNAM,sESC,000h,wCOM,wROM,0	; D8	ESC		hex(000 yyy), r/m
		db	16h, rBIT,000h,rMWR,wNAM,sESC,001h,wCOM,wROM,0	; D9	ESC		hex(001 yyy), r/m
		db	16h, rBIT,000h,rMWR,wNAM,sESC,002h,wCOM,wROM,0	; DA	ESC		hex(010 yyy), r/m
		db	16h, rBIT,000h,rMWR,wNAM,sESC,003h,wCOM,wROM,0	; DB	ESC		hex(011 yyy), r/m
		db	16h, rBIT,000h,rMWR,wNAM,sESC,004h,wCOM,wROM,0	; DC	ESC		hex(100 yyy), r/m
		db	16h, rBIT,000h,rMWR,wNAM,sESC,005h,wCOM,wROM,0	; DD	ESC		hex(101 yyy), r/m
		db	16h, rBIT,000h,rMWR,wNAM,sESC,006h,wCOM,wROM,0	; DE	ESC		hex(110 yyy), r/m
		db	16h, rBIT,000h,rMWR,wNAM,sESC,007h,wCOM,wROM,0	; DF	ESC		hex(111 yyy), r/m

		db	3Ah, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0	; E0	LOOPNE	IP+offset
		db	39h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0	; E1	LOOPE	IP+offset
		db	38h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0	; E2	LOOP	IP+offset
		db	21h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0	; E3	JCXZ	IP+offset
		db	1Ah, rBIT,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0	; E4	IN		AL, port
		db	1Ah, rBIT,020h,rILM,wNAM,sSPC,wCOM,wIML,  0h,0	; E5	IN		AX, port
		db	43h, rBIT,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0	; E6	OUT		AL, port
		db	43h, rBIT,020h,rILM,wNAM,sSPC,wCOM,wIML,  0h,0	; E7	OUT		AX, port

		db	08h, rBIT,001h,rILM,wNAM,wIML,  0h,  0h,  0h,0	; E8	CALL 	MSB LSB
		db	08h, rBIT,001h,rILM,wNAM,wIML,  0h,  0h,  0h,0	; E9	CALL 	MSB LSB
		db	25h, rBIT,001h,rALM,rILM,wNAM,sIAM,  0h,  0h,0	; EA	JMP		MSB LSB:AMSB ALSB
		db	25h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0	; EB	JMP		IP+offset
		db	1Ah, rBIT,000h,wNAM,wACC,wCOM,rBIT,021h,wREG,0	; EC	IN 		AL, DX
		db	1Ah, rBIT,021h,wNAM,wACC,wCOM,wREG,  0h,  0h,0	; ED	IN 		AX, DX
		db	43h, rBIT,000h,wNAM,wACC,wCOM,rBIT,021h,wREG,0	; EE	OUT		AL, DX
		db	43h, rBIT,021h,wNAM,wACC,wCOM,wREG,  0h,  0h,0	; EF	OUT		AX, DX

		db	35h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; F0	LOCK
		db	00h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; F1	NO COMMAND
		db	4Bh, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; F2	REPNE
		db	4Ah, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; F3	REP
		db	17h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; F4	HLT
		db	0Dh, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; F5	CMC
		db	00h, rBIT,004h,rMWN,sEXT,  0h,  0h,  0h,  0h,0	; F6	Comm depends on code	Byte
		db	00h, rBIT,005h,rMWN,sEXT,  0h,  0h,  0h,  0h,0	; F7	Comm depends on code	Word

		db	0Ah, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; F8	CLC
		db	5Ch, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; F9	STC
		db	0Ch, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; FA	CLI
		db	5Eh, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; FB	STI
		db	0Bh, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; FC	CLD
		db	5Dh, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0	; FD	STD
		db	00h, rBIT,000h,rMWN,sEXT,  0h,  0h,  0h,  0h,0	; FE	Comm depends on code		Byte
		db	00h, rBIT,041h,rMWN,sEXT,  0h,  0h,  0h,  0h,0	; FF	Comm depends on code		Word


extCodes db rILM,wNAM,wROM,wCOM,wIML,0	; 000
		db	  0h,  0h,  0h,  0h,  0h,0	; 001
		db	wNAM,wROM,  0h,  0h,  0h,0	; 010
		db	wNAM,wROM,  0h,  0h,  0h,0	; 011
		db	wNAM,wROM,  0h,  0h,  0h,0	; 100
		db	wNAM,wROM,  0h,  0h,  0h,0	; 101
		db	wNAM,wROM,  0h,  0h,  0h,0	; 110
		db	wNAM,wROM,  0h,  0h,  0h,0	; 111

		db	wNAM,wROM,  0h,  0h,  0h,0	; 000
		db	wNAM,wROM,  0h,  0h,  0h,0	; 001
		db	wNAM,wROM,  0h,  0h,  0h,0	; 010
		db	wNAM,sSPC,wROM,  0h,  0h,0	; 011
		db	wNAM,wROM,  0h,  0h,  0h,0	; 100
		db	wNAM,sSPC,wROM,  0h,  0h,0	; 101
		db	wNAM,wROM,  0h,  0h,  0h,0	; 110
		db	  0h,  0h,  0h,  0h,  0h,0	; 111
