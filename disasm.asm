.MODEL small
.STACK 100h

.DATA
helpMessage db "Gabrielius Vaiskunas, 4gr, Disasembleris", 10, 13, "Pirmas argumentas  - .COM failas", 10, 13, "Antras argumentas  - isvesties .ASM failas", 10, 13, "/? - parodo pagalbos pranesima", 10, 13, "$"
file1Loc db 30h DUP(0)
fileOLoc db 30h DUP(0)
fileError db "-- Duomenu failas nerastas", 10, 13, "$"
argError db "-- Neteisingi argumentai", 10, 13, "$"

handle1 dw 0
handle2 dw 0
argSize dw 0

f1Size dw 0
f2Size dw 0

bufSize equ 0FFh	; Input buffer size
bufLen equ 39h		; Output buffer size, DO NOT CHANGE!
f1buf db bufSize DUP(0)
f2buf db bufLen DUP(0)


include codes.asm

nCode	db 0
mod_ 	db 0
bits_ 	db 0
v    	db 0
w       db 0
s		db 0
reg 	db 0
rom  	db 0
num		db 0
sc      db 0
offst 	dw 0
imm 	dw 0
adr 	dw 0
wrptr	db 0
signed	db 0
nam		db 0
pref    db 4h
memAdd	dw 100h

.CODE
start:
    MOV     AX, @data                   ; Set DS to start of data segment
    MOV     DS, AX
    JMP     readArguments

skipSpaces PROC
    loopstart:
        CMP     byte ptr ES:[SI], " "   ; If symbol is not a space, exit function
        JNE     found
        INC     SI
        CMP     SI, [argSize]           ; Check if SI hasn't reached the end of arguments
        JE      nfound                  ; If so, show help/erros message
        JMP     loopstart
skipSpaces ENDP

found:
    STC    ; If found, set carry flag
    RET
nfound:
    CLC    ; If not found, unset carry flag
    RET

readName PROC
    MOV     DI, 0h                      ; Reset DI
    loopstart1:
        CMP     byte ptr ES:[SI], " "   ; If character is a space, end word
        JE      found
        MOV     DL, byte ptr ES:[SI]    ; Temporarily store character in DL register
        MOV     byte ptr [BX+DI], DL    ; Move character to filename buffer
        INC     SI
        INC     DI
        CMP     SI, [argSize]           ; Check if SI hasn't reached the end of arguments
        JE      nfound                  ; If so, end function
        JMP     loopstart1
readName ENDP

readArguments:
    MOV     CX, 0h
    MOV     CL, ES:[80h]            ; Get argument length
    CMP     CX, 0h                  ; If length is 0, print help message
    JE      help
    ADD     CX, 81h                 ; Store maximum argument length + 81h offset
    MOV     [argSize], CX

    MOV     SI, 81h
    CALL    skipSpaces              ; Remove leading spaces
    JNC     argHelpPrint
    CMP     byte ptr ES:[SI], '/'   ; If found "/", assume "?" symbol. Even if "?" symbol doesn't exist, arguments would be invalid
    JE      help                    ; If true, display help message

    MOV     BX, offset file1Loc     ; Select file1 to write
    CALL    readName                ; Read filename
    JNC     argHelpPrint            ; If argument length ended, show help/error message
    CALL    skipSpaces              ; Remove spaces
    JNC     argHelpPrint
    MOV     BX, offset fileOLoc     ; Select fileO to write
    CALL    readName                ; Read filename
    JC      argHelpPrint            ; If argument length didn't end (there are more arguments), show help/error message
    JMP     openFiles

argHelpPrint:
    MOV     DX, offset argError 	; Display help/error message
    MOV     AH, 09h
    INT     21h

help:
    MOV     DX, offset helpMessage  ; Display help message
    MOV     AH, 09h
    INT     21h
    JMP     exit

error:
    MOV     DX, offset fileError    ; Select error message
    MOV     AH, 09h                 ; Select buffer output to screen function
    INT     21h
    JMP     help

