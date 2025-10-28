%include "../LIB/pc_iox.inc"

section .text
    global _start

_start: 

    ; A) Leer caracter del 0 al 9 y revisar si es menor que 5
    mov edx, msg
    call getche
    cmp al, '5'
    jae .mayor
    jmp .b
.mayor:
    call puts
.b:
    ; B)


    ; C) Triangulo en pantalla
    mov al, 10
    call putchar
    mov cx, 3 ; Triangulo de n niveles
    mov ax, 1 ; inicio

    ; Comprobacion de los datos
    ; Salir si cx >= 11 || cx <= 0
    cmp cx, 11
        jae .sig
    cmp cx, 0
        jbe .sig

.loop: 
    mov bx, 0
.imprimir: 
    cmp bx, ax
    je .out
    push ax
    mov al, '*'
    call putchar
    pop ax
    inc bx
    jmp .imprimir
.out: 
    inc ax 
    push ax
    mov al, 10
    call putchar
    pop ax
    loop .loop

.sig:
    ; D)

    mov eax, 1
    int 0x80

section .data
    msg db "El numero es mayor", 0xa, 0