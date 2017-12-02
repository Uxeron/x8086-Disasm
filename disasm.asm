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

EX dw 0
FX dw 0

bufSize dw 0FFh
f1buf db 08h, 0FFh DUP(0)
;f2buf db 0FFh DUP(0)

include codes.asm

nCode	db 0
mod_ 	db 0
bits_ 	db 0
v    	db 0
w       db 0
reg 	db 0
rom  	db 0
sc      db 0
offst 	dw 0
imm 	dw 0
adr 	dw 0
pref    db 5h
memAdd	dw 1234h


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

openFiles:
    ; Open input file
    ;INT 3h
    MOV     AH, 3Dh                 ; Select open file (3Dh) function
    MOV     AL, 00h                 ; Open file as read-only
    MOV     DX, offset file1Loc     ; Select filename
    INT     21h

    JC      jmpToError              ; If file doesn't exist, exit program

    MOV     [handle1], AX           ; Save handle to file in memory

	MOV     word ptr [f1Size], AX	; Store input file size

    ; Create output file

    MOV     AH, 3Ch                 ; Select create file function
    MOV     CX, 0h                  ; Clear file creation flags
    MOV     DX, offset fileOLoc     ; Select filename
    INT     21h

    MOV     [handle2], AX           ; Save handle to file in memory
    MOV     BX, AX                  ; Move file handle from AX to BX

    JMP     processOPCode
	JMP    exit

jmpToError:
    JMP     error                   ; This function is needed because conditional jumps have a limited range


processOPCode:
    INT     3h
    ; Clear output buffer
    MOV     DI, outOffset
    MOV     CX, 3Ah
    LEA     SI, emptySpace
    REP MOVSB

    ; Reset buffer pointers
    MOV     DI, outOffset
    LEA     SI, f1buf
	INT     3h

    ; Write command address
	MOV     AL, byte ptr [memAdd+1]
    CALL    writeByte
    MOV     AL, byte ptr [memAdd]
    CALL    writeByte
    MOV     AX, ' :'
    STOSW
    MOV     AX, '  '
    STOSW

    ; Read command number
    MOV     AL, [SI]
    CALL    writeByte
    INC     SI
    MOV     BL, 0Ah
    MUL     BL
    MOV     BX, AX
    LEA     BP, [codes + BX]

    ; Read command name
    INT     3h
    MOV     AL, DS:[BP]
    MOV     [nCode], AL

    ; Execute command analysis functions
    _executeFunctionLoop:
        INC     BP
        CMP     byte ptr DS:[BP], 0h
        JE      _outputAssemblyCode
        JMP     _executeFunctionLoop

    _outputAssemblyCode:
        CALL    [functions]
        CALL    [functions+2]
        CALL    [functions+4]

    JMP     exit




error:
    MOV     DX, offset fileError    ; Select error message
    MOV     AH, 09h                 ; Select buffer output to screen function
    INT     21h
    JMP     help

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
	ADD 	AL, '0'			; Convert number to ASCII symbol
	STOSB					; Write symbol to output buffer
	POP 	AX				; Load AX
	ROL 	AL, 4h			; Swap the two hexadecimal AL numbers
	DIV 	BL				; Divide AL by 10h (get 2nd number)
	ADD 	AL, '0'			; Convert number to ASCII symbol
	STOSB					; Write symbol to output buffer
    POP     AX              ; Restore AX
    POP		CX				; Restore CX
	RET
writeByte ENDP

loadByte PROC
    MOV     AH, 0h
    MOV     AL, [SI]        ; Load byte
    CALL    writeByte       ; Write byte to output buffer
    INC     SI              ; Select next byte
    RET
loadByte ENDP

writePrefix PROC
    CMP byte ptr [pref], 4h
    JB _pref
        RET
    _pref:
    PUSH    AX
    PUSH    BX
    MOV     AH, 0h
    MOV     AL, [pref]
    LEA     BX, regsS
    ADD     BX, AX
    MOV     AX, [BX]
    STOSW
    MOV     AL, ':'
    STOSB
    MOV     byte ptr [pref], 4h
    POP     BX
    POP     AX
    RET
writePrefix ENDP

readOffset PROC
    CMP byte ptr [mod_], 01h
    JNE  _readOffEnd
        CALL    readOffset
        RET

    CMP byte ptr [mod_], 02h
    JNE _readOffEnd
        CALL    readOffset
        RET

    CMP byte ptr [mod_], 00h
    JNE _readOffEnd
        CMP byte ptr [rom], 6h
        JNE _readOffEnd
            CALL    readOffset
            RET

    CALL    loadByte                    ; Load byte for processing
    ; If w = 0, read only a single byte and save it in MSB position
    MOV     byte ptr [offst], AL
    CMP byte ptr [mod_], 1
    JNE _readOffEnd
    ; If w = 1, read two bytes and save them in appropriate positions
        CALL    loadByte
        MOV     byte ptr [offst+1], AL     ; Byte read is MSB, save in 1st byte of offst
    _readOffEnd:
    RET
