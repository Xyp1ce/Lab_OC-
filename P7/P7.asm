%include "../LIB/pc_iox.inc"
extern pBin_w
extern pBin_b
extern pBin_dw

section .text
    global _start

_start: 

    ; A)
    mov eax, 0x22446688
    call pHex_dw

    mov ebx, eax

    mov al, 10
    call putchar

    mov eax, ebx

    mov cl, 4
    ror eax, cl

    call pHex_dw

    mov al, 10
    call putchar
    call putchar

    ; B)
    mov cx, 0x3F48
    mov ax, cx

    call pHex_w
    mov al, 10
    call putchar 

    shl cx, 3

    mov ax, cx
    call pHex_w

    mov al, 10
    call putchar
    call putchar

    ; C)

    mov esi, 0x20D685F3

    mov eax, esi
    call pBin_dw
    mov al, 10
    call putchar

    ; 0, 5, 13, 18 y 30
    xor esi, 0b01000000000001000010000000100001

    mov eax, esi
    call pBin_dw
    mov al, 10
    call putchar
    call putchar

    ; D)
    push esi

    ; E) 
    mov cx, 0xA7

    mov ax, cx
    call pBin_w
    mov al, 10
    call putchar 

    ; 3 y 6
    or cx, 0b0000000001001000

    mov ax, cx
    call pBin_w
    mov al, 10
    call putchar 
    call putchar

    ; F)
    mov bp, 0x67DA

    mov ax, bp
    call pBin_w
    mov al, 10
    call putchar 

    ; 1, 4,	6, 10 y 14
    and bp, 0b1011101110101101

    mov ax, bp
    call pBin_w
    mov al, 10
    call putchar 
    call putchar   

    ; G)
    mov ax, bp
    call pHex_w
    mov al, 10
    call putchar

    shr bp, 3 

    mov ax, bp
    call pHex_w
    mov al, 10
    call putchar
    call putchar

    ; H) 
    mov eax, ebx
    call pHex_dw
    mov al, 10
    call putchar

    shr ebx, 5

    mov eax, ebx
    call pHex_dw
    mov al, 10
    call putchar
    call putchar

    ; I)
    mov ax, cx
    call pHex_w
    mov al, 10
    call putchar

    shl cx, 3

    mov ax, cx
    call pHex_w
    mov al, 10
    call putchar
    call putchar

    ; J)
    pop esi
    mov eax, esi
    call pHex_dw
    mov al, 10
    call putchar
    call putchar

    ; K)
    mov eax, esi
    call pHex_dw
    mov al, 10
    call putchar

    shl esi, 3
    shl esi, 1

    mov eax, esi
    call pHex_dw
    mov al, 10
    call putchar
    call putchar

    mov eax, 1
	int 0x80 

section .data
