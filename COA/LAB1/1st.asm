section .data
 	msg db "The largest digit is: ";declaring all data
	 len equ $- msg 
 	num1 dd 100
 	num2 dd 183
 	num3 dd 213
    num4 dd 300
    num5 dd 515
segment .bss
 	largest1 resb 2;declaring in bss section as they get updated
 	largest resb 2
 	sum resb 40 
 	sum_len resd 1
section .text
 global _start ;must be declared for using gcc
_start: ;tell linker entry point
	mov ecx, [num1];here first we check the first 3 numbers and then next 2 numbers
 	cmp ecx, [num2]
 	jg check_third_num
	 mov ecx, [num2]
	cmp ecx,[num3]
	jg second
	mov ecx,[num3]
	jmp second
   check_third_num:
 	cmp ecx, [num3]
	jg second
	 mov ecx, [num3]
	 jmp second
second:         ; for num4,num5
    mov [largest1],ecx
    mov ecx,[num4]
    cmp ecx,[num5]
    jg final
    mov ecx,[num5]
    jmp final
final:;final updation
    cmp ecx,[largest1]
    jg _exit
    mov ecx,[largest1]
 _exit:
 	 mov [largest], ecx
 
  mov eax,[largest]
	mov edi, sum                ; Argument: Address of the target string
  call int2str                ; Get the digits of EAX and store it as ASCII
  sub edi, sum               
  mov [sum_len], edi

    mov ecx,msg         ;printing message
 	mov edx, len
 	mov ebx,1 ;file descriptor (stdout)
	mov eax,4 ;system call number (sys_write)
	int 0x80 ;call kernel
	 
    ; Output sum
    mov eax, 4
    mov ebx, 1
    mov ecx, sum        ;printing digit
    mov edx, [sum_len]
    int 0x80
; Exit code
    mov eax, 1
    mov ebx, 0
    int 0x80

int2str:    ; Converts an positive integer in EAX to a string pointed to by EDI
    xor ecx, ecx
    mov ebx, 10
    .LL1:                   ; First loop: Save the remainders
    xor edx, edx            ; Clear EDX for div
    div ebx                 ; EDX:EAX/EBX -> EAX Remainder EDX
    push dx                 ; Save remainder
    inc ecx                 ; Increment push counter
    test eax, eax           ; Anything left to divide?
    jnz .LL1                ; Yes: loop once more
.LL2:                   ; Second loop: Retrieve the remainders
    pop dx                  ; In DL is the value
    or dl, '0'              ; To ASCII
    mov [edi], dl           ; Save it to the string
    inc edi                 ; Increment the pointer to the string
    loop .LL2               ; Loop ECX times

    mov byte [edi], 0       ; Termination character
    ret     