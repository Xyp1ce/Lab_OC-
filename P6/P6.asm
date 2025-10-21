%include "../LIB/pc_iox.inc"

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point
    
    ; A)
    mov ebx, 0x5C4B2A60
    add ebx, 0x02210376

	mov eax,ebx
	call pHex_dw

	mov ebx,eax

	mov al,10
	call putchar

    ; B)
    push bx

    ; Sacar de la pila para imprimir
    pop ax

    ;movzx eax, ax

    call pHex_w

    ; Regresar a la pila BX
    push bx

	mov al,10
	call putchar

    mov al, bl

    ; C)
    ;limpiar AH para multiplicar sin signo
    mov ah, 0
    mov cl, 8
    
    ; AL * CL  el resultado se guardaa en AX
    ; El resultado se guarda en N
    mul cl
    mov [N], ax

    mov ax, word[N]
    call pHex_w

	mov al,10
	call putchar

    ; D) 
    inc word [N]
    
    mov ax, word [N]
    call pHex_w

	mov al,10
	call putchar
    
    ; E)
    mov ax, bx 
    mov cl, 0xFF 
   
    ; AX / CL 
    ;el valor se almacena en AL = cociente y AH = residuo
    div cl                 

    ;El cociente ya está en AL
    call pHex_b

    mov al,10
	call putchar

    ;el residuo está en AH
    mov al, ah
    call pHex_b

    mov al,10
	call putchar

    ; F) 
    mov ax, word [N]
    add al, ah

    ; G)
    mov [N], ax

    mov ax, word [N]
    call pHex_w

    mov al, 10
    call putchar 

    dec word [N]

    mov ax, word [N]
    call pHex_w

    mov al, 10
    call putchar 

    ; push a la pila de las banderas
    pushf 
    pop ax 
    call pHex_w

	mov al,10
	call putchar

    ; H)
    ; reiniciamos ax para la pila
    mov ax, 0
    pop ax

	mov al,10
	call putchar

	mov eax, 1
	int 0x80 

section	.data
N	dw 0 