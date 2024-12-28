global ft_read
extern __errno_location

section .text
ft_read:
	mov	rax, 0
	syscall

	cmp	rax, 0
	jl	error
	ret

error:
	mov	r8, rax
	neg	r8
	call	__errno_location wrt ..plt
	mov	[rax], r8
	
	mov	rax, -1
	ret
