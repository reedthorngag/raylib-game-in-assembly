extern InitWindow
extern CloseWindow
extern WindowShouldClose
extern BeginDrawing
extern EndDrawing
extern SetTargetFPS
extern SetExitKey
extern ClearBackground
extern BeginMode2D
extern EndMode2D
extern DrawRectangle
extern DrawRectangleRec
extern DrawFPS
extern IsKeyDown
extern TextFormat
extern DrawText

extern getX
extern getY
extern getRelX
extern getRelY
extern stepPosX
extern stepNegX
extern stepPosY
extern stepNegY
extern drawPlayer

extern printStr
extern printHex

section .text

global _start
_start:
	push rbp
	mov rbp, rsp
	sub rsp, 24

	; setup camera2d struct
	mov qword [rbp-24], 0 ; target
	mov qword [rbp-16], 0 ; offset
	mov dword [rbp-8],  0 ; rotation
	mov dword [rbp-4],  0x3F800000 ; 1.0f  zoom

	mov rdi, [screen.width]
	mov rsi, [screen.height]
	mov rdx, title
	call InitWindow

	mov rdi, 60
	call SetTargetFPS

	mov rdi, 256 ; esc
	call SetExitKey
	; fall through to the game loop

game_loop:

	call WindowShouldClose
	cmp rax, 1
	je exit

	; fallthrough to keychecks, which falls through to the render function
key_checks:
	; https://docs.rs/raylib/latest/raylib/consts/enum.KeyboardKey.html

.left_arrow:
	mov rdi, 263
	call IsKeyDown
	cmp rax, 1
	jne .right_arrow

	call stepNegX

.right_arrow:
	mov rdi, 262
	call IsKeyDown
	cmp rax, 1
	jne .up_arrow

	call stepPosX

.up_arrow:
	mov rdi, 265
	call IsKeyDown
	cmp rax, 1
	jne .down_arrow

	call stepNegY

.down_arrow:
	mov rdi, 264
	call IsKeyDown
	cmp rax, 1
	jne .done

	call stepPosY

.done:

render:
	call BeginDrawing

	push qword [rbp - 8]
	push qword [rbp - 16]
	push qword [rbp  - 24]
	call BeginMode2D
	add rsp, 24

	; mov rax, 0x4300000043a00000 ; position - float y, float x
	; mov rdx, 0x42c8000042f80000 ; size - float y, float x
	; mov rdi, 0xff00ff00 ; color (encoded a,b,g,r - 1 byte each)
	; movq xmm0, rax
	; movq xmm1, rdx
	; call DrawRectangleRec

	mov rdi, 0xFFFF0000
	call ClearBackground


	call drawPlayer

	call EndMode2D

	mov rdi, 10
	mov rsi, 10
	call DrawFPS

	call drawPos

	call EndDrawing
	;jmp game_loop

	mov rsi, title
	call printStr
	mov rax, 0x0f0f0f
	call printHex
	call printStr

exit:
	call	CloseWindow

	add rsp, 24
	pop rbp

	; exit(0)
	mov rax, 0x3c
	mov rdi, 0
	syscall

drawPos:

	sub rsp, 8
	call getX
	mov rsi, rax
	call getY
	mov rdx, rax
	lea rdi, [posString]
	xor rax, rax
	call TextFormat

	mov r8, 0xffa0a0a0
	mov rcx, 20
	mov rsi, 10
	mov rdx, 40
	mov rdi, rax
	call DrawText

	add rsp, 8
	ret

section .data

title db 'Hello world!', 0
posString db 'Pos: %i, %i',0

screen:
  .width dq 800
  .height dq 450


