section .text 
  global _start 
_start:
  mov eax,6;taking size of the array
  mov ebx,0 ;taking ebx as 0 as it calculates sum
  mov ecx,array ;base address of x to ecx
top:  ;loop
  add ebx,[ecx] 
  inc ecx 
  dec eax 
  jnz top 
add ebx,'0';adding '0' for printing
mov [sum],ebx ;moving result

mov ecx,msg ;printing message
mov edx,len 
mov eax,4
mov ebx,1
int 0x80 

mov ecx,sum ;printing result
mov edx,1
mov ebx,1
mov eax,4
int 0x80

mov eax,1;exiting kernel
mov ebx,0 
int 0x80
  
section .data ;storing data
  msg db 'The sum of the 6-sized array is:'
  len equ $-msg 
  array db 1,2,3,4,5,-6
  sum db 0