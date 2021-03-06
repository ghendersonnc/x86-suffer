section .data
dividend dd -1204
divisor dd 1000
remainder dd 0

section .text
global _start
_start:
    mov eax, [dividend]
    mov ecx, [divisor]
    mov ebx, 0x1


    WHILE_DIVISOR_ABOVE_ZERO:
        cmp DWORD [dividend], -1
        jle display_negative
        cmp DWORD [divisor], 0
        jg display_number
        jmp end

        display_negative:
            mov eax, 0x2D
            push eax
            lea ecx, [esp]
            add esp, 4

            mov eax, 0x4
            mov edx, 1
            int 0x80

            neg DWORD [dividend]

            mov eax, [dividend]
            mov ecx, [divisor]

            jmp WHILE_DIVISOR_ABOVE_ZERO
        display_number:
            mov edx, 0
            div ecx

            mov DWORD [remainder], edx

            add eax, 0x30
            push eax
            lea ecx, [esp]
            add esp, 4

            mov eax, 0x4
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
    add esp, 4

    mov eax, 0x4
    mov edx, 1
    int 0x80

    mov eax, 0x1
    mov ebx, 0
    int 0x80
