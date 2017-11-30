;                                                           Hex     Com       Args          Size
			
codes db 	05h, rBIT,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 00	ADD 	r/m, reg		Byte
			05h, rBIT,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 01	ADD 	r/m, reg		Word
			05h, rBIT,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 02	ADD 	reg, r/m		Byte
			05h, rBIT,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 03	ADD 	reg, r/m		Word
			05h, rBIT,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 04	ADD 	AL, LSB			Byte
			05h, rBIT,001h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 05	ADD 	AX, MSB LSB		Word
			44h, rBIT,000h,wNAM,wSEG,  0h,  0h,  0h,  0h,0,	; 06	PUSH	ES
			42h, rBIT,000h,wNAM,wSEG,  0h,  0h,  0h,  0h,0,	; 07	POP		ES
			
			40h, rBIT,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 08	OR 		r/m, reg		Byte
			40h, rBIT,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 09	OR 		r/m, reg		Word
			40h, rBIT,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 0A	OR 		reg, r/m		Byte
			40h, rBIT,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 0B	OR 		reg, r/m		Word
			40h, rBIT,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 0C	OR 		AL, LSB			Byte
			40h, rBIT,001h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 0D	OR 		AX, MSB LSB		Word
			44h, rBIT,010h,wNAM,wSEG,  0h,  0h,  0h,  0h,0,	; 0E	PUSH	CS
			42h, rBIT,010h,wNAM,wSEG,  0h,  0h,  0h,  0h,0,	; 0F	POP		CS
			
			04h, rBIT,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 10	ADC		r/m, reg		Byte
			04h, rBIT,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 11	ADC		r/m, reg		Word
			04h, rBIT,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 12	ADC		reg, r/m		Byte
			04h, rBIT,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 13	ADC		reg, r/m		Word
			04h, rBIT,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 14	ADC		AL, LSB			Byte
			04h, rBIT,001h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 15	ADC		AX, MSB LSB		Word
			44h, rBIT,020h,wNAM,wSEG,  0h,  0h,  0h,  0h,0,	; 16	PUSH	SS
			42h, rBIT,020h,wNAM,wSEG,  0h,  0h,  0h,  0h,0,	; 17	POP		SS
			
			50h, rBIT,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 18	SBB 	r/m, reg		Byte
			50h, rBIT,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 19	SBB 	r/m, reg		Word
			50h, rBIT,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 1A	SBB 	reg, r/m		Byte
			50h, rBIT,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 1B	SBB 	reg, r/m		Word
			50h, rBIT,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 1C	SBB 	AL, LSB			Byte
			50h, rBIT,001h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 1D	SBB 	AX, MSB LSB		Word
			44h, rBIT,030h,wNAM,wSEG,  0h,  0h,  0h,  0h,0,	; 1E	PUSH	DS
			42h, rBIT,030h,wNAM,wSEG,  0h,  0h,  0h,  0h,0,	; 1F	POP		DS
			
			06h, rBIT,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 20	AND		r/m, reg		Byte
			06h, rBIT,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 21	AND		r/m, reg		Word
			06h, rBIT,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 22	AND		reg, r/m		Byte
			06h, rBIT,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 23	AND		reg, r/m		Word
			06h, rBIT,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 24	AND		AL, LSB			Byte
			06h, rBIT,001h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 25	AND		AX, MSB LSB		Word
			00h, rBIT,000h,sPRE,  0h,  0h,  0h,  0h,  0h,0,	; 26	Prefix	ES
			11h, wNAM,000h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 27	DAA		
			
			5Eh, rBIT,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 28	SUB		r/m, reg		Byte
			5Eh, rBIT,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 29	SUB		r/m, reg		Word
			5Eh, rBIT,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 2A	SUB		reg, r/m		Byte
			5Eh, rBIT,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 2B	SUB		reg, r/m		Word
			5Eh, rBIT,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 2C	SUB		AL, LSB			Byte
			5Eh, rBIT,001h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 2D	SUB		AX, MSB LSB		Word
			00h, rBIT,010h,sPRE,  0h,  0h,  0h,  0h,  0h,0,	; 2E	Prefix	CS
			12h, wNAM,000h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 2F	DAS	
			
			63h, rBIT,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 30	XOR		r/m, reg		Byte
			63h, rBIT,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 31	XOR		r/m, reg		Word
			63h, rBIT,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 32	XOR		reg, r/m		Byte
			63h, rBIT,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 33	XOR		reg, r/m		Word
			63h, rBIT,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 34	XOR		AL, LSB			Byte
			63h, rBIT,001h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 35	XOR		AX, MSB LSB		Word
			00h, rBIT,002h,sPRE,  0h,  0h,  0h,  0h,  0h,0,	; 36	Prefix	SS
			00h, wNAM,000h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 37	AAA	
			
			0Dh, rBIT,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 38	CMP		r/m, reg		Byte
			0Dh, rBIT,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 39	CMP		r/m, reg		Word
			0Dh, rBIT,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 3A	CMP		reg, r/m		Byte
			0Dh, rBIT,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 3B	CMP		reg, r/m		Word
			0Dh, rBIT,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 3C	CMP		AL, LSB			Byte
			0Dh, rBIT,001h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; 3D	CMP		AX, MSB LSB		Word
			00h, rBIT,030h,sPRE,  0h,  0h,  0h,  0h,  0h,0,	; 3E	Prefix	DS
			03h, wNAM,000h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 3F	AAS	

			19h, rBIT,001h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 40	INC		AX				Word
			19h, rBIT,011h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 41	INC		CX				Word
			19h, rBIT,021h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 42	INC		DX				Word
			19h, rBIT,031h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 43	INC		BX				Word
			19h, rBIT,041h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 44	INC		SP				Word
			19h, rBIT,051h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 45	INC		BP				Word
			19h, rBIT,061h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 46	INC		SI				Word
			19h, rBIT,071h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 47	INC		DI				Word

			13h, rBIT,001h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 48	DEC		AX				Word
			13h, rBIT,011h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 49	DEC		CX				Word
			13h, rBIT,021h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 4A	DEC		DX				Word
			13h, rBIT,031h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 4B	DEC		BX				Word
			13h, rBIT,041h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 4C	DEC		SP				Word
			13h, rBIT,051h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 4D	DEC		BP				Word
			13h, rBIT,061h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 4E	DEC		SI				Word
			13h, rBIT,071h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 4F	DEC		DI				Word
			
			44h, rBIT,001h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 50	PUSH	AX				Word
			44h, rBIT,011h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 51	PUSH	CX				Word
			44h, rBIT,021h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 52	PUSH	DX				Word
			44h, rBIT,031h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 53	PUSH	BX				Word
			44h, rBIT,041h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 54	PUSH	SP				Word
			44h, rBIT,051h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 55	PUSH	BP				Word
			44h, rBIT,061h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 56	PUSH	SI				Word
			44h, rBIT,071h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 57	PUSH	DI				Word

			42h, rBIT,001h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 58	POP		AX				Word
			42h, rBIT,011h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 59	POP		CX				Word
			42h, rBIT,021h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 5A	POP		DX				Word
			42h, rBIT,031h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 5B	POP		BX				Word
			42h, rBIT,041h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 5C	POP		SP				Word
			42h, rBIT,051h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 5D	POP		BP				Word
			42h, rBIT,061h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 5E	POP		SI				Word
			42h, rBIT,071h,wNAM,wREG,  0h,  0h,  0h,  0h,0,	; 5F	POP		DI				Word
			
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
			
			00h, rBIT,000h,rMWN,rILM,wNAM,wROM,wCOM,wIML,0,	; 80	Comm depends on code	Byte
			00h, rBIT,001h,rMWN,rILM,wNAM,wROM,wCOM,wIML,0,	; 81	Comm depends on code	Word
			00h, rBIT,000h,rMWN,rILM,wNAM,wROM,wCOM,wIML,0,	; 82	Comm depends on code	Byte
			00h, rBIT,001h,rMWN,rILM,wNAM,wROM,wCOM,sEXP,0,	; 83	Comm depends on code	Word
			5Fh, rBIT,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 84	TEST	reg, r/m		Byte
			5Fh, rBIT,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 85	TEST	reg, r/m		Word
			61h, rBIT,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 86	XCHG	reg, r/m		Byte
			61h, rBIT,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 87	XCHG	reg, r/m		Word
			
			39h, rBIT,000h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 88	MOV		r/m, reg		Byte
			39h, rBIT,001h,rMWR,wNAM,wROM,wCOM,wREG,  0h,0,	; 89	MOV		r/m, reg		Word
			39h, rBIT,000h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 8A	MOV		reg, r/m		Byte
			39h, rBIT,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; 8B	MOV		reg, r/m		Word
			39h, rMWR,sSEG,wNAM,wROM,wCOM,wSEG,  0h,  0h,0,	; 8C	MOV		r/m, SEG
			31h, rMWR,wNAM,wREG,wCOM,wROM,  0h,  0h,  0h,0,	; 8D	LEA		reg, r/m
			39h, rMWR,sSEG,wNAM,wSEG,wCOM,wROM,  0h,  0h,0, ; 8E	MOV		SEG, r/m
			42h, rMWR,wNAM,wROM,  0h,  0h,  0h,  0h,  0h,0,	; 8F	POP		r/m
			
			3Eh, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 90	NOP
			61h, rBIT,011h,wNAM,wREG,wCOM,wACC,  0h,  0h,0,	; 91	XCHG	CX, AX			Word
			61h, rBIT,021h,wNAM,wREG,wCOM,wACC,  0h,  0h,0,	; 92	XCHG	DX, AX			Word
			61h, rBIT,031h,wNAM,wREG,wCOM,wACC,  0h,  0h,0,	; 93	XCHG	BX, AX			Word
			61h, rBIT,041h,wNAM,wREG,wCOM,wACC,  0h,  0h,0,	; 94	XCHG	SP, AX			Word
			61h, rBIT,051h,wNAM,wREG,wCOM,wACC,  0h,  0h,0,	; 95	XCHG	BP, AX			Word
			61h, rBIT,061h,wNAM,wREG,wCOM,wACC,  0h,  0h,0,	; 96	XCHG	SI, AX			Word
			61h, rBIT,071h,wNAM,wREG,wCOM,wACC,  0h,  0h,0,	; 97	XCHG	DI, AX			Word
			
			08h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 98	CBW
			10h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 99	CWD
			07h, rBIT,001h,rALM,rILM,wNAM,sIAM,  0h,  0h,0,	; 9A	CALL	MSB LSB:AMSB ALSB
			60h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 9B	WAIT
			45h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 9C	PUSHF
			43h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 9D	POPF
			4Eh, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 9E	SAHF
			2Fh, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; 9F	LAHF
			
			39h, rBIT,000h,rALM,wNAM,wACC,wCOM,wAML,  0h,0,	; A0	MOV  	AL, AMSB ALSB	Byte
			39h, rBIT,001h,rALM,wNAM,wACC,wCOM,wAML,  0h,0,	; A1	MOV  	AX, AMSB ALSB	Word
			39h, rBIT,000h,rALM,wNAM,wAML,wCOM,wACC,  0h,0,	; A2	MOV  	AMSB ALSB, AL	Byte
			39h, rBIT,001h,rALM,wNAM,wAML,wCOM,wACC,  0h,0,	; A3	MOV  	AMSB ALSB, AX	Word
			3Ah, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; A4	MOVSB
			3Bh, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; A5	MOVSW
			0Eh, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; A6	CMPSB
			0Fh, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; A7	CMPSW
			
			5Fh, rBIT,000h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; A8	TEST	AL, LSB			Byte
			5Fh, rBIT,001h,rILM,wNAM,wACC,wCOM,wIML,  0h,0,	; A9	TEST	AX, MSB, LSB	Byte
			5Ch, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; AA	STOSB
			5Dh, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; AB	STOSW
			34h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; AC	LODSB
			35h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; AD	LODSW
			51h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; AE	SCASB
			52h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; AF	SCASW
			
			39h, rBIT,000h,rILM,wNAM,wREG,wCOM,wIML,  0h,0,	; B0	MOV 	AL, LSB				Byte
			39h, rBIT,010h,rILM,wNAM,wREG,wCOM,wIML,  0h,0,	; B1	MOV 	CL, LSB				Byte
			39h, rBIT,020h,rILM,wNAM,wREG,wCOM,wIML,  0h,0,	; B2	MOV 	DL, LSB				Byte
			39h, rBIT,030h,rILM,wNAM,wREG,wCOM,wIML,  0h,0,	; B3	MOV 	BL, LSB				Byte
			39h, rBIT,040h,rILM,wNAM,wREG,wCOM,wIML,  0h,0,	; B4	MOV 	AH, LSB				Byte
			39h, rBIT,050h,rILM,wNAM,wREG,wCOM,wIML,  0h,0,	; B5	MOV 	CH, LSB				Byte
			39h, rBIT,060h,rILM,wNAM,wREG,wCOM,wIML,  0h,0,	; B6	MOV 	DH, LSB				Byte
			39h, rBIT,070h,rILM,wNAM,wREG,wCOM,wIML,  0h,0,	; B7	MOV 	BH, LSB				Byte
			
			39h, rBIT,001h,rILM,wNAM,wREG,wCOM,wIML,  0h,0,	; B8	MOV 	AX, MSB LSB			Word
			39h, rBIT,011h,rILM,wNAM,wREG,wCOM,wIML,  0h,0,	; B9	MOV 	CX, MSB LSB			Word
			39h, rBIT,021h,rILM,wNAM,wREG,wCOM,wIML,  0h,0,	; BA	MOV 	DX, MSB LSB			Word
			39h, rBIT,031h,rILM,wNAM,wREG,wCOM,wIML,  0h,0,	; BB	MOV 	BX, MSB LSB			Word
			39h, rBIT,041h,rILM,wNAM,wREG,wCOM,wIML,  0h,0,	; BC	MOV 	SP, MSB LSB			Word
			39h, rBIT,051h,rILM,wNAM,wREG,wCOM,wIML,  0h,0,	; BD	MOV 	BP, MSB LSB			Word
			39h, rBIT,061h,rILM,wNAM,wREG,wCOM,wIML,  0h,0,	; BE	MOV 	SI, MSB LSB			Word
			39h, rBIT,071h,rILM,wNAM,wREG,wCOM,wIML,  0h,0,	; BF	MOV 	DI, MSB LSB			Word
			
			00h,   0h,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; C0	NO COMMAND
			00h,   0h,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; C1	NO COMMAND
			64h, rBIT,001h,rILM,wNAM,wIML,  0h,  0h,  0h,0,	; C2	RET		MSB LSB				Word
			64h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; C3	RET
			32h, rBIT,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; C4	LES		reg, r/m
			30h, rBIT,001h,rMWR,wNAM,wREG,wCOM,wROM,  0h,0,	; C5	LDS		reg, r/m
			39h, rBIT,000h,rMWR,rILM,wNAM,wROM,wCOM,wIML,0,	; C6	MOV		r/m, LSB
			39h, rBIT,001h,rMWR,rILM,wNAM,wROM,wCOM,wIML,0,	; C7	MOV		r/m, MSB LSB
			
			00h,   0h,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; C8	NO COMMAND
			00h,   0h,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; C9	NO COMMAND	
			4Ah, rBIT,001h,rILM,wNAM,wIML,  0h,  0h,  0h,0,	; CA	RETF	MSB LSB
			4Ah, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; CB	RETF
			1Ah, rBIT,000h,sLSB,003h,wNAM,wIML,  0h,  0h,0,	; CC	INT 	3
			1Ah, rBIT,000h,rILM,wNAM,wIML,  0h,  0h,  0h,0,	; CD	INT		number
			1Bh, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; CE	INTO
			1Ch, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; CF	IRET
			
			00h, rBIT,000h,rMWN,wNAM,wROM,wCOM,sONE,  0h,0,	; D0	Comm depends on code	Byte
			00h, rBIT,001h,rMWN,wNAM,wROM,wCOM,sONE,  0h,0,	; D1	Comm depends on code	Word
			00h, rBIT,000h,rMWN,wNAM,wROM,wCOM,sRAL,  0h,0,	; D2	Comm depends on code	Byte
			00h, rBIT,001h,rMWN,wNAM,wROM,wCOM,sRAL,  0h,0,	; D3	Comm depends on code	Word
			02h, rOFF,wNAM,  0h,  0h,  0h,  0h,  0h,  0h,0,	; D4	AAM
			01h, rOFF,wNAM,  0h,  0h,  0h,  0h,  0h,  0h,0,	; D5	AAD
			00h,   0h,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; D6	NO COMMAND			
			62h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; D7	XLAT
			
			65h, rBIT,000h,rMWR,wNAM,sESC,000h,wCOM,wROM,0,	; D8	ESC		hex(000 yyy), r/m
			65h, rBIT,000h,rMWR,wNAM,sESC,001h,wCOM,wROM,0,	; D9	ESC		hex(001 yyy), r/m
			65h, rBIT,000h,rMWR,wNAM,sESC,002h,wCOM,wROM,0,	; DA	ESC		hex(010 yyy), r/m
			65h, rBIT,000h,rMWR,wNAM,sESC,003h,wCOM,wROM,0,	; DB	ESC		hex(011 yyy), r/m
			65h, rBIT,000h,rMWR,wNAM,sESC,004h,wCOM,wROM,0,	; DC	ESC		hex(100 yyy), r/m
			65h, rBIT,000h,rMWR,wNAM,sESC,005h,wCOM,wROM,0,	; DD	ESC		hex(101 yyy), r/m
			65h, rBIT,000h,rMWR,wNAM,sESC,006h,wCOM,wROM,0,	; DE	ESC		hex(110 yyy), r/m
			65h, rBIT,000h,rMWR,wNAM,sESC,007h,wCOM,wROM,0,	; DF	ESC		hex(111 yyy), r/m
			
			38h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0,	; E0	LOOPNE	IP+offset
			37h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0,	; E1	LOOPE	IP+offset
			36h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0,	; E2	LOOP	IP+offset
			21h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0,	; E3	JCXZ	IP+offset
			18h, rBIT,000h,rILM,wNAM,sRAL,wCOM,wIML,  0h,0,	; E4	IN		AL, port
			18h, rBIT,000h,rILM,wNAM,sRAX,wCOM,wIML,  0h,0,	; E5	IN		AX, port
			41h, rBIT,000h,rILM,wNAM,sRAL,wCOM,wIML,  0h,0,	; E6	OUT		AL, port
			41h, rBIT,000h,rILM,wNAM,sRAX,wCOM,wIML,  0h,0,	; E7	OUT		AX, port
		
			07h, rBIT,001h,rILM,wNAM,wIML,  0h,  0h,  0h,0,	; E8	CALL 	MSB LSB
			26h, rBIT,001h,rILM,wNAM,wIML,  0h,  0h,  0h,0,	; E9	CALL 	MSB LSB
			26h, rBIT,001h,rALM,rILM,wNAM,sIAM,  0h,  0h,0,	; EA	JMP		MSB LSB:AMSB ALSB
			26h, rOFF,wNAM,wIPO,  0h,  0h,  0h,  0h,  0h,0,	; EB	JMP		IP+offset
			18h, rBIT,000h,wNAM,wACC,wCOM,rBIT,021h,wREG,0,	; EC	IN 		AL, DX
			18h, rBIT,021h,wNAM,wACC,wCOM,wREG,  0h,  0h,0,	; ED	IN 		AX, DX
			41h, rBIT,000h,wNAM,wACC,wCOM,rBIT,021h,wREG,0,	; EE	OUT		AL, DX
			41h, rBIT,001h,wNAM,wACC,wCOM,wREG,  0h,  0h,0,	; EF	OUT		AX, DX
			
			33h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; F0	LOCK
			00h,   0h,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; F1	NO COMMAND
			49h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; F2	REPNE
			48h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; F3	REP
			15h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; F4	HLT
			0Ch, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; F5	CMC
			00h, rBIT,000h,rMWN,wNAM,wROM,  0h,  0h,  0h,0,	; F6	Comm depends on code	Byte
			00h, rBIT,001h,rMWN,wNAM,wROM,  0h,  0h,  0h,0,	; F7	Comm depends on code	Word
			
			09h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; F8	CLC
			59h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; F9	STC
			08h, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; FA	CLI
			5Bh, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; FB	STI
			0Ah, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; FC	CLD
			5Ah, wNAM,  0h,  0h,  0h,  0h,  0h,  0h,  0h,0,	; FD	STD
			
			
