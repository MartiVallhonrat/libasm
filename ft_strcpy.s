global ft_strcpy

extern __errno_location

section .text
ft_strcpy:
	cmp	rdi, 0
	je	error
	cmp	rsi, 0
	je	error

	mov	rcx, 0

loop:
	mov	r8, [rsi + rcx]
	cmp	r8, 0
	je	end

	mov	[rdi + rcx], r8
	inc	rcx
	jmp	loop

end:
	mov	byte [rdi + rcx], 0
	lea	rax, [rdi]
	ret

error:
	call	__errno_location wrt ..plt
	mov	r8, 22
	mov	[rax], r8
	mov	rax, 0
	ret
