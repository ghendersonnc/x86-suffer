section .data
dividend dd 1200
divisor dd 1000
remainder dd 0
quotient dd 0

section .text
global _start
_start:
    mov eax, [dividend]
    mov ecx, [divisor]

    WHILE_DIVISOR_ABOVE_ZERO:
        cmp DWORD [divisor], 0
        jg display_number
        jmp end

        display_number:
        mov edx, 0
        div ecx

        mov DWORD [quotient], eax
        mov DWORD [remainder], edx

        add eax, 0x30
        push eax
        lea ecx, [esp]

        mov eax, 0x4
        mov ebx, 0x1
        mov edx, 1
        int 0x80

        mov edx, 0
        mov eax, [divisor]
        mov ecx, 10
        div ecx

        mov ecx, eax
        mov DWORD [divisor], eax
        mov eax, [remainder]

    jmp WHILE_DIVISOR_ABOVE_ZERO

    end:
    mov eax, 0xA
    push eax
    lea ecx, [esp]

    mov eax, 0x4
    mov edx, 1
    int 0x80

    mov eax, 0x1
    mov ebx, 0
    int 0x80
