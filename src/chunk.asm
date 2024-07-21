extern DrawRectangle
extern DrawLine

extern _ZN16OpenSimplexNoise5NoiseC2El
extern _ZNK16OpenSimplexNoise5Noise4evalEdd

extern _Z6noise2ff

extern printStr
extern printHex
extern printChar

extern getPlayerX
extern getPlayerY

global chunksInit
global generateChunks
global drawChunks
global drawChunkBorders

section .text


chunksInit:
    mov rsi, 100
    mov rdi, octave1
    call _ZN16OpenSimplexNoise5NoiseC2El

    mov rsi, 1000
    mov rdi, octave2
    call _ZN16OpenSimplexNoise5NoiseC2El
    ret

; x in rax
; y in rbx
generateChunks:

    call getPlayerY
    mov rbx, rax
    call getPlayerX

    and rax, 0xfffffffffffffe00
    and rbx, 0xfffffffffffffe00
    add rax, [chunk.width]
    add rax, [chunk.width]
    add rbx, [chunk.height]

    mov rcx, [chunks.width]
.iterateX:
    dec rcx

    mov rdx, [chunks.height]
.iterateY:
    dec rdx
    call generateChunk
    sub rbx, [chunk.height]
    cmp rdx, 0
    jne .iterateY

    sub rax, [chunk.width]
    add rbx, 0x600 ; chunk.width * chunks.width
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
    mov qword [rbp-32], __float32__(0.01)

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
    cvtsi2ss xmm0, [rbp-8]
    cvtsi2ss xmm1, [rbp-16]

    movss [rbp-8], xmm0
    movss [rbp-16], xmm1

    movss xmm2, [rbp-24]

    mulss xmm0, xmm2
    mulss xmm1, xmm2

    call _Z6noise2ff
    cvtss2sd xmm0, xmm0
    ;mov rdi, octave1
    ;call _ZNK16OpenSimplexNoise5Noise4evalEdd ; result in xmm0

    movsd [rbp-24], xmm0

    movss xmm0, [rbp-8]
    movss xmm1, [rbp-16]

    movss xmm2, [rbp-32]

    mulss xmm0, xmm2
    mulss xmm1, xmm2

    call _Z6noise2ff
    cvtss2sd xmm0, xmm0

    movss xmm2, [rbp-32]
    cvtss2sd xmm2, xmm2

    mulsd xmm0, xmm2

    movsd xmm1, [rbp-24]
    addsd xmm0, xmm1

    pop rsi

    mov qword [rbp-8], __float32__(0.1)
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

    pop rdi
    pop rsi
    pop rdx
    pop rcx
    pop rbx
    pop rax

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
    call getPlayerX
    sub r12, rax

    ; calculate true y pos
    mov rax, r11
    mul qword [tile.height]
    add rax, r9

    mov r13, rax ; true tile y pos
    call getPlayerY
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


drawChunkBorders:
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
    call drawChunkBorder
    cmp rdx, 0
    jne .iterateY

    cmp rcx, 0
    jne .iterateX

    pop rdi
    pop rsi
    pop rdx
    pop rcx
    pop rbx
    pop rax
    ret


drawChunkBorder:

    push rcx
    push rdx

    push rbp
    mov rbp, rsp
    sub rsp, 16

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

    mov [rbp-8], rax
    mov [rbp-16], rbx

    call getPlayerX
    sub [rbp-8], rax
    call getPlayerY
    sub [rbp-16], rax

    ; bottom
    mov rdi, [rbp-8]
    mov rsi, [rbp-16]

    mov rdx, [rbp-8]
    add rdx, [chunk.width] 
    mov rcx, [rbp-16]

    mov r8d, 0xff0000ff

    call DrawLine


    ; left
    mov rdi, [rbp-8]
    mov rsi, [rbp-16]

    mov rdx, [rbp-8]
    mov rcx, [rbp-16]
    add rcx, [chunk.height]

    mov r8d, 0xff0000ff

    call DrawLine

    ; right
    mov rdi, [rbp-8]
    add rdi, [chunk.width]
    mov rsi, [rbp-16]

    mov rdx, [rbp-8]
    add rdx, [chunk.width] 
    mov rcx, [rbp-16]
    add rcx, [chunk.height]

    mov r8d, 0xff0000ff

    call DrawLine

    ; top
    mov rdi, [rbp-8]
    mov rsi, [rbp-16]
    add rsi, [chunk.height]

    mov rdx, [rbp-8]
    add rdx, [chunk.width] 
    mov rcx, [rbp-16]
    add rcx, [chunk.height]

    mov r8d, 0xff0000ff

    call DrawLine

    add rsp, 16
    pop rbp

    pop rdx
    pop rcx

    ret


; x in rax, y in rbx
; returns tileType in rax
getTile:
    push rbx
    push rcx
    push rdx
    push rsi

    push rax
    push rbx

    shr rax, 5
    shr rbx, 5
    and rax, 0x3
    and rbx, 0x3

    mul qword [chunks.stepSizeY]
    mov r8, rax

    mov rax, rbx
    mul qword [chunks.stepSizeX]

    add rax, r8
    add rax, chunks
    mov rsi, rax

    pop rbx
    pop rax

    add rsi, 16

    xchg rax, rbx ; x in rbx, y in rax
    mul [chunk.tilesX]
    

    pop rsi
    pop rdx
    pop rcx
    pop rbx

    ret

section .data

octave1: dq 0
octave2: dq 0

text:
    .chunk db 0xa,"Drawing chunk at: ",0

chunks:
    times (8 + 8 + (16*16)) * 9 db 0
    .thing dq $ - chunks
    .width dq 3
    .height dq 3
    .stepSizeX dq (8+8+(16*16))
    .stepSizeY dq (8+8+(16*16)) * 3

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
