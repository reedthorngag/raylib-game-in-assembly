	.file	"test.cpp"
	.text
	.section	.text._Z10Vector2Add7Vector2S_,"axG",@progbits,_Z10Vector2Add7Vector2S_,comdat
	.weak	_Z10Vector2Add7Vector2S_
	.type	_Z10Vector2Add7Vector2S_, @function
_Z10Vector2Add7Vector2S_:
.LFB963:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%xmm0, -24(%rbp)
	movq	%xmm1, -32(%rbp)
	movss	-24(%rbp), %xmm1
	movss	-32(%rbp), %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, -8(%rbp)
	movss	-20(%rbp), %xmm1
	movss	-28(%rbp), %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE963:
	.size	_Z10Vector2Add7Vector2S_, .-_Z10Vector2Add7Vector2S_
	.section	.text._Z15Vector2Subtract7Vector2S_,"axG",@progbits,_Z15Vector2Subtract7Vector2S_,comdat
	.weak	_Z15Vector2Subtract7Vector2S_
	.type	_Z15Vector2Subtract7Vector2S_, @function
_Z15Vector2Subtract7Vector2S_:
.LFB965:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%xmm0, -24(%rbp)
	movq	%xmm1, -32(%rbp)
	movss	-24(%rbp), %xmm0
	movss	-32(%rbp), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -8(%rbp)
	movss	-20(%rbp), %xmm0
	movss	-28(%rbp), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE965:
	.size	_Z15Vector2Subtract7Vector2S_, .-_Z15Vector2Subtract7Vector2S_
	.section	.text._Z13Vector2Length7Vector2,"axG",@progbits,_Z13Vector2Length7Vector2,comdat
	.weak	_Z13Vector2Length7Vector2
	.type	_Z13Vector2Length7Vector2, @function
