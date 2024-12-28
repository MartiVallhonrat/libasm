global ft_strcmp

section .text
ft_strcmp:
	cmp	rdi, 0
	je	error
	cmp	rsi, 0
	je	error
	mov	rcx, 0
loop:
	movzx	rax, byte [rdi + rcx]
	movzx	r8, byte [rsi + rcx]
	sub	rax, r8
	cmp	rax, 0
	jne	end
	cmp	r8, 0
	je	end
	inc	rcx
	jmp	loop
end:
	ret
error:
	mov	rax, -1
	ret
