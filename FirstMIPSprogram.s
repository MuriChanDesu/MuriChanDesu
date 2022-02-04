##########################################################
#                                                        #
#     Name: Asis Donathan-Miller                         #
#     Class: CDA 3100                                    #
#    Assignment:  #4 Read in two numbers  and find       #
#      The sum, difference, product,  quotient/remainder,#
#      Shift left and Shit right.                        #
#                                                        #
##########################################################
.data
Intro: .asciiz "Asis Donathan-Miller, Student CDA3100\n\nAdd, Subtract, Multiply and Divide two numbers\n\nEnter the first number: "
SecNum: .asciiz "Enter the second number: "
plus: .asciiz " + "
minus: .asciiz " - "
multi: .asciiz " * "
divi: .asciiz " / "
REM: .asciiz " REM "
equal: .asciiz "="
newline: .asciiz "\n"
ShiftL: .asciiz "Shift Left 1 << "
ShiftR: .asciiz "Shift Right 2 >> "
Sayonara: .asciiz "The program has stopped.. may the force be with you."
Emergency: .asciiz "*** Warning Will Robinson…The number is below 1. ***"
error: .asciiz "error"
  .text
  .globl main

main:
  li $t0,0
  li $v0,4 #calls for a string
  la $a0,Intro      #gets address for the introduction message
  syscall
  li $v0,5          #takes the first value
  syscall
  move $t1,$v0      #places the first value in t1
  li $v0,4
  la $a0,SecNum     #prompts the user to enter the second number
  syscall
  li $v0,5          #takes the second value
  syscall
  move $t2,$v0      #places the second value in t2

  ble $t0,$t1,ELSE
  li $v0,4
  la $a0,Emergency
  syscall
  jr $ra

  ELSE:
  ble $t0,$t1,ELSE2
  li $v0,4
  la $a0,Emergency
  syscall
  jr $ra

  ELSE2:

  add $t3,$t1,$t2   #t3=t1-t2
  li $v0,1          #telling the system to prepare for a integer call
  move $a0,$t1
  syscall
  li $v0,4
  la $a0,plus
  syscall
  li $v0,1
  move $a0,$t2
  syscall
  li $v0,4
  la $a0,equal
  syscall
  li $v0,1
  move $a0,$t3      #tell me the adress to integer 1
  syscall #make the call

  li $v0,4
  la $a0,newline
  syscall

  sub $t3,$t1,$t2   #t3=t1-t2
  li $v0,1          #telling the system to prepare for a integer call
  move $a0,$t1
  syscall
  li $v0,4
  la $a0,minus
  syscall
  li $v0,1
  move $a0,$t2
  syscall
  li $v0,4
  la $a0,equal
  syscall
  li $v0,1
  move $a0,$t3      #tell me the adress to integer 1
  syscall #make the call

  li $v0,4
  la $a0,newline
  syscall

  mult $t1,$t2   #t1*t2
  li $v0,1          #telling the system to prepare for a integer call
  move $a0,$t1
  syscall
  li $v0,4
  la $a0,multi
  syscall
  li $v0,1
  move $a0,$t2
  syscall
  li $v0,4
  la $a0,equal
  syscall
  li $v0,1
  mflo $a0
  syscall #make the call

  li $v0,4
  la $a0,newline
  syscall

  div $t1,$t2   #t1/t2
  li $v0,1          #telling the system to prepare for a integer call
  move $a0,$t1
  syscall
  li $v0,4
  la $a0,divi
  syscall
  li $v0,1
  move $a0,$t2
  syscall
  li $v0,4
  la $a0,equal
  syscall
  li $v0,1
  mflo $a0      #divide
  syscall #make the call
  li $v0,4
  la $a0,REM
  syscall
  li $v0,1
  mfhi $a0
  syscall

  li $v0,4
  la $a0,newline
  syscall

  la $a0,ShiftL
  syscall
  li $v0,1
  sll $t0,$t1,1
  move $a0,$t0
  syscall

  li $v0,4
  la $a0,newline
  syscall

  la $a0,ShiftR
  syscall
  li $v0,1
  srl $t0,$t2,2
  move $a0,$t0
  syscall

  li $v0,4
  la $a0,newline
  syscall

  la $a0,Sayonara
  syscall
  jr $ra
