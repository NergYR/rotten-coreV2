[bits 64]

section .text
global _start
extern kernel_main  ; Déclaration de la fonction kernel_main

_start:
    ; Sauter directement à kernel_main
    jmp kernel_main

; Pas besoin de la section .data en mode long
