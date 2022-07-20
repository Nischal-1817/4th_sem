section .data ;storing data
  msg db 'The factorial of 6 is:'
  len equ $-msg 
  array db 6,1,2,3,4,5
  sres db 0
segment .bss 
  sum resb 40 
  sum_len resd 1
section .text 
  global _start 
_start:
  mov edx,6;taking size of the array
  mov eax,1 ;taking ebx as 0 as it calculates sum
  mov ecx,array ;base address of x to ecx
top:  ;loop
  mov bl,[ecx]
  mul bl
  inc ecx 
  dec edx 
  jnz top 
mov edi, sum            
    call int2str               
    sub edi, sum               
    mov [sum_len], edi
 
    mov ecx, msg
    mov edx, len
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Output result
    mov eax, 4
    mov ebx, 1
    mov ecx, sum
    mov edx, [sum_len]
    int 0x80
; Exit code
    mov eax, 1
    mov ebx, 0
    int 0x80

int2str:    ;function to push individual numbers into stack
    xor ecx, ecx
    mov ebx, 10
    .LL1:                   
    xor edx, edx            
    div ebx                 
    push dx                 
    inc ecx                 
    test eax, eax           
    jnz .LL1                
.LL2:       ;function to pop those pushed numbers from stack            
    pop dx                  
    or dl, '0'            
    mov [edi], dl           
    inc edi                 
    loop .LL2               

    mov byte [edi], 0       
    ret          