  section .text
  global  _main
  align   4

_main:
  push  rbp
  mov   rbp, rsp
  mov   eax, edi
  pop   rbp
  ret