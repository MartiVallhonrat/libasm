global ft_strlen

extern __errno_location

section .text
ft_strlen:
	cmp	rdi, 0
	je	error		

	mov	rcx, 0
	
loop:
	cmp	byte [rdi + rcx], 0
	je	end
	
	inc	rcx
	jmp	loop

end:	
	mov	rax, rcx
	ret

error:
	call	__errno_location wrt ..plt
	mov	r8, 22
	mov	[rax], r8
	mov	rax, -1
	ret
