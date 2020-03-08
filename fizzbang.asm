section .data
codes: db '0123456789ABCDEF'
fizzbuzzmessage: db 'fizzbang', 10
fizzmessage: db 'fizz', 10
buzzmessage: db 'bang', 10
fizzoutput: db 'fizzamount', 10
buzzoutput: db 'buzzamount', 10

newline: db 10

section .text
global _start

_start:

  mov rcx, 0 ; stores rcx to 0
  push rcx	; moves the value stored in rcx to the top of the stack
  mov r15,0 ; stores fizzamount counter
  mov r14,0 ; stores bangamount counter
  mov r13,20 ; stores the value of 20, the input number to run the fizzbang off
  mov r12, 0 ; stores a value of 0 in r12
start_loop:
  cmp r12, r13 ; compares the values stored in r12 and r13
  je end ; if r12 and r13 are equal jump to end
  inc r12 ; increment the value stored in r12

test15:
  xor rdx,rdx ; stets rdx equal to itself (in this case 0)
  mov rax,r12 ; moved the value stored in r12 to rax
  mov r10, 15 ; sets r10 to equal 15
  div r10 ; divides the value stored in r12 by the value stored in r10
  cmp rdx,0 ; compareds the value stored in rdx with 0
  jnz test5 ; if the vaue stored in rdx is not zero, jumps program to test5

  mov rax, 1  ;moves 1 to rsi to show where to write
  mov rdi, 1 ;
  mov rsi, fizzbuzzmessage
  mov rdx, 9
  inc r15 ; increments the value stores in r15
  inc r14 ; increments the value stored in r14
  syscall
  jmp start_loop ; jumps the program to start_loop method

test5:
  xor rdx,rdx ; sets rdx to the value contained inside it (default 0)
  mov rax,r12 ; moves the value stored in r12 register to rax register
  mov r10, 5 ; sets  r10 to the value of 5
  div r10 ; divides the value stored in r10 by the value in r12
  cmp rdx,0 ; compares the value in rdx if equal to 0
  jnz test3 ;jumps to test 3 if not 0

  mov rax, 1 ; system call number to be stored in rax
  mov rdi, 1 ; moves 1 to rdi to show where to write
  mov rsi, buzzmessage ; moves the buzzmessage db to rsi
  mov rdx, 5 ; moves the value of 5 to rds
  inc r14 ; incremenets the value in r14
  syscall
  jmp start_loop ; moves the program to start_loop

test3:
  xor rdx,rdx ; stets rdx equal to itself (zeroing)
  mov rax,r12 ; moves the value in r12 to rax
  mov r10, 3 ; moves the value of 3 to r10
  div r10 ; divides r10 by r12
  cmp rdx,0 ; compares the value of rdx with 0
  jnz number ; if its not zero, jumps to the number method


  mov rax, 1 ; moves 1 to rax
  mov rdi, 1 ; moves 1 to rdi
  mov rsi, fizzmessage ; moves the fizzmessage db to rsi
  mov rdx, 5 ; moves 4 to rdx
  inc r15 ; increments the value stored in r15
  syscall
  jmp start_loop ; jumps the program to start_loop

number:

    mov rax,r12 ; moves the value stored in r12 to rax
    mov rdi, 1 ; moves 1 to rdi
    mov rdx, 1 ; moves 1 to rdx
    mov rcx, 64 ; moves 64 to rcx

.loop:
    push rax ; moves rax to the stop of the stack
    sub rcx, 4 ;subtracts 4 from the value in rcx
    sar rax, cl ; shifts the value of rax by cl
    and rax, 0xf ; and rax by 15

    lea rsi, [codes + rax] ; finds where codes belongs in rsi, as it loads effective address
    mov rax, 1 ; moves value of 1 to rax
    push rcx ; moves rcz to the top of the stack 
    syscall

    pop rcx  ; places the top of the stack into rcx

    pop rax ; places the top of the stack in rax
    test rcx, rcx ; checks the values of both registers
    jnz .loop ; if not zero, jumps to .loop

	mov rax, 1 ; moves 1 to rax
	mov rdi, 1 ; moves 1 to rdi
	mov rsi, newline ; moves the newline db to rsi
	mov rdx, 1 ; moves 1 to rdx
	syscall
	jmp start_loop ; jumps to start_loop
end:

	mov rax, 60 ; moves 60 to rax
	xor rdi, rdi ; zero'es rdi
	syscall
