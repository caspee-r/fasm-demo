format ELF64 executable

;;;;;;;;;;;;;;;;;;;;;;;;;;;; INCLUDE'S
include 'atoi.asm'

;;;;;;;;;;;;;;;;;;;;;;;;;;;; CONSTANTS
SYS_WRITE = 1
SYS_READ = 0
SYS_EXIT = 60
STDOUT = 1
STDIN = 2
ASCII_ZERO = 0x30

;;;;;;;;;;;;;;;;;;;;;;;;;;;; SYSCALL MACROS
macro read fd, buf,len {
	mov rax, SYS_READ
	mov rdi, fd
    mov rsi, buf        ; pointer to the message
    mov rdx, len    ; message length
    syscall             ; invoke the system call
}

macro write fd, buf,len {
	mov rax, SYS_WRITE
	mov rdi, fd
    mov rsi, buf        ; pointer to the message
    mov rdx, len    ; message length
    syscall             ; invoke the system call
}



macro exit code {
	mov rax, SYS_EXIT
	mov rdi, code
	syscall
}

segment readable executable
entry start
start:
game_loop:
write STDOUT,qs,qs_len
read STDIN,answer,anl
atoi answer 
mov rcx,0xa ;; my favorite number
cmp rcx,rdi
je done
jmp game_loop

done:
write STDOUT,dn,dn_len
exit 0

segment readable writeable
qs: db "What's my favorite number?",0xa,0
qs_len = $ - qs
answer: db 10 dup(0)
anl =  $ - answer
dn: db "u gussed it, bye",0xa
dn_len = $ - dn