extCodes db 
			
			
			
			
			
; Bits composition
; Xreg scvw
;     OR
; XXsr scvw
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
sSEG equ 21h	; Get SR from REG
sEXP equ 22h	; Write sign-extended LSB
sLSB equ 23h	; Read next command byte as LSB
sONE equ 24h	; Write symbol "1"
sRAL equ 25h	; Write "AL"
sRAX equ 26h	; Write "AX"
sESC equ 27h	; Read next command byte as yyy and then write reg yyy
sIAM equ 28h	; Write MSB LSB:AMSB ALSB


;           000  001  010  011  100  101  110  111
subNames db 05h, 40h, 04h, 50h, 06h, 5Eh, 63h, 0Dh,	; 0x80 - 0x83
			4Ch, 4Dh, 46h, 47h, 57h, 58h, 00h, 4Fh,	; 0xD0 - 0xD3
			5Fh, 00h, 3Fh, 3Dh, 3Ch, 17h, 14h, 16h,	; 0xF6 - 0xF7
			19h, 13h, 07h, 07h, 26h, 26h, 44h, 00h	; 0xFE - 0xFF

			
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
			'DI'		; 7

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
			'LOOPE'		; 37
			'LOOPNE',	; 38
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
			'XOR', 		; 63
			'RET',		; 64
			'ESC'		; 65