.model tiny
.data
    max1 db 20
    act1 db ?
    inp1 db 19 dup(0)
.code
.startup
    mov ah, 0ah
    lea dx, max1
    int 21h

    lea si, inp1
    mov bl, act1
    mov byte ptr [si+bx], '$'

    mov dl, 0ah
    mov ah, 02h
    int 21h
    mov dl, 0dh
    int 21h

    lea dx, inp1
    mov ah, 09h
    int 21h
.exit
end