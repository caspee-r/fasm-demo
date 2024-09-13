
;;;;;;;;;;;;;;;;;;;;;
; fasm header file 
; defines the atoi macro


;;;;;;;;;;;;;;;;;;; CONSTANTS
ASCII_ZERO = 0x30
ASCII_NULL = 0x0


;;;;;;;;;;;;;;;;;; MACROS

macro atoi buf {
	xor rdi,rdi
	mov rsi,buf
	p_loop:
	mov byte bl,[rsi]
	cmp byte bl,0xa
	je end_macro
	cmp bl,0x0
	je end_macro
	mov al,bl
	sub byte al,ASCII_ZERO
	imul rdi,rdi,0xa
	add rdi,rax
	inc rsi
	jmp p_loop
	end_macro:
}
