
section .text

global _start
_start:
    mov rcx, [test.test]

    mov rax, 0x3c
	mov rdi, 0
	syscall

section .data

test:
    .test dq 16
    


