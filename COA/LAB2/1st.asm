section .text
    global _start
    _start:
    mov eax,[num]
    cmp eax,2
    je new
    mov bl,2
    div bl
    mov cl,al
    find:
        mov eax,[num]
        div bl
        inc bl
        cmp ah,0
        je l1
        cmp bl,cl
        jge new
        jne find
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
section .data
msg db "It is a prime number"
len equ $-msg
msg2 db "It is not a prime number"
len2 equ $-msg2
num dd 13