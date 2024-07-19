extern DrawRectangle

extern printHex
extern printChar

global getX
global getY
global getRelX
global getRelY

global stepPosX
global stepNegX
global stepPosY
global stepNegY
global drawPlayer
global changedChunk

section .text

getX:
    mov rax, [player.x]
    ret

getY:
    mov rax, [player.y]
    ret

getRelX:
    mov rax, [player.relX]
    ret

getRelY:
    mov rax, [player.relY]
    ret

stepPosX:
    mov rax, [player.relX]
    add rax, [player.speed]
    cmp rax, [player.maxRelX]
    mov [player.relX], rax
    jle .return

    mov rcx, [player.maxRelX]
    sub rax, rcx
    mov [player.relX], rcx
    add [player.x], rax

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
    sub [player.x], rcx

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
    add [player.y], rax

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
    sub [player.y], rcx

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
    mov rax, [player.x]
    shr rax, 9
    cmp rax, [player.lastChunkX]
    jne .true

    mov rbx, [player.y]
    shr rbx, 9
    cmp rbx, [player.lastChunkY]
    je .false

.true:
    mov [player.lastChunkX], rax
    mov [player.lastChunkY], rbx
    call printHex
    mov rax, rbx
    call printHex
    mov rax, 0
    dec rax
    ret

.false:
    xor rax, rax
    ret


section .data

player:
  .relX dq 395
  .relY dq 220
  .minRelX dq 100
  .minRelY dq 80
  .maxRelX dq 690
  .maxRelY dq 360
  .x dq 0
  .y dq 0
  .lastChunkX dq 0
  .lastChunkY dq 0
  .speed dq 8
  .width dq 20
  .height dq 20


