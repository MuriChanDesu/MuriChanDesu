# A test of arrays in machine code 

.data

arr: .word 0, 0, 0, 0, 0
MSG1: .asciiz "Enter 5 integer numbers: "
MSG2: .asciiz "Enter another number: "
MSG3: .asciiz "Floating Point List\n"
MSG4: .asciiz "The Sum of the numbers is: "
MSG5: .asciiz "The Smallest number is: "
MSG6: .asciiz "The Largest number is: "
MSG7: .asciiz "The Mean of the numbers is: "
MSG8: .asciiz "The variance of the numbers is: "
newline: .asciiz "\n"
#

  .text
  .globl main

#
main:
  addiu $sp,$sp,4

  li $v0,4
  la $a0,MSG1
  syscall
  li $v0,5
  syscall
  move $t0,$v0
  la $s7, array
  addi $s0, $zero, $t0
  sw $s0, 1($s7)

  #find a way to put these into an array

  li $v0,4
  la $a0,MSG2
  syscall
  li $v0,5
  syscall
  move $t0,$v0
  la $s7, array
  addi $s0, $zero, $t0
  sw $s0, 2($s7)
  syscall

  li $v0,4
  la $a0,MSG2
  syscall
  li $v0,5
  syscall
  move $t0,$v0
  la $s7, array
  addi $s0, $zero, $t0
  sw $s0, 4($s7)
  syscall

  li $v0,4
  la $a0,MSG2
  syscall
  li $v0,5
  syscall
  move $t0,$v0
  la $s7, array
  addi $s0, $zero, $t0
  sw $s0, 8($s7)
  syscall

  li $v0,4
  la $a0,MSG2
  syscall
  li $v0,5
  syscall
  move $t0,$v0
  la $s7, array
  addi $s0, $zero, $t0
  sw $s0, 16($s7)
  syscall




  jr $ra

#

floating:
  jr $ra

#

average:
  jr $ra

#

sum:
  jr $ra

#

largest:
  jr $ra

#

Smallest:
  jr $ra

#
