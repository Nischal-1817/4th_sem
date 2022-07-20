section .text 
  global _start 
_start:
  mov ebx,0 
  mov [sum],ebx
  mov eax,[num]
  mov bl,10
      find:
        mov eax,[num]
        div bl
        mov [r],ah
        mov [num],al 
        cmp al,0
        jne find
        je final
    final:
        mov eax,[sum]
        mov ebx,[num2]
        comp eax,ebx
        je new
        jne l1
    new:
        mov ecx,msg
        mov edx,len 
        mov ebx,1
        mov eax,4
        int 0x80
        jmp _exit
    l1:
        mov ecx,msg2
        mov edx,len2
        mov ebx,1
        mov eax,4
        int 0x80
    _exit:
        mov eax,1
        mov ebx,0
        int 0x80
  
section .data ;storing data
    msg db "It is a Palindrome number"
    len equ $-msg
    msg2 db "It is not a Palindrome number"
    len2 equ $-msg2
    num dd 1321
    num2 dd 1321
    sum db 0
    r db 0