readOffset ENDP

frMWR PROC
    CALL    loadByte        ; Load byte to AL for processing
    ; Save 2 copies of AX for processing
    PUSH    AX
    PUSH    AX
    ; Extract mod_
    MOV     CX, 40h
    DIV     CH
    MOV     [mod_], AL
    ; Extract reg
    POP     AX
    MOV     CX, 20h
    ROL     AL, 2h
    DIV     CH
    MOV     [reg], AL
    ; Extract r/m
    POP     AX
    ROR     AL, 3h
    DIV     CH
    MOV     [rom], AL
    CALL readOffset
    RET
frMWR ENDP

frMWN PROC
    CALL    loadByte        ; Load byte to AL for processing
    ; Save 2 copies of AX for processing
    PUSH    AX
    PUSH    AX
    ; Extract mod_
    MOV     CX, 40h
    DIV     CH
    MOV     [mod_], AL
    ; Extract r/m
    POP     AX
    MOV     CX, 20h
    ROR     AL, 3h
    DIV     CH
    MOV     [rom], AL
    ; Extract name
    ; Get nameCode offset
    POP     AX
    ROL     AL, 2h
    DIV     CH
    MOV     [reg], AL
    MOV     DX, AX          ; Save offset in DX
    MOV     DH, 0h
    ; Get name block offset
    MOV     AL, [sc]
    MOV     CH, 8h
    MUL     CH
    ADD     AX, DX
    ; Get actual nameCode
    MOV     BX, offset subNames
    ADD     BX, AX
    MOV     AL, [BX]
    MOV     [nCode], AL
    CALL readOffset
    RET
frMWN ENDP

frBIT PROC
    INC     BP
    MOV     AL, DS:[BP]
    MOV     AH, 0h
    ; Save 3 copies of AX for processing
    PUSH    AX
    PUSH    AX
    PUSH    AX
    ; Extract reg
    ROL     AL, 1h
    MOV     CX, 20h
    DIV     CL
    MOV     [reg], AL
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
    RET
frBIT ENDP

frOFF PROC
    CALL    loadByte
    MOV     byte ptr [offst], AL
    RET
frOFF ENDP

frILM PROC
    CALL loadByte                       ; Load byte for processing
    ; If w = 0, read only a single byte and save it in MSB position
    MOV     byte ptr [imm], AL
    CMP     byte ptr [w], 1
    JNE      _ILMEnd
    ; If w = 1, read two bytes and save them in appropriate positions
        CALL    loadByte
        MOV     byte ptr [imm+1], AL    ; Byte read is MSB, save in 1st byte of imm
    _ILMEnd:
    RET
frILM ENDP

frALM PROC
    CALL    loadByte                    ; Load byte for processing
    MOV     byte ptr [adr], AL          ; Byte read is LSB, save in 2nd byte of adr
    CALL    loadByte                    ; Load 2nd byte for processing
    MOV     byte ptr [adr+1], AL        ; Byte read is MSB, save in 1st byte of adr
    RET
frALM ENDP

fwROM PROC
    CMP byte ptr [mod_], 3h
    JNE _mem                                        ;       r/m is register
        MOV     BL, [rom]                           ; Load r/m number into BX
        MOV     BH, 0h
        CMP byte ptr [w], 0h                        ; Check if width is byte or word size
        JNE _regWord
            MOV     AX, word ptr [regs+BX]          ; Load a reg name from byte register block
            STOSW                                   ; Write it to output buffer
            RET
        _regWord:
            MOV     AX, word ptr [regs2+BX]         ; Load a reg name from word register block 2
            STOSW                                   ; Write it to output buffer
            RET
    _mem:                                           ;        r/m is memory
        CALL    writePrefix
        MOV     AL, '['
        STOSB

        CMP byte ptr [rom], 4h                      ; Check if r/m is less than 4, which would mean that it falls into "mem" name block
        JG  _mem2
            ; 0 <= r/m < 4
            MOV     BH, 0h
            MOV     BL, [rom]                       ; Load r/m number into BX
            PUSH    SI                              ; Save SI
            LEA     SI, [mem + BX]                  ; Load start of name from "mem" name block to SI
            MOV     CX, 5h
            REP MOVSB
            POP     SI                              ; Restore SI
            CMP byte ptr [mod_], 0h                 ; Check if there is an offset
            JE  _mem4
                JMP     _mem3

        _mem2:
            ; 4 <= r/m < 8
            CMP byte ptr [mod_], 0h                 ; mod=00, r/m=110 has only a memory value, check for that condition
            JNE __mem
                CMP     byte ptr [rom], 6h
                JE      _mem5
            __mem:
            MOV     BH, 0h
            MOV     BL, [rom]                       ; Load r/m number into BX
            MOV     AX, [mem2 + BX]                 ; Load name from "mem2" name blcok to AX
            STOSW                                   ; Write it to output buffer
            CMP byte ptr [mod_], 0h                 ; Check if there is an offset
            JE  _mem4
                JMP     _mem3

        _mem3:
            MOV     AL, '+'
            STOSB
            CMP byte ptr [mod_], 1h                 ; Check if the offset is byte or word size
            JNE _mem5
                MOV     AL, byte ptr [offst+1]      ; Write a word size offset
                CALL    writeByte
            _mem5:
                MOV     AL, byte ptr [offst]        ; Write a byte size offset
                CALL    writeByte

        _mem4:
            ; mod == 00
            MOV     AL, ']'
            STOSB
    RET
