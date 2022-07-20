%macro write 2
    mov ebx,1
    mov eax,4
    mov ecx,%1
    mov edx,%2
    int 0x80
%endmacro

section .text 
    global _start
    _start:
        mov ecx,len ;length of the string
        mov ebx,0   ;vowel
        mov edx,0   ;words
        mov esi,0   ;consonants
    space:
        inc edx
        dec ecx
        inc esi
    process:
        mov al,[msg+esi]
        
        cmp al,' '
        je space 
        cmp al,'a'
        je vowel
        cmp al,'e'
        je vowel
        cmp al,'i'
        je vowel
        cmp al,'o'
        je vowel
        cmp al,'u'
        je vowel
        
        jmp consonant
    vowel:
        inc ebx
    consonant:
        inc esi
        
        loop process
        mov [vowels],ebx
        
        mov ecx,len 
        sub ecx,edx ;subtracting spaces
        sub ecx,ebx ;subtracting vowels
        mov [consonants],ecx
        
        inc edx
        mov [words],edx
        
        mov ecx,len
        mov [chars],ecx
        
    write msg,len
    write msg1,len1
    mov eax,[vowels]
	mov edi, sum                ; Argument: Address of the target string
    call int2str                ; Get the digits of EAX and store it as ASCII
    sub edi, sum               
    mov [sum_len], edi
    write sum,sum_len
    
    write msg2,len2
    mov eax,[consonants]
	mov edi, sum                ; Argument: Address of the target string
    call int2str                ; Get the digits of EAX and store it as ASCII
    sub edi, sum               
    mov [sum_len], edi
    write sum,sum_len
    
    write msg3,len3 
    mov eax,[chars]
	mov edi, sum                ; Argument: Address of the target string
    call int2str                ; Get the digits of EAX and store it as ASCII
    sub edi, sum               
    mov [sum_len], edi
    write sum,sum_len
    
    write msg4,len4
    mov eax,[words]
	mov edi, sum                ; Argument: Address of the target string
    call int2str                ; Get the digits of EAX and store it as ASCII
    sub edi, sum               
    mov [sum_len], edi
    write sum,sum_len
    
    mov eax,1
    mov ebx,0
    int 0x80
    
section .data
    msg db "Hello IIITDM KANCHEEPURAM",0xa
    len equ $-msg
    
    vowels dq 0
    consonants dq 0
    chars dq 0
    words dq 0
    msg1 db "vowels:",0xd
    len1 equ $-msg1 
    msg2 db "consonants:",0xd
    len2 equ $-msg2 
    msg3 db "chars:",0xd
    len3 equ $-msg3
    msg4 db "words:",0xd
    len4 equ $-msg4
section .bss
    sum resb 40 
    sum_len resd 1

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