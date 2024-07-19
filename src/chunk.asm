extern DrawRectangle

extern _ZN16OpenSimplexNoise5NoiseC2El
extern _ZNK16OpenSimplexNoise5Noise4evalEdd

extern printStr
extern printHex
extern printChar

extern getX
extern getY

global generateChunks
global drawChunks

section .text

; x in rax
; y in rbx
generateChunks:

    mov rsi, 0x100
    mov rdi, noise_ptr
    call _ZN16OpenSimplexNoise5NoiseC2El

    call getY
    mov rbx, rax
    call getX

    and rax, 0xfffffffffffffe00
    and rbx, 0xfffffffffffffe00
    add rax, 0x200
    add rbx, 0x200

    mov rcx, [chunks.width]
.iterateX:
    dec rcx

    mov rdx, [chunks.height]
.iterateY:
    dec rdx
    call generateChunk
    sub rbx, 0x200
    cmp rdx, 0
    jne .iterateY

    sub rax, 0x200
    add rbx, 0x600
    cmp rcx, 0
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
    mul qword [chunks.stepSizeY]
    mov r8, rax

    mov rax, rcx
    mul qword [chunks.stepSizeX]

    add rax, r8
    add rax, chunks

    mov rsi, rax

    pop rax
    mov [rsi], rax
    mov [rsi+8], rbx
    add rsi, 16

    mov rcx, [chunk.width]
.iterateTilesX:
    sub rcx, [tile.width]

    mov rdx, [chunk.height]
.iterateTilesY:
    sub rdx, [tile.height]
    call genTile
    cmp rdx, 0
    jne .iterateTilesY

    cmp rcx, 0
    jne .iterateTilesX

    pop rsi
    pop rdx
    pop rcx
    pop rbx
    pop rax

    ret

genTile:
    push rax ; chunk x
    push rbx ; chunk y
    push rcx ; x
    push rdx ; y
    push rsi ; chunk tile array pointer

    push rbp
    mov rbp, rsp
    sub rsp, 32

    add rax, rcx
    add rbx, rdx

    mov [rbp-8], rax
    mov [rbp-16], rbx
    mov qword [rbp-24], __float32__(0.001)

    ; calculate tile position in chunk tile array
    shr rdx, 5
    shr rcx, 5

    mov rax, rdx
    mul qword [chunk.tilesX]
    add rax, rcx
    add rsi, rax

    push rsi

    pxor xmm0,xmm0
    pxor xmm1,xmm1
    cvtsi2sd xmm0, [rbp-8]
    cvtsi2sd xmm1, [rbp-16]

    pxor xmm2, xmm2
    cvtss2sd xmm2, [rbp-24]

    mulsd xmm0, xmm2
    mulsd xmm1, xmm2

    mov rdi, noise_ptr
    call _ZNK16OpenSimplexNoise5Noise4evalEdd ; result in xmm0

    pop rsi
    mov byte [rsi], 0

    mov qword [rbp-8], __float32__(0.2)
    pxor xmm1,xmm1
    cvtss2sd xmm1, [rbp-8]
    subsd xmm0, xmm1
    movsd [rbp-8], xmm0

    mov rax, [rbp-8]

    shr rax, 63
    mov [rsi], al

    add rsp, 32
    pop rbp

    pop rsi
    pop rdx
    pop rcx
    pop rbx
    pop rax

    ret

drawChunks:
    push rax
    push rbx
    push rcx
    push rdx
    push rsi
    push rdi
    
    mov rcx, [chunks.width]
.iterateX:
    dec rcx

    mov rdx, [chunks.height]
.iterateY:
    dec rdx
    call drawChunk
    cmp rdx, 0
    jne .iterateY

    cmp rcx, 0
    jne .iterateX

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
    mul qword [chunks.stepSizeY]
    mov r8, rax

    mov rax, rcx
    mul qword [chunks.stepSizeX]

    add rax, r8
    add rax, chunks

    mov rsi, rax

    mov rax, [rsi] ; x
    mov rbx, [rsi+8] ; y
    add rsi, 0x10 ; chunk tile array offset

    mov rcx, [chunk.tilesX]
.iterateTilesX:
    dec rcx

    mov rdx, [chunk.tilesY]
.iterateTilesY:
    dec rdx
    call drawTile
    cmp rdx, 0
    jne .iterateTilesY

    cmp rcx, 0
    jne .iterateTilesX

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

     ; calculate true x pos
    mov rax, r10
    mul qword [tile.width]
    add rax, r8

    mov r12, rax ; true tile x pos
    call getX
    sub r12, rax

    ; calculate true y pos
    mov rax, r11
    mul qword [tile.height]
    add rax, r9

    mov r13, rax ; true tile y pos
    call getY
    sub r13, rax
    
    ; calculate tile position in chunk tile array
    mov rax, r11
    mul qword [chunk.tilesX]
    add rax, r10
    add rsi, rax

    ; find tile type and then get color based on tile type
    xor rax, rax
    mov dl, [rsi]
    cmp dl, 0
    cmove rax, [num_8]
    mov rsi, tileTypes
    add rsi, rax
    mov rdi, [rsi]

    xor r8, r8
    mov r8d, [rdi]

    mov rdi, r12
    mov rsi, r13
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

noise_ptr: dq 0

text:
    .chunk db 0xa,"Drawing chunk at: ",0

chunks:
    times (8 + 8 + (16*16)) * 9 db 0
    .thing dq $ - chunks
    .width dq 3
    .height dq 3
    .stepSizeX dq (8+8+(16*16))
    .stepSizeY dq 0x330

num_8 dq 8

chunk:
    .xOffset dq 0
    .yOffset dq $ - chunk
    .tiles: times (16*16) db 0
    .totalSize dq $ - chunk
    .tilesX dq 16
    .tilesY dq 16
    .width dq 32 * 16
    .height dq 32 * 16

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