openFiles:
    ; Open input file
    MOV     AH, 3Dh                 ; Select open file (3Dh) function
    MOV     AL, 00h                 ; Open file as read-only
    MOV     DX, offset file1Loc     ; Select filename
    INT     21h
    JC      error              		; If file doesn't exist, exit program

    MOV     [handle1], AX           ; Save handle to file in memory

    ; Create output file
    MOV     AH, 3Ch                 ; Select create file function
    MOV     CX, 0h                  ; Clear file creation flags
    MOV     DX, offset fileOLoc     ; Select filename
    INT     21h

    MOV     [handle2], AX           ; Save handle to file in memory
	;JMP setup ;-----------------------------------------------------------------------------------

readData:
	MOV AH, 3Fh
	MOV	BX, [handle1]
	MOV CX, bufSize
	MOV DX, offset f1buf
	INT 21h

	MOV [f1Size], AX

setup:
	;INT 3h
	LEA		SI, f1buf
	MOV		[f2Size], SI

processOPCode:
    ;INT     3h
    ; Clear output buffer
    MOV     DI, outOffset
    MOV     CX, bufLen
	PUSH	SI
    LEA     SI, emptySpace
    REP MOVSB
	POP		SI

    ; Reset output buffer pointer
    MOV     DI, outOffset
    ;LEA     SI, f1buf
    ;INT     3h

    ; Write command address
    MOV     AL, byte ptr [memAdd+1]
    CALL    writeByte
    MOV     AL, byte ptr [memAdd]
    CALL    writeByte
    MOV     AX, ' :'
    STOSW
    MOV     AX, '  '
    STOSW

	_continue:

    ; Read command number
    CALL	loadByte
    MOV     BL, 0Ah
    MUL     BL
    MOV     BX, AX
    LEA     BP, [codes + BX]

    ; Read command name
    ;INT     3h
    MOV     AL, DS:[BP]
    MOV     [nCode], AL

    ; Execute command analysis functions
    _executeFunctionLoop:
        ;INT 3h
        INC     BP
        CMP     byte ptr DS:[BP], 0h
        JE      _outputAssemblyCode
        MOV     BL, DS:[BP]
        MOV     BH, 0h
        MOV     AL, 02h
        MUL     BL
        MOV     BL, AL
        CALL    [functions+BX]
        JMP     _executeFunctionLoop

	_outputAssemblyCode:
		PUSH	SI
		LEA		SI, [f2buf]
		MOV 	DI, outOffset
		MOV 	CX, bufLen
		__outputAssemblyCodeLoop:
			MOV		AL, ES:[DI]
			MOV		DS:[SI], AL
			INC		SI
			INC		DI
			LOOP __outputAssemblyCodeLoop
		MOV 	AH, 40h
		MOV		DX, offset f2buf
		MOV		BX, [handle2]
		MOV		CX, bufLen
		INT		21h

	_checkDataSize:
		POP SI
		PUSH SI

		;SUB SI, f2Size
		MOV AX, [f1Size]
		ADD AX, [f2Size]
		ADC AH, 0h
		INT 3h
		SUB AX, SI

		CMP f1Size, bufSize
		JNE __eof
			CMP AX, 6h
			JB seekBack
		__eof:
			CMP AX, 1h
			JL finish
		POP SI
		JMP processOPCode
    ;JMP     finish

seekBack:
	MOV CX, 0FFFFh
	MOV DX, AX
	NEG DX
	MOV AH, 42h
	MOv AL, 01h
	MOV BX, [handle1]
	INT 21h
	JMP readData

finish:
	MOV		AH, 3Eh
	MOV		BX, [handle1]
	INT		21h

	MOV		AH, 3Eh
	MOV		BX, [handle2]
	INT		21h

exit:
    MOV     AH, 4Ch                 ; Select return control to OS function
    INT     21h

writeByte PROC		; Write number stored in AL as ASCII symbols into output buffer
    PUSH 	CX				; Save CX
    PUSH    AX  			; Save AX
    MOV 	BL, 10h			; Will be dividing by 10h
    MOV     AH, 0h          ; Clear AH
    PUSH 	AX				; Save AX
    DIV 	BL				; Divide AL by 10h (get 1st number)
    CALL    num2ASCII		; Convert number to ASCII symbol
    STOSB					; Write symbol to output buffer
    POP 	AX				; Load AX
    ROL 	AL, 4h			; Swap the two hexadecimal AL numbers
    DIV 	BL				; Divide AL by 10h (get 2nd number)
    CALL    num2ASCII		; Convert number to ASCII symbol
    STOSB					; Write symbol to output buffer
    POP     AX              ; Restore AX
    POP		CX				; Restore CX
    RET
