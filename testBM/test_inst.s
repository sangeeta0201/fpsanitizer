	.text
	.file	"test.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function foo
.LCPI0_0:
	.quad	4591870180066957722     # double 0.10000000000000001
	.text
	.globl	foo
	.p2align	4, 0x90
	.type	foo,@function
foo:                                    # @foo
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movl	%edi, %ebx
	movsd	%xmm1, 24(%rsp)         # 8-byte Spill
	movsd	%xmm0, 8(%rsp)          # 8-byte Spill
	movl	$7, %edi
	callq	__func_init
	movsd	.LCPI0_0(%rip), %xmm1   # xmm1 = mem[0],zero
	movsd	24(%rsp), %xmm0         # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movapd	%xmm0, %xmm2
	mulsd	%xmm1, %xmm2
	movsd	%xmm2, 16(%rsp)         # 8-byte Spill
	movl	$16, %edi
	movl	$2, %esi
	movl	$0, %edx
	movl	$4, %ecx
	callq	__compute_real_d
	movsd	16(%rsp), %xmm0         # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movapd	%xmm0, %xmm2
	movsd	8(%rsp), %xmm1          # 8-byte Reload
                                        # xmm1 = mem[0],zero
	addsd	%xmm1, %xmm2
	movl	$12, %edi
	movl	$4, %esi
	movl	$1, %edx
	movl	$5, %ecx
	movsd	%xmm2, 8(%rsp)          # 8-byte Spill
	callq	__compute_real_d
	xorl	%eax, %eax
	testl	%ebx, %ebx
	setg	%cl
	jg	.LBB0_2
# %bb.1:                                # %entry
	xorpd	%xmm0, %xmm0
	movsd	%xmm0, 8(%rsp)          # 8-byte Spill
.LBB0_2:                                # %entry
	movb	%cl, %al
	leaq	(%rax,%rax,4), %rdi
	callq	__func_exit
	movsd	8(%rsp), %xmm0          # 8-byte Reload
                                        # xmm0 = mem[0],zero
	addq	$32, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	foo, .Lfunc_end0-foo
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function main
.LCPI1_0:
	.quad	4566758108544739836     # double 0.002
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$32, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %rbx
	movl	%edi, %ebp
	movl	$10, %edi
	callq	__init
	testl	%ebp, %ebp
	jle	.LBB1_1
# %bb.2:                                # %if.end
	movq	8(%rbx), %rdi
	callq	atoi
	movl	%eax, %ebx
	movq	%rsp, %rbp
	movq	%rbp, %rdi
	callq	__get_addr
	xorps	%xmm0, %xmm0
	movq	%rax, %rdi
	callq	__set_real_cons_d
	movq	$0, (%rsp)
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movl	%ebx, %esi
	callq	printf
	movsd	(%rsp), %xmm0           # xmm0 = mem[0],zero
	movl	$3, %esi
	xorl	%edx, %edx
	movq	%rbp, %rdi
	movsd	%xmm0, 16(%rsp)         # 8-byte Spill
	callq	__load_d
	testl	%ebx, %ebx
	jle	.LBB1_5
# %bb.3:
	movq	%rsp, %r14
	movl	%ebx, %ebp
	.p2align	4, 0x90
.LBB1_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movsd	(%rsp), %xmm0           # xmm0 = mem[0],zero
	movsd	%xmm0, 8(%rsp)          # 8-byte Spill
	movl	$6, %esi
	xorl	%edx, %edx
	movq	%r14, %rdi
	callq	__load_d
	movl	$3, %edi
	xorl	%esi, %esi
	movl	%ebx, %edx
	callq	__add_fun_arg
	movl	$2, %edi
	movl	$6, %esi
	movsd	8(%rsp), %xmm0          # 8-byte Reload
                                        # xmm0 = mem[0],zero
	callq	__add_fun_arg
	movl	$1, %edi
	xorl	%esi, %esi
	movsd	.LCPI1_0(%rip), %xmm0   # xmm0 = mem[0],zero
	callq	__add_fun_arg
	movsd	.LCPI1_0(%rip), %xmm0   # xmm0 = mem[0],zero
	movsd	8(%rsp), %xmm1          # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movl	%ebx, %edi
	callq	foo
	movsd	%xmm0, 24(%rsp)         # 8-byte Spill
	movl	$7, %edi
	callq	__copy_return
	movsd	16(%rsp), %xmm0         # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movapd	%xmm0, %xmm2
	movsd	24(%rsp), %xmm1         # 8-byte Reload
                                        # xmm1 = mem[0],zero
	addsd	%xmm1, %xmm2
	movsd	%xmm2, 8(%rsp)          # 8-byte Spill
	movl	$12, %edi
	movl	$5, %esi
	movl	$7, %edx
	movl	$8, %ecx
	callq	__compute_real_d
	movq	%r14, %rdi
	callq	__get_addr
	movl	$8, %esi
	movq	%rax, %rdi
	movsd	8(%rsp), %xmm0          # 8-byte Reload
                                        # xmm0 = mem[0],zero
	callq	__set_real
	movsd	8(%rsp), %xmm0          # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movsd	%xmm0, (%rsp)
	movsd	(%rsp), %xmm0           # xmm0 = mem[0],zero
	movl	$9, %esi
	xorl	%edx, %edx
	movq	%r14, %rdi
	movsd	%xmm0, 16(%rsp)         # 8-byte Spill
	callq	__load_d
	addl	$-1, %ebp
	jne	.LBB1_4
.LBB1_5:                                # %for.cond.cleanup
	movl	$.L.str.2, %edi
	movb	$1, %al
	movsd	16(%rsp), %xmm0         # 8-byte Reload
                                        # xmm0 = mem[0],zero
	callq	printf
	jmp	.LBB1_6
.LBB1_1:                                # %if.then
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
.LBB1_6:                                # %cleanup
	callq	__finish
	xorl	%eax, %eax
	addq	$32, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"insufficient arguments"
	.size	.L.str, 23

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"count:%d"
	.size	.L.str.1, 9

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"The value of double is %f\n"
	.size	.L.str.2, 27


	.ident	"clang version 7.0.0 (trunk 336308)"
	.section	".note.GNU-stack","",@progbits
