.model tiny
.data
    p1 db "Enter username: $"
    p2 db "Enter password: $"
    username db "username$"
    password db "12345$"
    msg db "Hello $"
    max1 db 9
    act1 db ?
    inp1 db 8 dup(0)
    max2 db 6
    act2 db ?
    inp2 db 5 dup(0)
.code
.startup
    ; print username prompt
    mov ah, 09h
    lea dx, p1
    int 21h

    ; input
    mov ah, 0ah
    lea dx, max1
    int 21h
    lea si, inp1
    mov bl, act1
    mov byte ptr [si+bx], '$'

    ; new line and carriage return
    mov dl, 0ah
    mov ah, 02h
    int 21h
    mov dl, 0dh
    int 21h

    ; check username
    lea si, username
    lea di, inp1

cmp_username:
    mov al, [si]
    cmp al, [di]
    jne finish
    cmp al, '$'
    je pass
    inc si
    inc di
    jmp cmp_username

pass:
    ; print password prompt
    mov ah, 09h
    lea dx, p2
    int 21h

    ; input
    mov ah, 0ah
    lea dx, max2
    int 21h
    lea si, inp2
    mov bl, act2
    mov byte ptr [si+bx], '$'

    ; new line and carriage return
    mov dl, 0ah
    mov ah, 02h
    int 21h
    mov dl, 0dh
    int 21h

    ; check password
    lea si, password
    lea di, inp2

cmp_password:
    mov al, [si]
    cmp al, [di]
    jne finish
    cmp al, '$'
    je hello_msg
    inc si
    inc di
    jmp cmp_password

hello_msg:
    ; hello 
    mov ah, 09h
    lea dx, msg
    int 21h

    ; name
    mov ah, 09h
    lea dx, inp1
    int 21h

finish:

.exit
end