writeByte ENDP

num2ASCII PROC		; Convert number stored in AL to ASCII symbol
    CMP     AL, 9h
    JG      _alpha
    ADD     AL, 30h
    RET
    _alpha:
    ADD     AL, 37h
    RET
num2ASCII ENDP

loadByte PROC		; Read a byte from input buffer to AL
    MOV     AH, 0h
    MOV     AL, [SI]        ; Load byte
    CALL    writeByte       ; Write byte to output buffer
    INC     SI              ; Select next byte
	INC		[memAdd]
    RET
loadByte ENDP

writePrefix PROC	; Write the segment register prefix
    CMP 	byte ptr [pref], 4h
    JB 		_pref
        RET
    _pref:
	;INT 3h
    PUSH    AX
    PUSH    BX
    MOV     AH, 0h
    MOV     AL, [pref]
	ADD		AL, AL
    LEA     BX, regsS
    ADD     BX, AX
    MOV     AX, [BX]
	XCHG	AH, AL
    STOSW
    MOV     AL, ':'
    STOSB
    MOV     byte ptr [pref], 4h
    POP     BX
    POP     AX
    RET
writePrefix ENDP

writePtr PROC		; Write Byte/Word ptr
	;INT 3h
	PUSH 	SI
	CMP		byte ptr [W], 0h
	JNE 	_ptrW
		LEA 	SI, bptr
		JMP 	_ptrB
	_ptrW:
		LEA 	SI, wptr
	_ptrB:
	MOV 	CX, 9h
	REP MOVSB
	POP 	SI
	MOV 	byte ptr [wrptr], 0h
	RET
writePtr ENDP

readOffset PROC		; Read offset, subfunction of fwROM
	;INT 3h
    CMP 	byte ptr [mod_], 01h
    JE  	_readOff0

    CMP 	byte ptr [mod_], 02h
    JE 		_readOff0

    CMP 	byte ptr [mod_], 00h
    JNE 	_readOffEnd
        CMP 	byte ptr [rom], 6h
        JNE 	_readOffEnd
			CALL    loadByte                    ; Load byte for processing
			MOV     byte ptr [offst], AL
			CALL    loadByte
	        MOV     byte ptr [offst+1], AL     ; Byte read is MSB, save in 1st byte of offst
			;CALL	signOffset
			RET

    _readOff0:
    CALL    loadByte                    ; Load byte for processing
    ; If w = 0, read only a single byte and save it in MSB position
    MOV     byte ptr [offst], AL
    CMP		byte ptr [mod_], 2
    JNE 	_readOffEnd
    _readOff3:
        CALL    loadByte
        MOV     byte ptr [offst+1], AL     ; Byte read is MSB, save in 1st byte of offst
    _readOffEnd:
	CALL	signOffset
    RET
readOffset ENDP

signOffset PROC		; Make offset signed
	INT 3h
	CMP		[mod_], 01h
	JNE		_sign2B
		MOV 	AL, byte ptr [offst]
		CMP		AL, 80h
		JB		_signEnd
		MOV		[signed], 1h
		NEG		AL
		MOV		byte ptr [offst], AL
		RET
	_sign2B:
		MOV 	AX, [offst]
		CMP		AX, 8000h
		JB		_signEnd
		MOV		[signed], 1h
		NEG		AX
		MOV		[offst], AX
		RET
	_signEnd:
	RET
signOffset ENDP

frMW PROC			; Main analysis function for frMWR and frMWN functions
    CALL    loadByte        ; Load byte to AL for processing
    ; Save 2 copies of AX for processing
    PUSH    AX
    PUSH    AX
    ; Extract mod_
    MOV     CX, 40h
    DIV     CL
    MOV     [mod_], AL
    ; Extract r/m
    POP     AX
    ROR     AL, 3h
    MOV     CX, 20h
    DIV     CL
    MOV     [rom], AL
    ; Extract reg
    POP     AX
    ROL     AL, 2h
    DIV     CL
    MOV     [reg], AL
    RET
frMW ENDP

frMWR PROC			; Split byte into mod, reg and r/m
    CALL    frMW
    CALL    readOffset
    RET
frMWR ENDP

