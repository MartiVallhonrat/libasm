global ft_strlen

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
	mov	rax, -1
	ret
