.data

vector: .space 400
MSG1: .asciiz "Enter the number of elements in each vector: "
EnterFirst1: .asciiz "Enter "
EnterFirst2: .asciiz " floating-point values one per line.\n"
EnterSecond1: .asciiz "Enter another "
EnterSecond2: .asciiz " floating-point values.\n"
Fail: .asciiz "\nPlease enter a number between 1 and 100 next time\n\n...Exiting...\n"
newline: .asciiz "\n"

Final: .asciiz "The vector sum is:\n"

.text
.globl main

main:

  li $v0,4
  la $a0,MSG1
  syscall

  li $v0,5
  syscall
  move $v1,$v0

  slti $t2,$v1,100
  beq $t2,1,Check2
  j Loss

Check2:
  slti $t2,$v1,0
  beq $t2,1,Loss

  li $v0,4
  la $a0,EnterFirst1
  syscall
  li $v0,1
  move $a0,$v1
  syscall
  li $v0,4
  la $a0,EnterFirst2
  syscall

  move $t1,$zero
  la $t2,vector

  jr Loop1
Loop1:
  li $v0,6
                  #put a loop here that places values into an array
  syscall

  s.s $f0,($t2)

  addiu $t2,$t2,4
                  #it would be the array value here
  addiu $t1,$t1,1

  beq $t1,$v1,Endloop1
  jr Loop1

Endloop1:


  subu $t1,$t1,$v1
  move $t2,$zero

  li $v0,4
  la $a0,EnterSecond1
  syscall
  li $v0,1
  move $a0,$v1
  syscall
  li $v0,4
  la $a0,EnterSecond2
  syscall

  la $t2,vector

  jr Loop2

Loop2:
  li $v0,6
  syscall

  l.s $f1,($t2)
  add.s $f0,$f1,$f0
  s.s $f0,($t2)

  addiu $t2,$t2,4
  addiu $t1,$t1,1

  beq $t1,$v1,Endloop2
  jr Loop2

Endloop2:

  subu $t1,$t1,$v1
  move $t2,$zero

  li $v0,4
  la $a0,Final
  syscall

  #error is somewhere past here

  la $t2,vector

  jr Sumloop

Sumloop:
  l.s $f1,($t2)
  li $v0,2
  mov.s $f12,$f1
  syscall
  li $v0,4
  la $a0,newline
  syscall

  addiu $t2,$t2,4
  addiu $t1,$t1,1

  beq $t1,$v1,Exit
  jr Sumloop


  #place a loop that displays values
Exit:
  jr $ra


Loss:
  li $v0,4
  la $a0,Fail
  syscall
  li $v0,10
  syscall
