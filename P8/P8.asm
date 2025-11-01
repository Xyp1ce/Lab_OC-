%include "../LIB/pc_iox.inc"

section .data
    msg db "El numero es menor a 5", 0xa, 0
    msg1 db "El numero es mayor a 5", 0xa, 0
    msg2 db "El caracter es un numero", 0xa, 0
    msg3 db "El caracter es una letra", 0xa, 0
    A db "Ingresa un numero", 0xa, 0
    B db "Ingresa un numero o letra", 0xa, 0
    D db "Ingresa 10 caracteres", 0xa, 0
    E db "Datos capturados"

section .bss
    arreglo resb 10

section .text
    global _start

; Rutina de salto de linea
lf:
    push ax
    mov al, 10
    call putchar
    pop ax
    ret

_start: 
    ; A) Leer caracter del 0 al 9 y revisar si es menor que 5
    mov edx, A
    call puts
    call getche
    call lf

    cmp al, '5' ; Comparamos 'al' con 5
    jae .mayor ; jump if above or equal
    mov edx, msg ; Es menor 
    call puts
    jmp .b  
.mayor:
    mov edx, msg1 ; Es mayor
    call puts

.b: ; B) Leer un caracter y mostrar si es un numero o letra
    mov edx, B
    call puts
    call getche ; Pedimos el caracter
    call lf
    cmp al, '0'
    jb .letra
    cmp al, '9'
    ja .letra
    mov edx, msg2
    call puts
    call lf
    jmp .c
.letra:
    mov edx, msg3
    call puts
    call lf

.c: ; C) Triangulo en pantalla
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
    call lf
    loop .loop

    call lf
.sig:
    ; D) Arreglo de 10 bytes 
    mov cx, 10 ; 10 Iteraciones
    mov ebx, -1
    mov edx, D
    call puts
.pedir:
    inc ebx
    call getche
    call lf
    mov byte [arreglo+ebx], al
    loop .pedir

    ; Reinciar valores para el loop
    mov edx, E
    call puts
    mov cx, 10 ; Reiniciar cx 
    mov ebx, -1 ; reinciar ebx
    call lf
.mostrar:
    inc ebx
    mov al, [arreglo+ebx]
    call putchar
    call lf
    loop .mostrar

    mov eax, 1
    int 0x80
