extern printHex

section .text

global _start
_start:

	push rbp
	mov rbp, rsp
	sub rsp, 16

	mov dword [rbp-8], __float32__(5.0)
	mov dword [rbp-16], __float32__(0.5)

	mov rax, [rbp-8]
	call printHex

	pxor xmm0, xmm0
	pxor xmm1, xmm1
	cvtss2sd xmm0, [rbp-8]
	cvtss2sd xmm1, [rbp-16]

	mulsd xmm0, xmm1

	movsd [rbp-8], xmm0
	mov rax, [rbp-8]

	call printHex

	add rsp, 16
	pop rbp

	mov rax, 0
	ret

section .data



