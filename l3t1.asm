.model tiny
.data
    DATA1 db "MicroProcessoR"
    count db 14
.code
.startup
    lea si, DATA1
    mov cl, count
inspect:
    mov al, [si]
    cmp al, 'A'
    jl next
    cmp al, 'Z'
    jg next
    add al, 20h
    mov [si], al
next:
    inc si
    dec cl
    jnz inspect
.exit
end