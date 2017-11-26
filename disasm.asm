.MODEL small
.STACK 256h

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

bufSize dw 0Ah
f1buf db 0Ah DUP(0)
f2buf db 0Ah DUP(0)

nameproc db 0
mod_ db 0
bits_ db 0
bit db 0, 0, 0, 0	; d, s, v, w
reg db 0
sr  db 0
rm  db 0
offst db 0
imm db 0, 0
adr db 0, 0


.CODE
start:
    MOV AX, @data                   ; Set DS to start of data segment
    MOV DS, AX
    JMP readArguments

skipSpaces PROC
    loopstart:
        CMP byte ptr ES:[SI], " "   ; If symbol is not a space, exit function
        JNE found
        INC SI
        CMP SI, [argSize]           ; Check if SI hasn't reached the end of arguments
        JE nfound                   ; If so, show help/erros message
        JMP loopstart
skipSpaces ENDP

found:
	STC                         ; If found, set carry flag
	RET
nfound:
	CLC                         ; If not found, unset carry flag
	RET

readName PROC
    MOV DI, 0h                      ; Reset DI
    loopstart1:
        CMP byte ptr ES:[SI], " "   ; If character is a space, end word
        JE found
        MOV DL, byte ptr ES:[SI]    ; Temporarily store character in DL register
        MOV byte ptr [BX+DI], DL    ; Move character to filename buffer
        INC SI
        INC DI
        CMP SI, [argSize]           ; Check if SI hasn't reached the end of arguments
        JE nfound                  ; If so, end function
        JMP loopstart1
readName ENDP

readArguments:
    MOV CX, 0h
    MOV CL, ES:[80h]            ; Get argument length
    CMP CX, 0h                  ; If length is 0, print help message
    JE help
    ADD CX, 81h                 ; Store maximum argument length + 81h offset
    MOV [argSize], CX

    MOV SI, 81h
    CALL skipSpaces             ; Remove leading spaces
    JNC argHelpPrint
    CMP byte ptr ES:[SI], '/'   ; If found "/", assume "?" symbol. Even if "?" symbol doesn't exist, arguments would be invalid
    JE help                     ; If true, display help message
	
    MOV BX, offset file1Loc     ; Select file1 to write
    CALL readName               ; Read filename
    JNC argHelpPrint            ; If argument length ended, show help/error message
    CALL skipSpaces             ; Remove spaces
    JNC argHelpPrint
    MOV BX, offset fileOLoc     ; Select fileO to write
    CALL readName               ; Read filename
    JC argHelpPrint             ; If argument length didn't end (there are more arguments), show help/error message
    JMP openFiles

argHelpPrint:
    MOV DX, offset argError 	; Display help/error message
    MOV AH, 09h
    INT 21h

help:
    MOV DX, offset helpMessage  ; Display help message
    MOV AH, 09h
    INT 21h
    JMP exit

openFiles:
    ; Open input file
    INT 3h
    MOV AH, 3Dh                 ; Select open file (3Dh) function
    MOV AL, 00h                 ; Open file as read-only
    MOV DX, offset file1Loc     ; Select filename
    INT 21h

    JC jmpToError               ; If file doesn't exist, exit program

    MOV [handle1], AX           ; Save handle to file in memory
	
	MOV word ptr [f1Size], AX	; Store input file size

    ; Create output file

    MOV AH, 3Ch                 ; Select create file function
    MOV CX, 0h                  ; Clear file creation flags
    MOV DX, offset fileOLoc     ; Select filename
    INT 21h

    MOV [handle2], AX           ; Save handle to file in memory
    MOV BX, AX                  ; Move file handle from AX to BX

    ;JMP readFiles
	JMP exit

jmpToError:
    JMP error                   ; This function is needed because conditional jumps have a limited range
	
error:
    MOV DX, offset fileError    ; Select error message
    MOV AH, 09h                 ; Select buffer output to screen function
    INT 21h
    JMP help

exit:
    MOV AH, 4Ch                 ; Select return control to OS function
    INT 21h
end