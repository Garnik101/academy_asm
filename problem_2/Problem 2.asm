extern printf, scanf
section .bss
	n resd 1
section .data
	fmtp db "Enter a positive number: ", 0
	fmtp1 db "%d", 0
	fmtr db "The result is %d", 10, 0
section .text
global main
main:
	push rbp
	mov rbp, rsp

	mov rdi, fmtp
	call printf
	
	mov rdi, fmtp1
	lea rsi, [n]
	xor rax, rax
	call scanf

	mov rbx, 0
	mov rcx, [n]
loop1:	
	add rbx, rcx
	loop loop1
	
	mov rdi, fmtr 
	mov rsi, rbx
	call printf
	
        mov rsp, rbp
	pop rbp
	ret     