frMWN PROC			; Split byte int mod, reg and r/m and select name by reg code
	;INT 3h
    CALL    frMW
    MOV     DX, AX          ; Save offset in DX
    MOV     DH, 0h
    ; Get name block offset
    MOV     AL, [sc]
    MOV     CX, 8h
    MUL     CL
    ADD     AX, DX
    ; Get actual nameCode
    MOV     BX, offset subNames
    ADD     BX, AX
    MOV     AL, [BX]
    MOV     [nCode], AL
    CALL 	readOffset
    RET
frMWN ENDP

frBIT PROC			; Split byte into reg, sc, v, w and s
    ;INT 3h
    INC     BP
    MOV     AL, DS:[BP]
    MOV     AH, 0h
    ; Save 4 copies of AX for processing
    PUSH    AX
    PUSH    AX
    PUSH    AX
	PUSH    AX
    ; Extract reg
    ROL     AL, 1h
    MOV     CX, 20h
    DIV     CL
    MOV     [reg], AL
	MOV		[num], AL
    ; Extract sc
    POP     AX
    ROL     AL, 4h
    MOV     CX, 40h
    DIV     CL
    MOV     [sc], AL
    ; Extract V
    POP     AX
    AND     AL, 2h
    JZ      _vEqZ
    MOV     [v], 1h
    JMP     _vNEqZ
    _vEqZ:
        MOV     [v], 0h
    _vNEqZ:
    ; Extract W
    POP     AX
    AND     AL, 1h
    JZ      _wEqZ
    MOV     [w], 1h
    JMP      _wNEqZ
    _wEqZ:
        MOV     [w], 0h
    _wNEqZ:
	; Extract S
    POP     AX
    AND     AL, 80h
    JZ      _sEqZ
    MOV     [s], 1h
    JMP     _sNEqZ
    _sEqZ:
        MOV     [s], 0h
    _sNEqZ:
    RET
frBIT ENDP

frOFF PROC			; Read single-byte sized offset
    CALL    loadByte
    MOV     byte ptr [offst], AL
    RET
frOFF ENDP

frILM PROC			; Read immediate MSB LSB
    CALL loadByte                       ; Load byte for processing
    MOV     byte ptr [imm], AL          ; Byte read is LSB, save in 2nd byte of imm
	CMP		byte ptr [s], 1
	JE		_ILMEnd
    CMP     byte ptr [w], 1
    JNE      _ILMEnd
        CALL    loadByte                ; w == 1, read another byte
        MOV     byte ptr [imm+1], AL    ; Byte read is MSB, save in 1st byte of imm
    _ILMEnd:
    RET
frILM ENDP

frALM PROC			; Read address MSB LSB
    CALL    loadByte                    ; Load byte for processing
    MOV     byte ptr [adr], AL          ; Byte read is LSB, save in 2nd byte of adr
    CALL    loadByte                    ; Load 2nd byte for processing
    MOV     byte ptr [adr+1], AL        ; Byte read is MSB, save in 1st byte of adr
    RET
frALM ENDP

