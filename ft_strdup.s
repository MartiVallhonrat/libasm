global ft_strdup

extern ft_strlen
extern ft_strcpy

extern malloc
extern __errno_location

section .text
ft_strdup:
	cmp	rdi, 0
	je	error

	push	rdi	
	and	rsp, 0xFFFFFFFFFFFFFFF0
	call	ft_strlen
	mov	rdi, rax
	inc	rdi
	
	call	malloc wrt ..plt
	cmp	rax, 0
	je	error
	mov	rdi, rax
			
	pop	rsi	
	call	ft_strcpy		
	ret

error:
	call	__errno_location wrt ..plt
	mov	r8, 22
	mov	[rax], r8 ; (EINVAL) errno for invalid parameter
	mov	rax, 0
	ret

malloc_error:
	call	__errno_location wrt ..plt
	mov	r8, 12	
	mov	[rax], r8 ; (ENOMEM) errno for invalid memory alocation
	mov	rax, 0
	ret
