
global getX
global getY
global getRelX
global getRelY

global stepPosX
global stepNegX
global stepPosY
global stepNegY

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


section .data

player:
  .relX dq 400
  .relY dq 225
  .minRelX dq 100
  .minRelY dq 80
  .maxRelX dq 580
  .maxRelY dq 260
  .x dq 0
  .y dq 0
  .speed dq 4


