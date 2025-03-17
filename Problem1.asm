extern printf, scanf
section .data
	a dd 0
	b dd 0
section .rodata
	fmtp dq "Please choose the operation: %d", 0
	fmta dq"Please enter the first number: %d", 0  
	fmtb dq"Please enter the second number: %d", 0
	fmtr dq "The operation result is %d" ; ???
section .text
	global main
	main:

	push rbp
	mov rbp, rsp
	
	mov edi, fmta
	mov esi, a
	xor eax, eax
	call scanf 

	mov edi, fmtb
	mov esi, b
	xor eax, eax  
	call scanf

	mov eax, [a]
	mov ebx, [b]
	add eax, ebx

	mov rdi, fmtr
	mov rsi, eax
	xor rax, rax
	call printf

	mov rsp, rbp
	pop rbp
	ret
	
	
	
	

	 