fwROM PROC			; Write r/m
    CMP 	byte ptr [mod_], 3h
    JNE 	_mem                                        ;       r/m is register
        MOV     BL, [rom]                           ; Load r/m number into BX
        CALL    fwREG2                              ; Write reg into output buffer
		MOV 	byte ptr [wrptr], 0
		RET
    _mem:                                           ;        r/m is memory
		CMP 	byte ptr [wrptr], 0
		JE 		_noPtr
			CALL writePtr
		_noPtr:
        CALL    writePrefix
        MOV     AL, '['
        STOSB

        CMP 	byte ptr [rom], 4h                      ; Check if r/m is less than 4, which would mean that it falls into "mem" name block
        JNB  	_mem2
            ; 0 <= r/m < 4
			;INT 3h
            MOV     BH, 0h
            MOV     BL, [rom]                       ; Load r/m number into BX
			MOV		AL, 5h
			MUL		BL
			MOV		BL, AL
            PUSH    SI                              ; Save SI
            LEA     SI, [mem + BX]                  ; Load start of name from "mem" name block to SI
            MOV     CX, 5h
            REP MOVSB
            POP     SI                              ; Restore SI
            CMP 	byte ptr [mod_], 0h                 ; Check if there is an offset
            JE  	_mem4
                JMP     _mem3

        _mem2:
            ; 4 <= r/m < 8
            CMP 	byte ptr [mod_], 0h                 ; mod=00, r/m=110 has only a memory value, check for that condition
            JNE 	__mem
                CMP     byte ptr [rom], 6h
                JE      _mem5
            __mem:
            MOV     BH, 0h
            MOV     BL, [rom]                       ; Load r/m number into BX
			ADD		BL, BL
			;INC		BL
			;DEC		BL
            MOV     AX, word ptr [mem2 + BX]                 ; Load name from "mem2" name block to AX
			XCHG	AL, AH
            STOSW                                   ; Write it to output buffer
            CMP 	byte ptr [mod_], 0h                 ; Check if there is an offset
            JE  	_mem4
                JMP     _mem3

        _mem3:
			CMP		[signed], 0h
			JNE		_memSigned
	            MOV     AL, '+'
				JMP		_memUnsigned
			_memSigned:
				MOV     AL, '-'
				MOV		[signed], 0h
			_memUnsigned:
            STOSB
            CMP 	byte ptr [mod_], 2h                 ; Check if the offset is byte or word size
            JNE 	_mem6
				_mem5:
                MOV     AL, byte ptr [offst+1]      ; Write a word size offset
                CALL    writeByte
            _mem6:
                MOV     AL, byte ptr [offst]        ; Write a byte size offset
                CALL    writeByte

        _mem4:
            ; mod == 00
            MOV     AL, ']'
            STOSB
    RET
fwROM ENDP

fwREG PROC			; Write reg
    MOV     BL, byte ptr [reg]                      ; Load reg offset to BX
    CALL    fwREG2
    RET
fwREG ENDP

fwREG2 PROC			; Write reg based on reg number stored in BL, subfunction of fwROM and fwREG functions
    MOV     BH, 0h
    ADD     BL, BL
    CMP 	byte ptr [w], 0h                            ; Check if width is byte or word
    JNE 	_wREG2B
        MOV     AX, word ptr [regs + BX]            ; Load a reg name from "regs" name block
		XCHG	AL, AH
        STOSW                                       ; Write it to output buffer
        RET
    _wREG2B:
        MOV     AX, word ptr [regs2 + BX]           ; Load a reg name from "regs2" name block
		XCHG	AL, AH
        STOSW                                       ; Write it to output buffer
        RET
fwREG2 ENDP

fwNAM PROC			; Write command name
    CMP		byte ptr [nam], 0h
	JNE		_notName
    MOV     DI, namOffset           ; Move output buffer pointer to name location
	_notName:
	MOV		byte ptr [nam], 0h
    PUSH    SI                      ; Save SI
    MOV     BH, 0h
    MOV     BL, [nCode]             ; Load nameCode to BX
    MOV     AL, 7h
    MUL     BL
    MOV     BX, AX
    LEA     SI, names+BX            ; Move SI to start of nameCode
    MOV     CX, 7h
    REP MOVSB                       ; Write name to output buffer
    POP     SI                      ; Restore SI
    MOV     DI, argOffset           ; Move output buffer pointer to argument location
    RET
fwNAM ENDP

fwCOM PROC			; Write a comma
    MOV     AX, ' ,'
    STOSW
    RET
fwCOM ENDP

fwACC PROC			; Write accumulator
    CMP 	byte ptr [w], 0h
    JNE 	_ACC2B
        MOV     AX, 'LA'
        STOSW
        RET
    _ACC2B:
        MOV     AX, 'XA'
        STOSW
        RET
fwACC ENDP

fwIML PROC			; Write immediate MSB LSB
    CMP 	byte ptr [w], 1h
    JNE 	_wIMLE1B
        MOV     AL, byte ptr [imm+1]
        CALL    writeByte
    _wIMLE1B:
        MOV     AL, byte ptr [imm]
        CALL    writeByte
    RET
fwIML ENDP

fwAML PROC			; Write address MSB LSB
    CALL    writePrefix
    MOV     AL, '['
    STOSB
    MOV     AL, byte ptr [adr+1]
    CALL    writeByte
    MOV     AL, byte ptr [adr]
    CALL    writeByte
    MOV     AL, ']'
    STOSB
    RET
fwAML ENDP

