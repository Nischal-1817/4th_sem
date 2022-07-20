segment .bss ;declaring data
    sum resb 40
    sum_len resd 1
    num resb 1
section .data
    msg db " ",0xa
    len equ $-msg
    msg2 db "The numbers are:"
    len2 equ $-msg2
section .text
 global _start ;must be declared for using gcc
_start: ;tell linker entry point
    mov ecx, msg2        ;printing in a new line
    mov edx, len2
    mov ebx, 1
    mov eax, 4
    int 0x80
    
	mov ecx,40
	mov eax, 1
l1:
    push ecx  
    mov [num],eax
    mov edi, sum                ; Argument: Address of the target string
    call int2str                ; Get the digits of EAX and store it as ASCII
    sub edi, sum                ; EDI (pointer to the terminating NULL) - pointer to sum = length of the string
    mov [sum_len], edi

    mov eax, 4
    mov ebx, 1
    mov ecx, sum        ;printing the number as a string
    mov edx, [sum_len]
    int 0x80
    
    mov ecx, msg        ;printing in a new line
    mov edx, len
    mov ebx, 1
    mov eax, 4
    int 0x80

mov eax, [num]    ;bring the content back to eax
inc eax           ; increment eax
pop ecx		  ; loop counter is restored in to ecx		
loop l1
    
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