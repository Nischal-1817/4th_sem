section .text
	global_start   ;for dictionaries
_start:
	mov edx,len1   ;for first message
	mov ecx,msg1
	mov ebx,1
	mov eax,4
	int 0x80

	mov edx,len2   ;for 2nd message
	mov ecx,msg2
	mov ebx,1
	mov eax,4
	int 0x80

  mov edx,len3   ;for 3rd message
	mov ecx,msg3
	mov ebx,1
	mov eax,4
	int 0x80

	mov edx,len4   ;for 4th message
	mov ecx,msg4
	mov ebx,1
	mov eax,4
	int 0x80
	mov eax,1      ;exiting
	mov ebx,0
	int 0x80
section .data
	msg1 db "The Netwide Assembler is",0x20
	len1 equ $-msg1
	msg2 db "designed for portability and modularity",0x2e,0xa
	len2 equ $-msg2
	msg3 db "An assembler tran"
	len3 equ $-msg3
	msg4 db "slates assembly code into machine code",0x2e
	len4 equ $-msg4