fwIPO PROC			; Write IP+offset
	;INT 3h
    MOV     BX, [memAdd]
    MOV     AL, byte ptr [offst]
	CBW
    ADD     BX, AX
	MOV		AX, BX
    XCHG    AH, AL
    CALL    writeByte
    XCHG    AH, AL
    CALL    writeByte
    RET
fwIPO ENDP

fwSEG PROC			; Write segment reg
    ;INT 3h
    LEA     BX, [regsS]
    MOV     AH, 0h
    MOV     AL, [reg]
    ADD     AL, AL          ; Multiply AL by 2
    ADD     BX, AX
    MOV     AX, [BX]
	XCHG	AH, AL
    STOSW
    RET
fwSEG ENDP

fwPRM PROC			; Write r/m with ptr
	;INT 3h
	MOV 	byte ptr [wrptr], 1h
	CALL 	fwROM
	RET
fwPRM ENDP

fsPRE PROC			; Set the seg reg prefix for next command
	;INT 3h
    MOV     AL, [reg]
    MOV     [pref], AL
	POP		AX
	JMP		_continue
fsPRE ENDP

fsEXP PROC			; Write sign-extended LSB
    MOV     AL, byte ptr [imm]
    CBW
    MOV     [imm], AX
    CALL    fwIML
    RET
fsEXP ENDP

fsSPC PROC			; Write text/symbol based on value of num
    CMP 	byte ptr [num], 0h
    JNE 	_sSPC0
        MOV     AL, '1'
        STOSB
        RET
    _sSPC0:
    CMP 	byte ptr [num], 1h
    JNE 	_sSPC1
        MOV     AX, 'LA'
        STOSW
        RET
    _sSPC1:
    CMP 	byte ptr [num], 2h
    JNE 	_sSPC2
        MOV     AX, 'XA'
        STOSW
        RET
    _sSPC2:
    CMP 	byte ptr [num], 3h
    JNE 	_sSPC3
        MOV     AL, '3'
        STOSB
        RET
    _sSPC3:
    CMP 	byte ptr [num], 4h
    JNE 	_sSPC4
        PUSH    SI
        LEA     SI, [farTxt]
        MOV     CX, 4h
        REP     MOVSB
        POP     SI
    _sSPC4:
	CMP 	byte ptr [num], 5h
    JNE 	_sSPC5
        MOV     AX, 'LC'
        STOSW
        RET
    _sSPC5:
    RET
fsSPC ENDP

fsESC PROC			; Read next byte as yyy and write hex(yyy reg)
    INC     BP
    MOV     AL, DS:[BP]
    MOV     BL, [reg]
    ROL     AL, 3h
    ADD     AL, BL
    CALL    writeByte
    RET
fsESC ENDP

fsIAM PROC			; Write MSB LSB:AMSB ALSB
    MOV     AL, byte ptr [imm+1]
    CALL    writeByte
    MOV     AL, byte ptr [imm]
    CALL    writeByte
    MOV     AL, ':'
    STOSB
    MOV     AL, byte ptr [adr+1]
    CALL    writeByte
    MOV     AL, byte ptr [adr]
    CALL    writeByte
    RET
fsIAM ENDP

fsEXT PROC			; Select and execute extended functions
	;INT 3h
    MOV     AL, [reg]
    MOV     AH, 0h
    MOV     BL, 6h
    MUL     BL
	CMP		byte ptr [sc], 1h
	JNE		_sEXTBlock0
	ADD		AX, 30h
	_sEXTBlock0:
    MOV     BX, AX
	DEC		BX
    LEA     BP, [extCodes + BX]
    RET
fsEXT ENDP

fsIPI PROC			; Write IP+offset
	;INT 3h
    MOV     BX, [memAdd]
    MOV     AX, [imm]
    ADD     BX, AX
	MOV		AX, BX
    XCHG    AH, AL
    CALL    writeByte
    XCHG    AH, AL
    CALL    writeByte
    RET
fsIPI ENDP

fsREP PROC
	MOV		byte ptr [nam], 1h
	; Read command number
	MOV		AH, 0h
	MOV 	AL, byte ptr [offst]
	MOV     BL, 0Ah
	MUL     BL
	MOV     BX, AX
	PUSH	BP
	LEA     BP, [codes + BX]

	; Read command name
	MOV     AL, DS:[BP]
	MOV     [nCode], AL
	POP		BP
	RET
fsREP ENDP

end
