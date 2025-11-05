%include "../LIB/pc_iox.inc"

section .data
    msgAr1 db "Capturar array 1", 0xa, 0
    msgAr2 db "Capturar array 2", 0xa, 0
    msg db "Ingresa un dato", 0xa, 0
    msg1 db "Mostrando datos", 0xa, 0
    msg2 db "Realizando suma de vectores", 0xa, 0
    msg3 db "Realizando producto punto de vectores", 0xa, 0
    N equ 10

section .bss
    ; Reservar memoria para dos arreglos con tamaño de 10 bytes cada uno
    array1 resb N
    array2 resb N
    result resb N

section .text  
    global _start

_start:
    mov ebx, array1 ; Pasar la direccion de array1 a 'ebx'
    mov edx, msgAr1
    call puts
    call _LeeVector
    call _MostrarVector
    mov ebx, array2 ; Pasar la direccin de array2 a 'ebx'
    mov edx, msgAr2
    call puts
    call _LeeVector
    call _MostrarVector
    call _SumarVector
    call _ProductoPunto
    mov eax, 1
    int 0x80

_lf: ; Procedimiento para hacer un line feed
    push eax
    mov al, 10
    call putchar
    pop eax
    ret

_LeeVector: ; Procedimiento para leer N veces un dato y almacenarlo en el arreglo que contiene 'ebx'
    mov ecx, N
    mov esi, 0
    mov edx, msg
    .loop:
        call puts
        ;call _lf
        call getch ; El dato esta en 'al'
        cmp al, '0'
            jb .loop ; Vuelve a pedir si es menor
        cmp al, '9'
            ja .loop ; Vuelve a pedir si es mayor
        ; Convertir a numero decimal
        sub al, 0x30
        call pHex_b
        call _lf
        ; Almacenar en 'ebx' 'al'
        mov [ebx + esi], al
        inc esi
    loop .loop
    ret

_MostrarVector: ; Procedimiento para mostrar los N datos del arreglo almacenado en 'ebx'
    mov ecx, N
    mov edx, msg1
    call puts
    mov esi, 0
    .loop:
        mov al, [ebx + esi]
        call pHex_b
        call _lf
        inc esi
    loop .loop
    ret

_SumarVector: ; Procedimiento para sumar dos vectores almacenados en 'ebx' y 'edx', el resultado se guarda en 'edi'
    mov ecx, N
    mov edx, msg2
    call puts
    mov esi, 0
    mov ebx, array1
    mov edx, array2
    mov edi, result
    .sumar:
        mov al, [edx + esi]
        add al, [ebx+esi]
        mov [edi + esi], al 
        inc esi
    loop .sumar
    mov ebx, result
    call _MostrarVector
    ret

_ProductoPunto: ; Procedimiento para calcular el producto punto de dos arreglos almacenados en 'ebx' y 'edx', el resultado se guarda en 'ebx'
    mov ecx, N
    mov edx, msg3
    call puts
    mov esi, 0
    mov ebx, array1
    mov edx, array2
    mov edi, 0
    .mult:
        mov al, [ebx+esi]
        mul byte[edx+esi] ; El resultado se guarda en 'ax'
        add di, ax
        inc esi
    loop .mult
    mov ax, di
    call pHex_b
    call _lf
    ret
