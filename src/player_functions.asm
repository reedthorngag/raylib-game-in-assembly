extern DrawRectangle

extern printHex
extern printChar

extern tileWalkable

global getPlayerX
global getPlayerY
global getScreenRelX
global getScreenRelY

global stepPosX
global stepNegX
global stepPosY
global stepNegY
global drawPlayer
global changedChunk

section .text

getPlayerX:
    mov rax, [player.viewX]
    ret

getPlayerY:
    mov rax, [player.viewY]
    ret

getScreenRelX:
    mov rax, [player.relX]
    ret

getScreenRelY:
    mov rax, [player.relY]
    ret

stepPosX:
    mov rax, [player.x]
    add rax, [player.speed]
    mov rcx, rax
    mov rbx, [player.y]
    call tileWalkable
    call printHex
    cmp rax, 0
    je .return

    mov [player.x], rcx

    mov rax, [player.relX]
    add rax, [player.speed]
    cmp rax, [player.maxRelX]
    mov [player.relX], rax
    jle .return

    mov rcx, [player.maxRelX]
    sub rax, rcx
    mov [player.relX], rcx
    add [player.viewX], rax

.return:
    ret


stepNegX:
    mov rax, [player.relX]
    sub rax, [player.speed]
    cmp rax, [player.minRelX]
    mov [player.relX], rax
    jge .return
    
    mov rcx, [player.minRelX]
    sub rcx, rax
    add rax, rcx
    mov [player.relX], rax
    sub [player.viewX], rcx

.return:
    ret

stepPosY:
    mov rax, [player.relY]
    add rax, [player.speed]
    cmp rax, [player.maxRelY]
    mov [player.relY], rax
    jle .return

    mov rcx, [player.maxRelY]
    sub rax, rcx
    mov [player.relY], rcx
    add [player.viewY], rax

.return:
    ret

stepNegY:
    mov rax, [player.relY]
    sub rax, [player.speed]
    cmp rax, [player.minRelY]
    mov [player.relY], rax
    jge .return
    
    mov rcx, [player.minRelY]
    sub rcx, rax
    add rax, rcx
    mov [player.relY], rax
    sub [player.viewY], rcx

.return:
    ret


drawPlayer:
    mov rdi, [player.relX]
    mov rsi, [player.relY]
    mov rdx, [player.width]
    mov rcx, [player.height]
    mov r8, 0xFF0000FF
    call DrawRectangle

    ret

changedChunk:
    mov rax, [player.viewX]
    shr rax, 9
    mov rbx, [player.viewY]
    shr rbx, 9

    cmp rax, [player.lastChunkX]
    jne .true

    cmp rbx, [player.lastChunkY]
    je .false

.true:
    mov [player.lastChunkX], rax
    mov [player.lastChunkY], rbx
    call printHex
    mov rax, rbx
    call printHex
    mov al, 0x0a
    call printChar
    mov rax, 1
    ret

.false:
    xor rax, rax
    ret


section .data

player:
    .x dq 0
    .y dq 0
    .relX dq 395
    .relY dq 220
    .minRelX dq 100
    .minRelY dq 80
    .maxRelX dq 690
    .maxRelY dq 360
    .viewX dq 2000
    .viewY dq 136
    .lastChunkX dq 0
    .lastChunkY dq 0
    .speed dq 8
    .width dq 20
    .height dq 20


