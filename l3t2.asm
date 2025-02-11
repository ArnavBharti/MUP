.model tiny
.data
    DATA1 dw 100h
    count db 10
.code
.startup
    lea si, DATA1
    mov cl, count
inspect:
    mov al, [si]
    cmp al, 00h
    jnz next
    add al, 0ffh
    mov [si], al
next:
    inc si
    dec cl
    jnz inspect
.exit
end