fwROM ENDP

fwREG PROC
    MOV     BH, 0h
    MOV     BL, byte ptr [reg]                      ; Load reg offset to BX
    CMP byte ptr [w], 0h                            ; Check if width is byte or word
    JNE _wREG2B
        MOV     AX, word ptr [regs + BX]            ; Load a reg name from "regs" name block
        STOSW                                       ; Write it to output buffer
        RET
    _wREG2B:
        MOV     AX, word ptr [regs2 + BX]           ; Load a reg name from "regs2" name block
        STOSW                                       ; Write it to output buffer
        RET
fwREG ENDP

fwNAM PROC
    MOV     BP, namOffset           ; Move output buffer pointer to name location
    PUSH    SI                      ; Save SI
    MOV     BH, 0h
    MOV     BL, [nCode]             ; Load nameCode to BX
    LEA     SI, names+BX            ; Move SI to start of nameCode
    MOV     CX, 7h
    REP MOVSB                       ; Write name to output buffer
    POP     SI                      ; Restore SI
    MOV     BP, argOffset           ; Move output buffer pointer to argument location
    RET
fwNAM ENDP

fwCOM PROC
    MOV     AX, ' ,'
    STOSW
    RET
fwCOM ENDP

fwACC PROC
    CMP byte ptr [w], 0h
    JNE _ACC2B
        MOV     AX, 'LA'
        STOSW
        RET
    _ACC2B:
        MOV     AX, 'XA'
        STOSW
        RET
fwACC ENDP

fwIML PROC
    CMP byte ptr [w], 1h
    JNE _wIMLE1B
        MOV     AL, byte ptr [imm+1]
        CALL    writeByte
    _wIMLE1B:
        MOV     AL, byte ptr [imm]
        CALL    writeByte
    RET
fwIML ENDP

fwAML PROC
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

fwIPO PROC
    MOV     AX, [memAdd]
    ADD     AX, SI
    MOV     BH, 0h
    MOV     BL, byte ptr [offst]
    ADD     AX, BX
    XCHG    AH, AL
    CALL    writeByte
    XCHG    AH, AL
    CALL    writeByte
    RET
fwIPO ENDP

fwSEG PROC
    LEA     BX, [regsS]
    MOV     AH, 0h
    MOV     AL, [reg]
    ADD     BX, AX
    MOV     AX, [BX]
    STOSW
    RET
fwSEG ENDP

fsPRE PROC
    MOV     AL, [reg]
    MOV     [pref], AL
    RET
fsPRE ENDP

fsEXP PROC
    MOV     AL, byte ptr [imm]
    CBW
    MOV     byte ptr [imm+1], AL
    CALL    fwIML
    RET
fsEXP ENDP

fsSPC PROC
    CMP byte ptr [reg], 0h
    JNE _sSPC0
        MOV     AL, '1'
        STOSB
        RET
    _sSPC0:
    CMP byte ptr [reg], 1h
    JNE _sSPC1
        MOV     AX, 'LA'
        STOSW
        RET
    _sSPC1:
    CMP byte ptr [reg], 2h
    JNE _sSPC2
        MOV     AX, 'XA'
        STOSW
        RET
    _sSPC2:
    CMP byte ptr [reg], 3h
    JNE _sSPC3
        MOV     AL, '3'
        STOSB
        RET
    _sSPC3:
    CMP byte ptr [reg], 4h
    JNE _sSPC4
        PUSH    SI
        LEA     SI, [farTxt]
        MOV     CX, 4h
        REP     MOVSB
        POP     SI
    _sSPC4:
    RET
fsSPC ENDP

fsESC PROC
    INC     BP
    MOV     AL, DS:[BP]
    MOV     BL, [reg]
    ROL     BL, 3h
    ADD     AL, BL
    CALL    writeByte
    RET
fsESC ENDP

fsIAM PROC
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

fsEXT PROC
    MOV     AL, [reg]
    MOV     AH, 0h
    MOV     BL, 6h
    MUL     BL
    MOV     BX, AX
    LEA     BP, [extCodes + BX]
    RET
fsEXT ENDP

clearOverflow PROC
    PUSH    AX
    PUSHF
    POP     AX
    AND     AX, 0F7FFh
    PUSH    AX
    POPF
    POP     AX
    RET
clearOverflow ENDP

end
