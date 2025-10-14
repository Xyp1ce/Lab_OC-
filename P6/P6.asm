%include "../LIB/pc_iox.inc" 

section .text 
    global _start ; necesario para el compilador gcc

_start: ; Indicar al enlazador donde comenzar
    ; Sumar a ebx mi matricula 
    ; 2210376
    mov ebx, 0x5C4B2A60
    add ebx, 0x02210376
    mov eax, ebx
    call pHex_dw

    mov al, 10
    call putchar 

    ; Hacer push de los 16 bits menos significativos
    push bx

    ; Guardar en N la multiplicacion de 
    ; bl x 8
    mov byte[ax], bl
    imul ax, ax, 8
    mov word[N], ax
    
    mov al, 10
    call putchar 

    ; Incrementar el valor de N en 1
    inc word[N]

    mov eax, 1
    int 0x80
    
section .data
N dw 0