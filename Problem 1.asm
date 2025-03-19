extern printf, scanf
section .bss
	a resd 1
	b resd 1
	o resd 1
section .data
	fmta db "Enter the first number: ", 0
	fmtb db "Enter the second number: ", 0
	fmts db "%d", 0
	fmtsel db "Please select an operation:", 10, "1 - Addition", 10, "2 - Subtraction", 10, "3 - Multiplication", 10, "4 - Division", 10, "Operation No: ", 0
	fmtw db 10, "Please enter a number from 1 to 4.", 10, 10, 0
	fmtpsum db "The result is %d", 10, 0
	fmtpsub db "The result is %d", 10, 0
	fmtpadd db "The result is %lld", 10, 0
	fmtpdiv db "The div result:", 10,"Quotent: %d", 10, "Reminer: %d", 10, 0
section .text
global main
main:
	xor eax, eax
	push rbp
	mov rbp, rsp

	mov rdi, fmta
	call printf

	mov rdi, fmts	
	lea rsi, [a]
	xor rax, rax
	call scanf

	mov rdi, fmtb
	call printf
         
	mov rdi, fmts
	lea rsi, [b]
	xor rax, rax
	call scanf
prompt:	
	mov rdi, fmtsel
	call printf

	mov rdi, fmts
	lea rsi, [o]
	xor rax, rax
	call scanf

	mov eax, [a]
	mov ebx, [b]
	
	mov edx, [o]
	cmp edx, 1
	je sum
	jl war 
	cmp edx, 2
        je sub
	cmp edx, 3
	je add
	cmp edx, 4
	je div
	jg war
war:	
	mov rdi, fmtw
	call printf
	jmp prompt
sum:	
	add eax, ebx 
	mov rdi, fmtpsum
	mov esi, eax
	call printf
	jmp end
sub:
	sub eax, ebx  
	mov rdi, fmtpsub
	mov esi, eax
	call printf
	jmp end
add:
	mul ebx
	mov rdi, fmtpadd
	mov esi, eax ;???
	call printf
	jmp end 
div:
	xor edx, edx
	div ebx
	mov rdi, fmtpdiv
	mov esi, eax
	mov edx, edx
	call printf
	jmp end
end:
	mov rsp, rbp
	pop rbp
	ret
