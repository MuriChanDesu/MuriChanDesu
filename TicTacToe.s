# An abandoned tictactoe program created in machine code

.data

array: .byte '1', '2', '3', '4', '5', '6', '7', '8', '9'
MSG1: .asciiz "Welcome to Tic-Tac-Toe\n\nPositions"
PLY1MSG: .asciiz "Player 1 enter a position: "
PLY2MSG: .asciiz "Player 2 enter a position: "
WINMSG: .asciiz "Winning Player: "
LOSEMSG: .asciiz "Nobody Won..."
bottomTEXT: .asciiz "------"
seperation: .asciiz "|"
NEWLINE: .asciiz "\n"
DubNewline: .asciiz "\n\n"
XSpace: .byte 'X'
OSpace: .byte 'O'
errormsg: .asciiz "\nENTER A NUMBER 1-9\n\n"



.text
.globl main

main:
  li $v0,4
  la $a0,MSG1
  syscall
  addiu $sp,$sp,-4

  la $a0,DubNewline
  syscall

  li $t0,0
  la $t2,array
  jal display

  li $t0,0
  li $t1,0
  la $t2,array
  jal TicTacToe
EndOfGame: #apart of main I just use JAL too much
#if truth value is true then make an if statment that says LOSE
li $v0,10
syscall



display:
  li $t1,0
  bge $t0,9,endloop

displayLoop:
    bge $t1,3,displayend

    lb $a0,0($t2)
    addi $t2,$t2,1

    li $v0,11
    syscall
    li $v0,4
    la $a0,seperation
    syscall

    addi $t1,$t1,1
    addi $t0,$t0,1

    j displayLoop

displayend:
  bge $t0,7,display
  li $v0,4
  la $a0,NEWLINE
  syscall
  la $a0,bottomTEXT
  syscall
  li $v0,4
  la $a0,NEWLINE
  syscall
  j display

TicTacToe:
#need to make sure the person enters 1-9

  bge $t9,9,EndOfGame
  jal RedoValues
  jal PlayX

  jal RedoValues
  jal display

  jal RedoValues
  jal PlayO

  jal RedoValues
  jal display

  addi $t9,$t9,1
  bge $0,3,WinCheck

  j TicTacToe


endloop:
  li $v0,4
  la $a0,DubNewline
  syscall
  jr $ra

PlayX:
  li $t4,1
  la $t2,array
  lb $t5,XSpace

  li $v0,4
  la $a0,PLY1MSG
  syscall

  li $v0,5
  syscall
  move $t6,$v0

bgt $t6,$t4,CheckX
CheckX:
li $t4,9
ble $t6,$t4,ContinueX
 li $v0,4
 la $a0,errormsg
 syscall
 j PlayX

ContinueX:
  sub $t6,$t6,1
  add $t2,$t2,$t6

  sb $t5,0($t2)
  jr $ra

PlayO:
  li $t4,1
  la $t2,array
  lb $t5,OSpace

  li $v0,4
  la $a0,PLY2MSG
  syscall

  li $v0,5
  syscall
  move $t6,$v0

  bgt $t6,$t4,CheckO
  CheckO:
  li $t4,9
  ble $t6,$t4,ContinueO
   li $v0,4
   la $a0,errormsg
   syscall
   j PlayO

ContinueO:
  sub $t6,$t6,1
  add $t2,$t2,$t6

  sb $t5,0($t2)
  jr $ra

RedoValues:
  la $t2,array
  li $t0,0
  li $t1,0
  li $t7,0
  jr $ra

WinCheck:
  lb $t7,0($t2)
  addi $t2,$t2,1
  lb $t8,0($t2)

beq $t7, $t8, ELSE
  lb $t7,0($t2)
  addi $t2,$t2,1
  lb $t8,0($t2)

bne $t7, $t8, WIN
  lb $t7,0($t2)
  addi $t2,$t2,1
  lb $t8,0($t2)

beq $t7, $t8, ELSE
  lb $t7,0($t2)
  addi $t2,$t2,1
  lb $t8,0($t2)

bne $t7, $t8, WIN
  lb $t7,0($t2)
  addi $t2,$t2,1
  lb $t8,0($t2)

beq $t7, $t8, ELSE
  lb $t7,0($t2)
  addi $t2,$t2,1
  lb $t8,0($t2)

bne $t7, $t8, WIN
  j TicTacToe

WIN:
  li $v0,4
  la $a0,errormsg
  syscall

ELSE:
  j TicTacToe