_Z13Vector2Length7Vector2:
.LFB967:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%xmm0, -24(%rbp)
	movss	-24(%rbp), %xmm1
	movss	-24(%rbp), %xmm0
	mulss	%xmm0, %xmm1
	movss	-20(%rbp), %xmm2
	movss	-20(%rbp), %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm0, %xmm1
	movd	%xmm1, %eax
	movd	%eax, %xmm0
	call	sqrtf@PLT
	movd	%xmm0, %eax
	movl	%eax, -4(%rbp)
	movss	-4(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE967:
	.size	_Z13Vector2Length7Vector2, .-_Z13Vector2Length7Vector2
	.section	.text._Z12Vector2Scale7Vector2f,"axG",@progbits,_Z12Vector2Scale7Vector2f,comdat
	.weak	_Z12Vector2Scale7Vector2f
	.type	_Z12Vector2Scale7Vector2f, @function
_Z12Vector2Scale7Vector2f:
.LFB974:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%xmm0, -24(%rbp)
	movss	%xmm1, -28(%rbp)
	movss	-24(%rbp), %xmm0
	mulss	-28(%rbp), %xmm0
	movss	%xmm0, -8(%rbp)
	movss	-20(%rbp), %xmm0
	mulss	-28(%rbp), %xmm0
	movss	%xmm0, -4(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE974:
	.size	_Z12Vector2Scale7Vector2f, .-_Z12Vector2Scale7Vector2f
	.section	.rodata
	.align 8
.LC0:
	.string	"raylib [core] example - 2d camera"
.LC1:
	.string	"hello"
.LC14:
	.string	"Follow player center"
	.align 8
.LC15:
	.string	"Follow player center, but clamp to map edges"
	.align 8
.LC16:
	.string	"Follow player center; smoothed"
	.align 8
.LC17:
	.string	"Follow player center horizontally; update player center vertically after landing"
	.align 8
.LC18:
	.string	"Player push camera on getting too close to screen edge"
.LC22:
	.string	"X: %i, Y: %i"
.LC26:
	.string	"Controls:"
.LC27:
	.string	"- Right/Left to move"
.LC28:
	.string	"- Space to jump"
	.align 8
.LC29:
	.string	"- Mouse Wheel to Zoom in-out, R to reset zoom"
.LC30:
	.string	"- C to change camera mode"
.LC31:
	.string	"Current camera mode:"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1098:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$392, %rsp
	.cfi_offset 3, -24
	movl	$800, -28(%rbp)
	movl	$450, -32(%rbp)
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdx
	movl	$450, %esi
	movl	$800, %edi
	call	InitWindow@PLT
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	$0, -80(%rbp)
	movq	$0, -72(%rbp)
	movss	.LC2(%rip), %xmm0
	movss	%xmm0, -80(%rbp)
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, -76(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, -72(%rbp)
	movb	$0, -68(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, -208(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, -204(%rbp)
	movss	.LC5(%rip), %xmm0
	movss	%xmm0, -200(%rbp)
	movss	.LC2(%rip), %xmm0
	movss	%xmm0, -196(%rbp)
	movl	$0, -192(%rbp)
	movb	$-56, -188(%rbp)
	movb	$-56, -187(%rbp)
	movb	$-56, -186(%rbp)
	movb	$-1, -185(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, -184(%rbp)
	movss	.LC2(%rip), %xmm0
	movss	%xmm0, -180(%rbp)
	movss	.LC5(%rip), %xmm0
	movss	%xmm0, -176(%rbp)
	movss	.LC6(%rip), %xmm0
	movss	%xmm0, -172(%rbp)
	movl	$1, -168(%rbp)
	movb	$-126, -164(%rbp)
	movb	$-126, -163(%rbp)
	movb	$-126, -162(%rbp)
	movb	$-1, -161(%rbp)
	movss	.LC7(%rip), %xmm0
	movss	%xmm0, -160(%rbp)
	movss	.LC6(%rip), %xmm0
	movss	%xmm0, -156(%rbp)
	movss	.LC2(%rip), %xmm0
	movss	%xmm0, -152(%rbp)
	movss	.LC8(%rip), %xmm0
	movss	%xmm0, -148(%rbp)
	movl	$1, -144(%rbp)
	movb	$-126, -140(%rbp)
	movb	$-126, -139(%rbp)
	movb	$-126, -138(%rbp)
	movb	$-1, -137(%rbp)
	movss	.LC9(%rip), %xmm0
	movss	%xmm0, -136(%rbp)
	movss	.LC7(%rip), %xmm0
	movss	%xmm0, -132(%rbp)
	movss	.LC10(%rip), %xmm0
	movss	%xmm0, -128(%rbp)
	movss	.LC8(%rip), %xmm0
	movss	%xmm0, -124(%rbp)
	movl	$1, -120(%rbp)
	movb	$-126, -116(%rbp)
	movb	$-126, -115(%rbp)
	movb	$-126, -114(%rbp)
	movb	$-1, -113(%rbp)
	movss	.LC11(%rip), %xmm0
	movss	%xmm0, -112(%rbp)
	movss	.LC7(%rip), %xmm0
	movss	%xmm0, -108(%rbp)
	movss	.LC10(%rip), %xmm0
	movss	%xmm0, -104(%rbp)
	movss	.LC8(%rip), %xmm0
	movss	%xmm0, -100(%rbp)
	movl	$1, -96(%rbp)
	movb	$-126, -92(%rbp)
	movb	$-126, -91(%rbp)
	movb	$-126, -90(%rbp)
	movb	$-1, -89(%rbp)
	movl	$5, -36(%rbp)
	movq	$0, -240(%rbp)
	movq	$0, -232(%rbp)
	movq	$0, -224(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, -232(%rbp)
	movss	.LC2(%rip), %xmm0
	movss	%xmm0, -240(%rbp)
	movss	.LC12(%rip), %xmm0
	movss	%xmm0, -236(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, -224(%rbp)
	movss	.LC13(%rip), %xmm0
	movss	%xmm0, -220(%rbp)
	leaq	_Z18UpdateCameraCenterP8Camera2DP6PlayerP7EnvItemifii(%rip), %rax
	movq	%rax, -288(%rbp)
	leaq	_Z27UpdateCameraCenterInsideMapP8Camera2DP6PlayerP7EnvItemifii(%rip), %rax
	movq	%rax, -280(%rbp)
	leaq	_Z30UpdateCameraCenterSmoothFollowP8Camera2DP6PlayerP7EnvItemifii(%rip), %rax
	movq	%rax, -272(%rbp)
	leaq	_Z28UpdateCameraEvenOutOnLandingP8Camera2DP6PlayerP7EnvItemifii(%rip), %rax
	movq	%rax, -264(%rbp)
	leaq	_Z28UpdateCameraPlayerBoundsPushP8Camera2DP6PlayerP7EnvItemifii(%rip), %rax
	movq	%rax, -256(%rbp)
	movl	$0, -20(%rbp)
	movl	$5, -40(%rbp)
	leaq	.LC14(%rip), %rax
	movq	%rax, -336(%rbp)
	leaq	.LC15(%rip), %rax
	movq	%rax, -328(%rbp)
	leaq	.LC16(%rip), %rax
	movq	%rax, -320(%rbp)
	leaq	.LC17(%rip), %rax
	movq	%rax, -312(%rbp)
	leaq	.LC18(%rip), %rax
	movq	%rax, -304(%rbp)
	movl	$60, %edi
	call	SetTargetFPS@PLT
	jmp	.L10
.L19:
	call	GetFrameTime@PLT
	movd	%xmm0, %eax
	movl	%eax, -44(%rbp)
	movl	-44(%rbp), %esi
	movl	-36(%rbp), %edx
	leaq	-208(%rbp), %rcx
	leaq	-80(%rbp), %rax
	movd	%esi, %xmm0
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_Z12UpdatePlayerP6PlayerP7EnvItemif
	call	GetMouseWheelMove@PLT
	movss	.LC19(%rip), %xmm1
	mulss	%xmm0, %xmm1
	movss	-220(%rbp), %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, -220(%rbp)
	movss	-220(%rbp), %xmm0
	comiss	.LC20(%rip), %xmm0
	jbe	.L23
	movss	.LC20(%rip), %xmm0
	movss	%xmm0, -220(%rbp)
	jmp	.L13
.L23:
	movss	-220(%rbp), %xmm1
	movss	.LC21(%rip), %xmm0
	comiss	%xmm1, %xmm0
	jbe	.L13
	movss	.LC21(%rip), %xmm0
	movss	%xmm0, -220(%rbp)
.L13:
	movl	$82, %edi
	call	IsKeyPressed@PLT
	testb	%al, %al
	je	.L15
	movss	.LC13(%rip), %xmm0
	movss	%xmm0, -220(%rbp)
	movss	.LC2(%rip), %xmm0
	movss	%xmm0, -80(%rbp)
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, -76(%rbp)
.L15:
	movl	$67, %edi
	call	IsKeyPressed@PLT
	testb	%al, %al
	je	.L16
	movl	-20(%rbp), %eax
	addl	$1, %eax
	cltd
	idivl	-40(%rbp)
	movl	%edx, -20(%rbp)
.L16:
	movl	-20(%rbp), %eax
	cltq
	movq	-288(%rbp,%rax,8), %r11
	movl	-44(%rbp), %eax
	movl	-36(%rbp), %edx
	leaq	-208(%rbp), %r10
	leaq	-80(%rbp), %rsi
	leaq	-240(%rbp), %rdi
	movl	$450, %r9d
	movl	$800, %r8d
	movd	%eax, %xmm0
	movl	%edx, %ecx
	movq	%r10, %rdx
	call	*%r11
	call	BeginDrawing@PLT
	movl	-392(%rbp), %ecx
	movb	$-56, %cl
	movl	$-56, %eax
	movb	%al, %ch
	andl	$-16711681, %ecx
	movl	%ecx, %eax
	orl	$13107200, %eax
	orl	$-16777216, %eax
	movl	%eax, -392(%rbp)
	movl	%eax, %edi
	call	ClearBackground@PLT
	movl	$100, -48(%rbp)
	movl	$120, -52(%rbp)
	movl	-356(%rbp), %ecx
	movb	$-26, %cl
	movl	$41, %eax
	movb	%al, %ch
	andl	$-16711681, %ecx
	movl	%ecx, %eax
	orl	$3604480, %eax
	orl	$-16777216, %eax
	movl	%eax, -356(%rbp)
	movl	-52(%rbp), %edx
	movl	-48(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	TextFormat@PLT
	movl	-356(%rbp), %r8d
	movl	$20, %ecx
	movl	$80, %edx
	movl	$200, %esi
	movq	%rax, %rdi
	call	DrawText@PLT
	subq	$8, %rsp
	pushq	-224(%rbp)
	pushq	-232(%rbp)
	pushq	-240(%rbp)
	call	BeginMode2D@PLT
	addq	$32, %rsp
	movl	$0, -24(%rbp)
	jmp	.L17
.L18:
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	-16(%rax), %rax
	addq	%rbp, %rax
	leaq	-172(%rax), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	-16(%rax), %rax
	addq	%rbp, %rax
	subq	$192, %rax
	movq	(%rax), %rdx
	movq	8(%rax), %rax
	movl	(%rcx), %edi
	movq	%rdx, %xmm0
	movq	%rax, %xmm1
	call	DrawRectangleRec@PLT
	addl	$1, -24(%rbp)
.L17:
	movl	-24(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L18
	movq	$0, -352(%rbp)
	movq	$0, -344(%rbp)
	movss	.LC23(%rip), %xmm0
	movss	%xmm0, -344(%rbp)
	movss	.LC23(%rip), %xmm0
	movss	%xmm0, -340(%rbp)
	movss	-80(%rbp), %xmm0
	movss	.LC24(%rip), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -352(%rbp)
	movss	-76(%rbp), %xmm0
	movss	.LC23(%rip), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -348(%rbp)
	movl	-388(%rbp), %ecx
	movb	$-26, %cl
	movl	$41, %eax
	movb	%al, %ch
	andl	$-16711681, %ecx
	movl	%ecx, %eax
	orl	$3604480, %eax
	orl	$-16777216, %eax
	movl	%eax, %ecx
	movl	%ecx, -388(%rbp)
	movq	-352(%rbp), %rax
	movq	-344(%rbp), %rdx
	movl	%ecx, %edi
	movq	%rax, %xmm0
	movq	%rdx, %xmm1
	call	DrawRectangleRec@PLT
	movl	-384(%rbp), %edx
	movb	$-1, %dl
	movl	$-53, %eax
	movb	%al, %dh
	andl	$-16711681, %edx
	movl	%edx, %eax
	orl	$-16777216, %eax
	movl	%eax, %ecx
	movl	%ecx, -384(%rbp)
	movq	-80(%rbp), %rax
	movl	%ecx, %edi
	movss	.LC25(%rip), %xmm1
	movq	%rax, %xmm0
	call	DrawCircleV@PLT
	call	EndMode2D@PLT
	movl	-380(%rbp), %ecx
	movb	$0, %cl
	movl	$0, %eax
	movb	%al, %ch
	andl	$-16711681, %ecx
	movl	%ecx, %eax
	orl	$-16777216, %eax
	movl	%eax, -380(%rbp)
	movl	%eax, %r8d
	movl	$10, %ecx
	movl	$20, %edx
	movl	$20, %esi
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	call	DrawText@PLT
	movl	-376(%rbp), %edx
	movb	$80, %dl
	movl	$80, %eax
	movb	%al, %dh
	andl	$-16711681, %edx
	movl	%edx, %eax
	orl	$5242880, %eax
	orl	$-16777216, %eax
	movl	%eax, -376(%rbp)
	movl	%eax, %r8d
	movl	$10, %ecx
	movl	$40, %edx
	movl	$40, %esi
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	call	DrawText@PLT
	movl	-372(%rbp), %ecx
	movb	$80, %cl
	movl	$80, %eax
	movb	%al, %ch
	andl	$-16711681, %ecx
	movl	%ecx, %eax
	orl	$5242880, %eax
	orl	$-16777216, %eax
	movl	%eax, -372(%rbp)
	movl	%eax, %r8d
	movl	$10, %ecx
	movl	$60, %edx
	movl	$40, %esi
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	call	DrawText@PLT
	movl	-368(%rbp), %edx
	movb	$80, %dl
	movl	$80, %eax
	movb	%al, %dh
	andl	$-16711681, %edx
	movl	%edx, %eax
	orl	$5242880, %eax
	orl	$-16777216, %eax
	movl	%eax, -368(%rbp)
	movl	%eax, %r8d
	movl	$10, %ecx
	movl	$80, %edx
	movl	$40, %esi
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	call	DrawText@PLT
	movl	-364(%rbp), %ecx
	movb	$80, %cl
	movl	$80, %eax
	movb	%al, %ch
	andl	$-16711681, %ecx
	movl	%ecx, %eax
	orl	$5242880, %eax
	orl	$-16777216, %eax
	movl	%eax, -364(%rbp)
	movl	%eax, %r8d
	movl	$10, %ecx
	movl	$100, %edx
	movl	$40, %esi
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	call	DrawText@PLT
	movl	-360(%rbp), %edx
	movb	$0, %dl
	movl	$0, %eax
	movb	%al, %dh
	andl	$-16711681, %edx
	movl	%edx, %eax
	orl	$-16777216, %eax
	movl	%eax, -360(%rbp)
	movl	%eax, %r8d
	movl	$10, %ecx
	movl	$120, %edx
	movl	$20, %esi
	leaq	.LC31(%rip), %rax
	movq	%rax, %rdi
	call	DrawText@PLT
	movb	$80, %bl
	movl	$80, %eax
	movb	%al, %bh
	movl	%ebx, %eax
	andl	$-16711681, %eax
	orl	$5242880, %eax
	movl	%eax, %ebx
	movl	%ebx, %eax
	orl	$-16777216, %eax
	movl	%eax, %ebx
	movl	-20(%rbp), %eax
	cltq
	movq	-336(%rbp,%rax,8), %rax
	movl	%ebx, %r8d
	movl	$10, %ecx
	movl	$140, %edx
	movl	$40, %esi
	movq	%rax, %rdi
	call	DrawText@PLT
	call	EndDrawing@PLT
.L10:
	call	WindowShouldClose@PLT
	xorl	$1, %eax
	testb	%al, %al
	jne	.L19
	call	CloseWindow@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1098:
	.size	main, .-main
	.globl	_Z12UpdatePlayerP6PlayerP7EnvItemif
	.type	_Z12UpdatePlayerP6PlayerP7EnvItemif, @function
_Z12UpdatePlayerP6PlayerP7EnvItemif:
.LFB1099:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, -52(%rbp)
	movss	%xmm0, -56(%rbp)
	movl	$263, %edi
	call	IsKeyDown@PLT
	testb	%al, %al
	je	.L25
	movq	-40(%rbp), %rax
	movss	(%rax), %xmm0
	movss	-56(%rbp), %xmm2
	movss	.LC6(%rip), %xmm1
	mulss	%xmm2, %xmm1
	subss	%xmm1, %xmm0
	movq	-40(%rbp), %rax
	movss	%xmm0, (%rax)
.L25:
	movl	$262, %edi
	call	IsKeyDown@PLT
	testb	%al, %al
	je	.L26
	movq	-40(%rbp), %rax
	movss	(%rax), %xmm1
	movss	-56(%rbp), %xmm2
	movss	.LC6(%rip), %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	movq	-40(%rbp), %rax
	movss	%xmm0, (%rax)
.L26:
	movl	$32, %edi
	call	IsKeyDown@PLT
	testb	%al, %al
	je	.L27
	movq	-40(%rbp), %rax
	movzbl	12(%rax), %eax
	testb	%al, %al
	je	.L27
	movl	$1, %eax
	jmp	.L28
.L27:
	movl	$0, %eax
.L28:
	testb	%al, %al
	je	.L29
	movq	-40(%rbp), %rax
	movss	.LC32(%rip), %xmm0
	movss	%xmm0, 8(%rax)
	movq	-40(%rbp), %rax
	movb	$0, 12(%rax)
.L29:
	movb	$0, -1(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L30
.L37:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	movl	16(%rax), %eax
	testl	%eax, %eax
	je	.L31
	movq	-16(%rbp), %rax
	movss	(%rax), %xmm1
	movq	-24(%rbp), %rax
	movss	(%rax), %xmm0
	comiss	%xmm1, %xmm0
	jb	.L31
	movq	-16(%rbp), %rax
	movss	(%rax), %xmm1
	movq	-16(%rbp), %rax
	movss	8(%rax), %xmm0
	addss	%xmm1, %xmm0
	movq	-24(%rbp), %rax
	movss	(%rax), %xmm1
	comiss	%xmm1, %xmm0
	jb	.L31
	movq	-16(%rbp), %rax
	movss	4(%rax), %xmm0
	movq	-24(%rbp), %rax
	movss	4(%rax), %xmm1
	comiss	%xmm1, %xmm0
	jb	.L31
	movq	-16(%rbp), %rax
	movss	4(%rax), %xmm1
	movq	-24(%rbp), %rax
	movss	4(%rax), %xmm2
	movq	-40(%rbp), %rax
	movss	8(%rax), %xmm0
	mulss	-56(%rbp), %xmm0
	addss	%xmm2, %xmm0
	comiss	%xmm1, %xmm0
	jb	.L31
	movb	$1, -1(%rbp)
	movq	-40(%rbp), %rax
	pxor	%xmm0, %xmm0
	movss	%xmm0, 8(%rax)
	movq	-16(%rbp), %rax
	movss	4(%rax), %xmm0
	movq	-24(%rbp), %rax
	movss	%xmm0, 4(%rax)
	jmp	.L36
.L31:
	addl	$1, -8(%rbp)
.L30:
	movl	-8(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L37
.L36:
	movzbl	-1(%rbp), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L38
	movq	-40(%rbp), %rax
	movss	4(%rax), %xmm1
	movq	-40(%rbp), %rax
	movss	8(%rax), %xmm0
	mulss	-56(%rbp), %xmm0
	addss	%xmm1, %xmm0
	movq	-40(%rbp), %rax
	movss	%xmm0, 4(%rax)
	movq	-40(%rbp), %rax
	movss	8(%rax), %xmm1
	movss	-56(%rbp), %xmm2
	movss	.LC2(%rip), %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	movq	-40(%rbp), %rax
	movss	%xmm0, 8(%rax)
	movq	-40(%rbp), %rax
	movb	$0, 12(%rax)
	jmp	.L44
.L38:
	movq	-40(%rbp), %rax
	movb	$1, 12(%rax)
.L44:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1099:
	.size	_Z12UpdatePlayerP6PlayerP7EnvItemif, .-_Z12UpdatePlayerP6PlayerP7EnvItemif
	.globl	_Z18UpdateCameraCenterP8Camera2DP6PlayerP7EnvItemifii
	.type	_Z18UpdateCameraCenterP8Camera2DP6PlayerP7EnvItemifii, @function
_Z18UpdateCameraCenterP8Camera2DP6PlayerP7EnvItemifii:
.LFB1100:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	%ecx, -28(%rbp)
	movss	%xmm0, -32(%rbp)
	movl	%r8d, -36(%rbp)
	movl	%r9d, -40(%rbp)
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-36(%rbp), %xmm0
	movss	.LC33(%rip), %xmm2
	movaps	%xmm0, %xmm1
	divss	%xmm2, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-40(%rbp), %xmm0
	movss	.LC33(%rip), %xmm2
	divss	%xmm2, %xmm0
	movq	-8(%rbp), %rax
	movss	%xmm1, (%rax)
	movq	-8(%rbp), %rax
	movss	%xmm0, 4(%rax)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, 8(%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1100:
	.size	_Z18UpdateCameraCenterP8Camera2DP6PlayerP7EnvItemifii, .-_Z18UpdateCameraCenterP8Camera2DP6PlayerP7EnvItemifii
	.globl	_Z27UpdateCameraCenterInsideMapP8Camera2DP6PlayerP7EnvItemifii
	.type	_Z27UpdateCameraCenterInsideMapP8Camera2DP6PlayerP7EnvItemifii, @function
_Z27UpdateCameraCenterInsideMapP8Camera2DP6PlayerP7EnvItemifii:
.LFB1101:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$96, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%rdx, -88(%rbp)
	movl	%ecx, -92(%rbp)
	movss	%xmm0, -96(%rbp)
	movl	%r8d, -100(%rbp)
	movl	%r9d, -104(%rbp)
	movq	-72(%rbp), %rax
	movq	-80(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, 8(%rax)
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-100(%rbp), %xmm0
	movss	.LC33(%rip), %xmm2
	movaps	%xmm0, %xmm1
	divss	%xmm2, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-104(%rbp), %xmm0
	movss	.LC33(%rip), %xmm2
	divss	%xmm2, %xmm0
	movq	-72(%rbp), %rax
	movss	%xmm1, (%rax)
	movq	-72(%rbp), %rax
	movss	%xmm0, 4(%rax)
	movss	.LC5(%rip), %xmm0
	movss	%xmm0, -20(%rbp)
	movss	.LC5(%rip), %xmm0
	movss	%xmm0, -24(%rbp)
	movss	.LC34(%rip), %xmm0
	movss	%xmm0, -28(%rbp)
	movss	.LC34(%rip), %xmm0
	movss	%xmm0, -32(%rbp)
	movl	$0, -36(%rbp)
	jmp	.L47
.L48:
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	movss	-20(%rbp), %xmm0
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	fminf@PLT
	movd	%xmm0, %eax
	movl	%eax, -20(%rbp)
	movq	-48(%rbp), %rax
	movss	(%rax), %xmm1
	movq	-48(%rbp), %rax
	movss	8(%rax), %xmm0
	addss	%xmm0, %xmm1
	movd	%xmm1, %eax
	movss	-28(%rbp), %xmm0
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	fmaxf@PLT
	movd	%xmm0, %eax
	movl	%eax, -28(%rbp)
	movq	-48(%rbp), %rax
	movl	4(%rax), %eax
	movss	-24(%rbp), %xmm0
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	fminf@PLT
	movd	%xmm0, %eax
	movl	%eax, -24(%rbp)
	movq	-48(%rbp), %rax
	movss	4(%rax), %xmm1
	movq	-48(%rbp), %rax
	movss	12(%rax), %xmm0
	addss	%xmm0, %xmm1
	movd	%xmm1, %eax
	movss	-32(%rbp), %xmm0
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	fmaxf@PLT
	movd	%xmm0, %eax
	movl	%eax, -32(%rbp)
	addl	$1, -36(%rbp)
.L47:
	movl	-36(%rbp), %eax
	cmpl	-92(%rbp), %eax
	jl	.L48
	movl	-28(%rbp), %eax
	movl	%eax, %edx
	movabsq	$-4294967296, %rax
	andq	%r12, %rax
	orq	%rdx, %rax
	movq	%rax, %r12
	movl	-32(%rbp), %eax
	movl	%eax, %eax
	salq	$32, %rax
	movl	%r12d, %edx
	orq	%rdx, %rax
	movq	%rax, %r12
	subq	$8, %rsp
	movq	-72(%rbp), %rcx
	subq	$24, %rsp
	movq	%rsp, %rsi
	movq	(%rcx), %rax
	movq	8(%rcx), %rdx
	movq	%rax, (%rsi)
	movq	%rdx, 8(%rsi)
	movq	16(%rcx), %rax
	movq	%rax, 16(%rsi)
	movq	%r12, %xmm0
	call	GetWorldToScreen2D@PLT
	addq	$32, %rsp
	movq	%xmm0, %rax
	movq	%rax, -56(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %edx
	movabsq	$-4294967296, %rax
	andq	%rbx, %rax
	orq	%rdx, %rax
	movq	%rax, %rbx
	movl	-24(%rbp), %eax
	movl	%eax, %eax
	salq	$32, %rax
	movl	%ebx, %edx
	orq	%rdx, %rax
	movq	%rax, %rbx
	subq	$8, %rsp
	movq	-72(%rbp), %rcx
	subq	$24, %rsp
	movq	%rsp, %rsi
	movq	(%rcx), %rax
	movq	8(%rcx), %rdx
	movq	%rax, (%rsi)
	movq	%rdx, 8(%rsi)
	movq	16(%rcx), %rax
	movq	%rax, 16(%rsi)
	movq	%rbx, %xmm0
	call	GetWorldToScreen2D@PLT
	addq	$32, %rsp
	movq	%xmm0, %rax
	movq	%rax, -64(%rbp)
	movss	-56(%rbp), %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-100(%rbp), %xmm0
	comiss	%xmm1, %xmm0
	jbe	.L49
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-100(%rbp), %xmm0
	movss	-56(%rbp), %xmm1
	movl	-100(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	pxor	%xmm2, %xmm2
	cvtsi2ssl	%eax, %xmm2
	subss	%xmm2, %xmm1
	subss	%xmm1, %xmm0
	movq	-72(%rbp), %rax
	movss	%xmm0, (%rax)
.L49:
	movss	-52(%rbp), %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-104(%rbp), %xmm0
	comiss	%xmm1, %xmm0
	jbe	.L51
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-104(%rbp), %xmm0
	movss	-52(%rbp), %xmm1
	movl	-104(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	pxor	%xmm2, %xmm2
	cvtsi2ssl	%eax, %xmm2
	subss	%xmm2, %xmm1
	subss	%xmm1, %xmm0
	movq	-72(%rbp), %rax
	movss	%xmm0, 4(%rax)
.L51:
	movss	-64(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	comiss	%xmm1, %xmm0
	jbe	.L53
	movl	-100(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	movss	-64(%rbp), %xmm1
	subss	%xmm1, %xmm0
	movq	-72(%rbp), %rax
	movss	%xmm0, (%rax)
.L53:
	movss	-60(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	comiss	%xmm1, %xmm0
	ja	.L60
	jmp	.L61
.L60:
	movl	-104(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	movss	-60(%rbp), %xmm1
	subss	%xmm1, %xmm0
	movq	-72(%rbp), %rax
	movss	%xmm0, 4(%rax)
.L61:
	nop
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1101:
	.size	_Z27UpdateCameraCenterInsideMapP8Camera2DP6PlayerP7EnvItemifii, .-_Z27UpdateCameraCenterInsideMapP8Camera2DP6PlayerP7EnvItemifii
	.data
	.align 4
	.type	_ZZ30UpdateCameraCenterSmoothFollowP8Camera2DP6PlayerP7EnvItemifiiE8minSpeed, @object
	.size	_ZZ30UpdateCameraCenterSmoothFollowP8Camera2DP6PlayerP7EnvItemifiiE8minSpeed, 4
_ZZ30UpdateCameraCenterSmoothFollowP8Camera2DP6PlayerP7EnvItemifiiE8minSpeed:
	.long	1106247680
	.align 4
	.type	_ZZ30UpdateCameraCenterSmoothFollowP8Camera2DP6PlayerP7EnvItemifiiE15minEffectLength, @object
	.size	_ZZ30UpdateCameraCenterSmoothFollowP8Camera2DP6PlayerP7EnvItemifiiE15minEffectLength, 4
_ZZ30UpdateCameraCenterSmoothFollowP8Camera2DP6PlayerP7EnvItemifiiE15minEffectLength:
	.long	1092616192
	.align 4
	.type	_ZZ30UpdateCameraCenterSmoothFollowP8Camera2DP6PlayerP7EnvItemifiiE13fractionSpeed, @object
	.size	_ZZ30UpdateCameraCenterSmoothFollowP8Camera2DP6PlayerP7EnvItemifiiE13fractionSpeed, 4
_ZZ30UpdateCameraCenterSmoothFollowP8Camera2DP6PlayerP7EnvItemifiiE13fractionSpeed:
	.long	1061997773
	.text
	.globl	_Z30UpdateCameraCenterSmoothFollowP8Camera2DP6PlayerP7EnvItemifii
	.type	_Z30UpdateCameraCenterSmoothFollowP8Camera2DP6PlayerP7EnvItemifii, @function
_Z30UpdateCameraCenterSmoothFollowP8Camera2DP6PlayerP7EnvItemifii:
.LFB1102:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movl	%ecx, -60(%rbp)
	movss	%xmm0, -64(%rbp)
	movl	%r8d, -68(%rbp)
	movl	%r9d, -72(%rbp)
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-68(%rbp), %xmm0
	movss	.LC33(%rip), %xmm2
	movaps	%xmm0, %xmm1
	divss	%xmm2, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-72(%rbp), %xmm0
	movss	.LC33(%rip), %xmm2
	divss	%xmm2, %xmm0
	movq	-40(%rbp), %rax
	movss	%xmm1, (%rax)
	movq	-40(%rbp), %rax
	movss	%xmm0, 4(%rax)
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %xmm1
	movq	(%rax), %xmm0
	call	_Z15Vector2Subtract7Vector2S_
	movq	%xmm0, %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	call	_Z13Vector2Length7Vector2
	movd	%xmm0, %eax
	movl	%eax, -20(%rbp)
	movss	_ZZ30UpdateCameraCenterSmoothFollowP8Camera2DP6PlayerP7EnvItemifiiE15minEffectLength(%rip), %xmm1
	movss	-20(%rbp), %xmm0
	comiss	%xmm1, %xmm0
	ja	.L65
	jmp	.L66
.L65:
	movss	_ZZ30UpdateCameraCenterSmoothFollowP8Camera2DP6PlayerP7EnvItemifiiE8minSpeed(%rip), %xmm1
	movss	_ZZ30UpdateCameraCenterSmoothFollowP8Camera2DP6PlayerP7EnvItemifiiE13fractionSpeed(%rip), %xmm0
	mulss	-20(%rbp), %xmm0
	movd	%xmm0, %eax
	movd	%eax, %xmm0
	call	fmaxf@PLT
	movd	%xmm0, %eax
	movl	%eax, -24(%rbp)
	movss	-24(%rbp), %xmm0
	mulss	-64(%rbp), %xmm0
	divss	-20(%rbp), %xmm0
	movq	-32(%rbp), %rax
	movaps	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	_Z12Vector2Scale7Vector2f
	movq	%xmm0, %rdx
	movq	-40(%rbp), %rbx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rdx, %xmm1
	movq	%rax, %xmm0
	call	_Z10Vector2Add7Vector2S_
	movq	%xmm0, %rax
	movq	%rax, 8(%rbx)
.L66:
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1102:
	.size	_Z30UpdateCameraCenterSmoothFollowP8Camera2DP6PlayerP7EnvItemifii, .-_Z30UpdateCameraCenterSmoothFollowP8Camera2DP6PlayerP7EnvItemifii
	.data
	.align 4
	.type	_ZZ28UpdateCameraEvenOutOnLandingP8Camera2DP6PlayerP7EnvItemifiiE12evenOutSpeed, @object
	.size	_ZZ28UpdateCameraEvenOutOnLandingP8Camera2DP6PlayerP7EnvItemifiiE12evenOutSpeed, 4
_ZZ28UpdateCameraEvenOutOnLandingP8Camera2DP6PlayerP7EnvItemifiiE12evenOutSpeed:
	.long	1143930880
	.local	_ZZ28UpdateCameraEvenOutOnLandingP8Camera2DP6PlayerP7EnvItemifiiE10eveningOut
	.comm	_ZZ28UpdateCameraEvenOutOnLandingP8Camera2DP6PlayerP7EnvItemifiiE10eveningOut,4,4
	.local	_ZZ28UpdateCameraEvenOutOnLandingP8Camera2DP6PlayerP7EnvItemifiiE13evenOutTarget
	.comm	_ZZ28UpdateCameraEvenOutOnLandingP8Camera2DP6PlayerP7EnvItemifiiE13evenOutTarget,4,4
	.text
	.globl	_Z28UpdateCameraEvenOutOnLandingP8Camera2DP6PlayerP7EnvItemifii
	.type	_Z28UpdateCameraEvenOutOnLandingP8Camera2DP6PlayerP7EnvItemifii, @function
_Z28UpdateCameraEvenOutOnLandingP8Camera2DP6PlayerP7EnvItemifii:
.LFB1103:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	%ecx, -28(%rbp)
	movss	%xmm0, -32(%rbp)
	movl	%r8d, -36(%rbp)
	movl	%r9d, -40(%rbp)
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-36(%rbp), %xmm0
	movss	.LC33(%rip), %xmm2
	movaps	%xmm0, %xmm1
	divss	%xmm2, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-40(%rbp), %xmm0
	movss	.LC33(%rip), %xmm2
	divss	%xmm2, %xmm0
	movq	-8(%rbp), %rax
	movss	%xmm1, (%rax)
	movq	-8(%rbp), %rax
	movss	%xmm0, 4(%rax)
	movq	-16(%rbp), %rax
	movss	(%rax), %xmm0
	movq	-8(%rbp), %rax
	movss	%xmm0, 8(%rax)
	movl	_ZZ28UpdateCameraEvenOutOnLandingP8Camera2DP6PlayerP7EnvItemifiiE10eveningOut(%rip), %eax
	testl	%eax, %eax
	je	.L68
	movq	-8(%rbp), %rax
	movss	12(%rax), %xmm1
	movss	_ZZ28UpdateCameraEvenOutOnLandingP8Camera2DP6PlayerP7EnvItemifiiE13evenOutTarget(%rip), %xmm0
	comiss	%xmm1, %xmm0
	jbe	.L81
	movq	-8(%rbp), %rax
	movss	12(%rax), %xmm1
	movss	_ZZ28UpdateCameraEvenOutOnLandingP8Camera2DP6PlayerP7EnvItemifiiE12evenOutSpeed(%rip), %xmm0
	mulss	-32(%rbp), %xmm0
	addss	%xmm1, %xmm0
	movq	-8(%rbp), %rax
	movss	%xmm0, 12(%rax)
	movq	-8(%rbp), %rax
	movss	12(%rax), %xmm0
	movss	_ZZ28UpdateCameraEvenOutOnLandingP8Camera2DP6PlayerP7EnvItemifiiE13evenOutTarget(%rip), %xmm1
	comiss	%xmm1, %xmm0
	ja	.L77
	jmp	.L82
.L77:
	movss	_ZZ28UpdateCameraEvenOutOnLandingP8Camera2DP6PlayerP7EnvItemifiiE13evenOutTarget(%rip), %xmm0
	movq	-8(%rbp), %rax
	movss	%xmm0, 12(%rax)
	movl	$0, _ZZ28UpdateCameraEvenOutOnLandingP8Camera2DP6PlayerP7EnvItemifiiE10eveningOut(%rip)
	jmp	.L82
.L81:
	movq	-8(%rbp), %rax
	movss	12(%rax), %xmm0
	movss	_ZZ28UpdateCameraEvenOutOnLandingP8Camera2DP6PlayerP7EnvItemifiiE12evenOutSpeed(%rip), %xmm1
	mulss	-32(%rbp), %xmm1
	subss	%xmm1, %xmm0
	movq	-8(%rbp), %rax
	movss	%xmm0, 12(%rax)
	movq	-8(%rbp), %rax
	movss	12(%rax), %xmm1
	movss	_ZZ28UpdateCameraEvenOutOnLandingP8Camera2DP6PlayerP7EnvItemifiiE13evenOutTarget(%rip), %xmm0
	comiss	%xmm1, %xmm0
	ja	.L78
	jmp	.L82
.L78:
	movss	_ZZ28UpdateCameraEvenOutOnLandingP8Camera2DP6PlayerP7EnvItemifiiE13evenOutTarget(%rip), %xmm0
	movq	-8(%rbp), %rax
	movss	%xmm0, 12(%rax)
	movl	$0, _ZZ28UpdateCameraEvenOutOnLandingP8Camera2DP6PlayerP7EnvItemifiiE10eveningOut(%rip)
	jmp	.L82
.L68:
	movq	-16(%rbp), %rax
	movzbl	12(%rax), %eax
	testb	%al, %al
	je	.L82
	movq	-16(%rbp), %rax
	movss	8(%rax), %xmm0
	pxor	%xmm1, %xmm1
	ucomiss	%xmm1, %xmm0
	jp	.L82
	pxor	%xmm1, %xmm1
	ucomiss	%xmm1, %xmm0
	je	.L79
	jmp	.L82
.L79:
	movq	-16(%rbp), %rax
	movss	4(%rax), %xmm0
	movq	-8(%rbp), %rax
	movss	12(%rax), %xmm1
	ucomiss	%xmm1, %xmm0
	jp	.L80
	ucomiss	%xmm1, %xmm0
	je	.L82
.L80:
	movl	$1, _ZZ28UpdateCameraEvenOutOnLandingP8Camera2DP6PlayerP7EnvItemifiiE10eveningOut(%rip)
	movq	-16(%rbp), %rax
	movss	4(%rax), %xmm0
	movss	%xmm0, _ZZ28UpdateCameraEvenOutOnLandingP8Camera2DP6PlayerP7EnvItemifiiE13evenOutTarget(%rip)
.L82:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1103:
	.size	_Z28UpdateCameraEvenOutOnLandingP8Camera2DP6PlayerP7EnvItemifii, .-_Z28UpdateCameraEvenOutOnLandingP8Camera2DP6PlayerP7EnvItemifii
	.data
	.align 8
	.type	_ZZ28UpdateCameraPlayerBoundsPushP8Camera2DP6PlayerP7EnvItemifiiE4bbox, @object
	.size	_ZZ28UpdateCameraPlayerBoundsPushP8Camera2DP6PlayerP7EnvItemifiiE4bbox, 8
_ZZ28UpdateCameraPlayerBoundsPushP8Camera2DP6PlayerP7EnvItemifiiE4bbox:
	.long	1045220557
	.long	1045220557
	.text
	.globl	_Z28UpdateCameraPlayerBoundsPushP8Camera2DP6PlayerP7EnvItemifii
	.type	_Z28UpdateCameraPlayerBoundsPushP8Camera2DP6PlayerP7EnvItemifii, @function
_Z28UpdateCameraPlayerBoundsPushP8Camera2DP6PlayerP7EnvItemifii:
.LFB1104:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movl	%ecx, -60(%rbp)
	movss	%xmm0, -64(%rbp)
	movl	%r8d, -68(%rbp)
	movl	%r9d, -72(%rbp)
	movss	_ZZ28UpdateCameraPlayerBoundsPushP8Camera2DP6PlayerP7EnvItemifiiE4bbox(%rip), %xmm2
	movss	.LC13(%rip), %xmm0
	movaps	%xmm0, %xmm1
	subss	%xmm2, %xmm1
	movss	.LC35(%rip), %xmm0
	mulss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-68(%rbp), %xmm0
	mulss	%xmm1, %xmm0
	movd	%xmm0, %edx
	movabsq	$-4294967296, %rax
	andq	%r10, %rax
	orq	%rdx, %rax
	movq	%rax, %r10
	movss	4+_ZZ28UpdateCameraPlayerBoundsPushP8Camera2DP6PlayerP7EnvItemifiiE4bbox(%rip), %xmm2
	movss	.LC13(%rip), %xmm0
	movaps	%xmm0, %xmm1
	subss	%xmm2, %xmm1
	movss	.LC35(%rip), %xmm0
	mulss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-72(%rbp), %xmm0
	mulss	%xmm1, %xmm0
	movd	%xmm0, %eax
	salq	$32, %rax
	movl	%r10d, %edx
	orq	%rdx, %rax
	movq	%rax, %r10
	subq	$8, %rsp
	movq	-40(%rbp), %rcx
	subq	$24, %rsp
	movq	%rsp, %rsi
	movq	(%rcx), %rax
	movq	8(%rcx), %rdx
	movq	%rax, (%rsi)
	movq	%rdx, 8(%rsi)
	movq	16(%rcx), %rax
	movq	%rax, 16(%rsi)
	movq	%r10, %xmm0
	call	GetScreenToWorld2D@PLT
	addq	$32, %rsp
	movq	%xmm0, %rax
	movq	%rax, -24(%rbp)
	movss	_ZZ28UpdateCameraPlayerBoundsPushP8Camera2DP6PlayerP7EnvItemifiiE4bbox(%rip), %xmm1
	movss	.LC13(%rip), %xmm0
	addss	%xmm0, %xmm1
	movss	.LC35(%rip), %xmm0
	mulss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-68(%rbp), %xmm0
	mulss	%xmm1, %xmm0
	movd	%xmm0, %edx
	movabsq	$-4294967296, %rax
	andq	%rbx, %rax
	orq	%rdx, %rax
	movq	%rax, %rbx
	movss	4+_ZZ28UpdateCameraPlayerBoundsPushP8Camera2DP6PlayerP7EnvItemifiiE4bbox(%rip), %xmm1
	movss	.LC13(%rip), %xmm0
	addss	%xmm0, %xmm1
	movss	.LC35(%rip), %xmm0
	mulss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-72(%rbp), %xmm0
	mulss	%xmm1, %xmm0
	movd	%xmm0, %eax
	salq	$32, %rax
	movl	%ebx, %edx
	orq	%rdx, %rax
	movq	%rax, %rbx
	subq	$8, %rsp
	movq	-40(%rbp), %rcx
	subq	$24, %rsp
	movq	%rsp, %rsi
	movq	(%rcx), %rax
	movq	8(%rcx), %rdx
	movq	%rax, (%rsi)
	movq	%rdx, 8(%rsi)
	movq	16(%rcx), %rax
	movq	%rax, 16(%rsi)
	movq	%rbx, %xmm0
	call	GetScreenToWorld2D@PLT
	addq	$32, %rsp
	movq	%xmm0, %rax
	movq	%rax, -32(%rbp)
	movss	_ZZ28UpdateCameraPlayerBoundsPushP8Camera2DP6PlayerP7EnvItemifiiE4bbox(%rip), %xmm2
	movss	.LC13(%rip), %xmm0
	movaps	%xmm0, %xmm1
	subss	%xmm2, %xmm1
	movss	.LC35(%rip), %xmm0
	mulss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-68(%rbp), %xmm0
	mulss	%xmm0, %xmm1
	movss	4+_ZZ28UpdateCameraPlayerBoundsPushP8Camera2DP6PlayerP7EnvItemifiiE4bbox(%rip), %xmm3
	movss	.LC13(%rip), %xmm0
	movaps	%xmm0, %xmm2
	subss	%xmm3, %xmm2
	movss	.LC35(%rip), %xmm0
	mulss	%xmm0, %xmm2
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-72(%rbp), %xmm0
	mulss	%xmm2, %xmm0
	movq	-40(%rbp), %rax
	movss	%xmm1, (%rax)
	movq	-40(%rbp), %rax
	movss	%xmm0, 4(%rax)
	movq	-48(%rbp), %rax
	movss	(%rax), %xmm1
	movss	-24(%rbp), %xmm0
	comiss	%xmm1, %xmm0
	jbe	.L84
	movq	-48(%rbp), %rax
	movss	(%rax), %xmm0
	movq	-40(%rbp), %rax
	movss	%xmm0, 8(%rax)
.L84:
	movq	-48(%rbp), %rax
	movss	4(%rax), %xmm1
	movss	-20(%rbp), %xmm0
	comiss	%xmm1, %xmm0
	jbe	.L86
	movq	-48(%rbp), %rax
	movss	4(%rax), %xmm0
	movq	-40(%rbp), %rax
	movss	%xmm0, 12(%rax)
.L86:
	movq	-48(%rbp), %rax
	movss	(%rax), %xmm0
	movss	-32(%rbp), %xmm1
	comiss	%xmm1, %xmm0
	jbe	.L88
	movss	-24(%rbp), %xmm1
	movq	-48(%rbp), %rax
	movss	(%rax), %xmm0
	movss	-32(%rbp), %xmm2
	subss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	movq	-40(%rbp), %rax
	movss	%xmm0, 8(%rax)
.L88:
	movq	-48(%rbp), %rax
	movss	4(%rax), %xmm0
	movss	-28(%rbp), %xmm1
	comiss	%xmm1, %xmm0
	ja	.L95
	jmp	.L96
.L95:
	movss	-20(%rbp), %xmm1
	movq	-48(%rbp), %rax
	movss	4(%rax), %xmm0
	movss	-28(%rbp), %xmm2
	subss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	movq	-40(%rbp), %rax
	movss	%xmm0, 12(%rax)
.L96:
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1104:
	.size	_Z28UpdateCameraPlayerBoundsPushP8Camera2DP6PlayerP7EnvItemifii, .-_Z28UpdateCameraPlayerBoundsPushP8Camera2DP6PlayerP7EnvItemifii
	.section	.rodata
	.align 4
.LC2:
	.long	1137180672
	.align 4
.LC3:
	.long	1133248512
	.align 4
.LC5:
	.long	1148846080
	.align 4
.LC6:
	.long	1128792064
	.align 4
.LC7:
	.long	1133903872
	.align 4
.LC8:
	.long	1092616192
	.align 4
.LC9:
	.long	1132068864
	.align 4
.LC10:
	.long	1120403456
	.align 4
.LC11:
	.long	1143111680
	.align 4
.LC12:
	.long	1130430464
	.align 4
.LC13:
	.long	1065353216
	.align 4
.LC19:
	.long	1028443341
	.align 4
.LC20:
	.long	1077936128
	.align 4
.LC21:
	.long	1048576000
	.align 4
.LC23:
	.long	1109393408
	.align 4
.LC24:
	.long	1101004800
	.align 4
.LC25:
	.long	1084227584
	.align 4
.LC32:
	.long	-1011941376
	.align 4
.LC33:
	.long	1073741824
	.align 4
.LC34:
	.long	-998637568
	.align 4
.LC35:
	.long	1056964608
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
