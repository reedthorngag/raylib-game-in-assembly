extern DrawRectangle

global generateChunks
global drawChunks

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

    pop rdx
    pop rcx
    pop rbx
    pop rax

    ret

.data dw 2

drawChunks:
    
    mov rcx, [chunks.width]
.iterateX:

    mov rdx, [chunks.height]
.iterateY:
    call drawChunk
    dec dl
    jnz .iterateY

    dec cl
    jnz .iterateX

    ret

drawChunk:
    push rsi
    push rax
    push rdx
    push rbx

    mov rax, rdx
    mul qword [chunks.width]
    add rax, rcx
    add rax, chunks

    mov rsi, rax

    mov rax, [rsi] ; x
    mov rbx, [rsi+8] ; y
    add rsi, 0x10

    mov rcx, [chunk.tilesX]
.iterateTilesX:

    mov rdx, [chunk.tilesY]
.iterateTilesY:
    call drawTile
    dec dl
    jnz .iterateTilesY

    dec cl
    jnz .iterateTilesX


    pop rbx
    pop rdx
    pop rax
    pop rsi

    ret

drawTile:
    push rdi
    push rsi
    push rax
    push rdx
    push rcx
    push rbx

    push rdx
    push rax
    mov rax, rdx
    mul qword [tile.width]
    pop rdx
    add rax, rdx
    push rax
    
    mov rax, rcx
    mul qword [tile.height]
    add rbx, rax
    
    pop rax
    pop rdx
    push rax
    mov rax, rdx
    mul qword [chunk.tilesX]
    add rax, rcx
    add rsi, rax

    xor rax, rax
    mov dl, [rsi]
    cmp dl, 0
    cmove rax, [.data]
    mov rsi, tileTypes
    add rsi, rax
    mov rdi, [rsi]
    xor r8, r8
    mov r8d, dword [rdi]

    pop rax
    mov rdi, [rax]
    mov rsi, [rbx]
    mov rdx, [tile.width]
    mov rcx, [tile.height]
    call DrawRectangle

    pop rbx
    pop rcx
    pop rdx
    pop rax
    pop rsi
    pop rdi

    ret

.data dq 8

chunks:
    times (8 + 8 + (16*16)) * 9 db 0
    .width dq 3
    .height dq 3

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
