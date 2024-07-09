

global printStr
global printLine
global printHex


section .text

; string in rsi, null terminated
printStr:
    push rax
    push rbx
    push rcx
    push rdx
    push rsi
    push rdi
    push r8
    push r9
    push r10
    push r11
    push r12
    push r13
    push r14
    push r15

    call strLen

    ; rsi containes string pointer
    mov rdx, rax ; length
    mov rax, 1 ; exit
    mov rdi, 1 ; stdout
    syscall

    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8
    pop rdi
    pop rsi
    pop rdx
    pop rcx
    pop rbx
    pop rax

    ret

; string in rsi, null terminated
printLine:
    push rax
    push rbx
    push rcx
    push rdx
    push rsi
    push rdi
    push r8
    push r9
    push r10
    push r11
    push r12
    push r13
    push r14
    push r15

    call strLen

    push rsi
    add rsi, rax
    mov byte [rsi], 0x0a ; \n
    pop rbx
    push rsi
    mov rsi, rbx

    ; rsi containes string pointer
    mov rdx, rax ; length
    mov rax, 1 ; write
    mov rdi, 1 ; stdout
    syscall

    pop rsi
    mov byte [rsi], 0

    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8
    pop rdi
    pop rsi
    pop rdx
    pop rcx
    pop rbx
    pop rax

    ret

hexChars db "0123456789abcdef",0
hexPrefix db "0x",0

; number to print in rbx, doesnt print leading zeros
printHex:
    push rbx
    push rcx
    push rdx
    push rdi
    push rsi
    push r8
    push r9
    push r10
    push rax

    mov rsi, hexPrefix
    mov rdx, 2 ; length
    mov rax, 1 ; write
    mov rdi, 1 ; stdout
    syscall

    pop r8
    push r8

    mov r9, 1
    mov r10, 0
    mov cl, 60
    mov rbx, 0xf000000000000000
    mov rsi, hexChars

.loop:
    mov rax, r8
    and rax, rbx
    cmovz r10, r9
    cmp r10, 1
    je .updateValues
    mov r9, 0

    shr rax, cl

    mov al, [rsi+rax]
    call printChar

.updateValues:
    mov r10, 0
    sub cl, 4
    shr rbx, 4
    jnz .loop

    mov al, ' '
    call printChar

    pop r10
    pop r9
    pop r8
    pop rax
    pop rsi
    pop rdi
    pop rdx
    pop rcx
    pop rbx

    ret

; prints char in al
printChar:
    push rax
    push rbx
    push rcx
    push rdx
    push rsi
    push rdi
    push r8
    push r9
    push r10
    push r11
    push r12
    push r13
    push r14
    push r15


    mov [char], al
    mov rsi, char
    mov rdx, 1 ; length
    mov rax, 1 ; write
    mov rdi, 1 ; stdout
    syscall

    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8
    pop rdi
    pop rsi
    pop rdx
    pop rcx
    pop rbx
    pop rax

    ret

; string pointer in rsi
; returns length in rax
strLen:
    push rax
    push rbx
    push rcx
    push rdx
    push rsi
    push rdi
    push r8
    push r9
    push r10
    push r11
    push r12
    push r13
    push r14
    push r15

    xor rax, rax
.loop:
    cmp byte [rsi], 0
    jz .return
    inc rax
    inc rsi
    jmp .loop

.return:
    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8
    pop rdi
    pop rsi
    pop rdx
    pop rcx
    pop rbx
    pop rax
    ret


section .data

char db 0
