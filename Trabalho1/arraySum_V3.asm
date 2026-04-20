; SETUP INICIAL
; R1 = Ponteiro A (Endereço 80 em binário: 5 << 4)
xor 0, 0
addi 5
xor 1, 1
add 1, 0        ; R1 = 5
xor 0, 0
addi 4
slr 1, 0        ; R1 = 80 (Instrução 6)

; SETUP R3 = Endereço do Loop soma_V (Endereço 13)
xor 0, 0
addi 6
addi 7          ; R0 = 13
xor 3, 3
add 3, 0        ; R3 = 13 (Instrução 12)

; --- LOOP DE SOMA (Endereço 13) ---
soma_V:
    ld 2, 1         ; R2 = Valor de A[i] (Instrução 13)

    ; Calcular endereço de B[i] (R1 + 10)
    xor 0, 0
    addi 5
    add 0, 0        ; R0 = 10
    add 0, 1        ; R0 = Endereço de B[i]
    ld 0, 0         ; R0 = Valor de B[i]
    add 2, 0        ; R2 = A[i] + B[i]

    ; Calcular endereço de R[i] (R1 + 20)
    xor 0, 0
    addi 5
    add 0, 0        ; 10
    add 0, 0        ; 20
    add 0, 1        ; R0 = ptr R[i]
    st 2, 0         ; Salva soma no Vetor R (Instrução 25)

    ; Avança ponteiro do loop (R1++)
    xor 0, 0
    addi 1
    add 1, 0        ; R1++ (Instrução 28)

    ; VERIFICA FIM: Se R1 chegou em 90 (80+10)
    ; Prepara endereço de 'fim' (Endereço 53) em R2
    xor 2, 2
    xor 0, 0
    addi 6
    add 0, 0        ; 12
    add 0, 0        ; 24
    add 0, 0        ; 48
    addi 5          ; 53 (Endereço do Halt)
    add 2, 0        ; R2 = 53 (Instrução 36)

    ; Verifica se R1 == 90
    xor 0, 0
    addi 5
    add 0, 0        ; 10
    addi 1          ; 11
    add 0, 0        ; 22
    add 0, 0        ; 44
    addi 1          ; 45
    add 0, 0        ; 90
    sub 0, 1        ; R0=0 se R1=90 (Instrução 45)
    
    ; Controle de fluxo
    brzr 0, 2       ; Se acabou, pula para 53 (R2)
    xor 0, 0
    brzr 0, 3       ; Senão, pula para 13 (R3)

    ; Alinhamento (Padding) para que o Halt caia no 53
    xor 0, 0        ; 49
    xor 0, 0        ; 50
    xor 0, 0        ; 51
    xor 0, 0        ; 52

fim:
    ji 0            ; Halt (Endereço 53)

; --- DADOS (Endereço 80) ---
; Código termina em 53. Instrução 53 ocupa 1 byte. Próximo é 54.
; Para chegar em 80: 80 - 54 = 26 bytes de espaço.
.space 26

; Vetor A
.bits8 0x00 0x02 0x04 0x06 0x08 0x0A 0x0C 0x0E 0x10 0x12
; Vetor B 
.bits8 0x01 0x03 0x05 0x07 0x09 0x0B 0x0D 0x0F 0x11 0x13
; Vetor R 
.bits8 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00