extern DrawRectangle

extern printStr
extern printHex

global generateChunks
global drawChunks

section .text

; x in rax
; y in rbx
generateChunks:
    and rax, 0xfffffffffffffe00
    and rbx, 0xfffffffffffffe00
    add rax, 0x200
    add rbx, 0x200

    mov rcx, [chunks.width]
.iterateX:

    mov rdx, [chunks.height]
.iterateY:
    call generateChunk
    sub rbx, 0x200
    dec dl
    jnz .iterateY

    sub rax, 0x200
    add rbx, 0x600
    dec cl
    jnz .iterateX

    ret

; x in rax
; y in rbx
generateChunk:

    push rax
    push rbx
    push rcx
    push rdx
    push rsi

    push rax
    mov rax, rdx
    mul qword [chunks.width]
    add rax, rcx
    add rax, chunks

    mov rsi, rax
    pop rax
    mov [rsi], rax
    mov [rsi+8], rbx
    add rsi, 0x10

    mov al, 1
    mov rcx, 0x100
.rep:
    dec al
    mov [rsi], al
    cmovz ax, word [.data]
    inc rsi

    dec rcx
    jnz .rep

    pop rsi
    pop rdx
    pop rcx
    pop rbx
    pop rax

    ret

.data dw 2

drawChunks:
    push rax
    push rbx
    push rcx
    push rdx
    push rsi
    push rdi
    
    mov rcx, [chunks.width]
.iterateX:

    mov rdx, [chunks.height]
.iterateY:
    call drawChunk
    dec dl
    jnz .iterateY

    dec cl
    jnz .iterateX

    pop rbx
    pop rcx
    pop rdx
    pop rax
    pop rsi
    pop rdi

    ret

drawChunk:
    push rcx
    push rdx

    mov rax, rdx
    mul qword [chunks.width]
    add rax, rcx
    add rax, chunks

    mov rsi, rax

    mov rax, [rsi] ; x
    mov rbx, [rsi+8] ; y
    add rsi, 0x10 ; chunk tile array offset

    mov rcx, [chunk.tilesX]
.iterateTilesX:

    mov rdx, [chunk.tilesY]
.iterateTilesY:
    call drawTile
    dec dl
    jnz .iterateTilesY

    dec cl
    jnz .iterateTilesX

.return:

    pop rdx
    pop rcx

    ret

drawTile:
    push rax
    push rbx
    push rcx
    push rdx
    push rsi
    push rdi

    mov r8, rax ; chunk x
    mov r9, rbx ; chunk y
    mov r10, rcx ; tile x
    mov r11, rdx ; tile y

    mov rax, rsi
    call printHex

    mov rax, r11
    call printHex

    ; calculate true y pos
    mov rax, r11
    mul qword [tile.height]
    call printHex
    add rax, r9

    mov rax, r11
    call printHex

    mov r12, rax ; true tile y pos
    
    ; calculate true x pos
    mov rax, r10
    mul qword [tile.width]
    add rax, r8

    mov r13, rax ; true tile x pos
    
    ; calculate tile position in chunk tile array
    mov rax, r11
    mul qword [chunk.tilesX]
    add rax, r10
    add rsi, rax


    ; find tile type and then get color based on tile type
    xor rax, rax
    mov rax, rsi
    call printHex
    mov rax, chunks
    call printHex
    mov dl, [rsi]
    mov rsi, text
    call printStr
    cmp dl, 0
    cmove rax, [num_8]
    mov rsi, tileTypes
    add rsi, rax
    mov rdi, [rsi]

    xor r8, r8
    mov r8d, dword [rdi]

    ; mov rsi, text
    ; call printStr

    ; mov rax, r12
    ; call printHex

    ; mov rax, r13
    ; call printHex

    mov rdi, [r12]
    mov rsi, [r13]
    mov rdx, [tile.width]
    mov rcx, [tile.height]
    call DrawRectangle

.return:

    pop rdi
    pop rsi
    pop rdx
    pop rcx
    pop rbx
    pop rax

    ret

section .data

text db 0xa,"Pos: ",0

chunks:
    times (8 + 8 + (16*16)) * 9 db 0
    .width dq 3
    .height dq 3

num_8 dq 8

chunk:
    .xOffset dq 0
    .yOffset dq $ - chunks
    .tiles: times (16*16) db 0
    .totalSize dq $ - chunks
    .tilesX dq 16
    .tilesY dq 16
    .width dq 16 * 32

tile:
    .type db 0
    .width dq 32
    .height dq 32

tileTypes:
    .land dq land
    .water dq water

land:
    .color dd 0xff20a020
    .walkable db 1

water:
    .color dd 0xffff3030
    .walkable db 0
