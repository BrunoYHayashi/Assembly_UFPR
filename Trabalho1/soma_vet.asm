; SETUP INICIAL
; R1 = Ponteiro A (Endereço 80)
xor r0, r0
addi 5
add r1, r0 ; R1 = 5 
xor r0, r0
addi 4
slr r1, r0 ; R1 = 101 com deslocamento de 4(R0) para a esquerda (80) 
; instrução 5

; R3 = Endereço do Loop soma_V (Instrução 12)
xor r0, r0
addi 7
addi 4
xor r3, r3
add r3, r0
; Instrução 10

; LOOP DE SOMA (Endereço 11)
soma_V:
    ld r2, r1 ; R2 = Valor de A[i]

    ; Calcular endereço de B[i] (R1 + 10)
    xor r0, r0
    addi 7
    addi 3          
    add r0, r1 ; R0 = Endereço de B[i]
    ld r0, r0 ; R0 = Valor de B[i]

    add r2, r0 ; R2 = A[i] + B[i]
    ; Instrução 17

    ; Calcular endereço de R[i] (R1 + 20)
    xor r0, r0
    addi 5
    add r0, r0
    add r0, r0
    add r0,r1         ; R0 = R1 + 20 = Endereço de R[i]
    st r2, r0       ; Salva a soma no Vetor R
    ; Instrução 23

    ; Avança ponteiro do loop (R1++)
    xor r0, r0
    addi 1
    add r1, r0
    ; Instrução 26


    ; Verifica fim: Como A começa em 80, termina quando R1 chegar em 90.
    ; Carrega endereço de 'fim' (endereço 48) em R2
    xor r0, r0
    addi 5
    add r0, r0 ; 10
    addi 1
    add r0, r0 ; 22
    add r0, r0
    xor r2, r2
    addi 4 ; 48
    add r2, r0

    ; Verifica se R0 é = R1 + 10 (décimo primeiro elemento do vetor A [não existe])
    xor r0, r0
    addi 5
    add r0, r0 ; 10
    addi 1
    add r0, r0 ; 22
    add r0, r0
    addi 1 ; 45
    add r0, r0
    sub r0, r1 ; Se R1 for 90, R0 vira 0
    
    ; Controle de fluxo
    brzr r0, r2 ; Se acabou, pula o salto de volta
    xor r0, r0
    brzr r0, r3 ; Pula para o endereço em R3 (soma_V)

fim:
    ji 0 ;Halt (Instrução 48)

; DADOS (Iniciam no byte 80)
.space 31

; Vetor A
.bits8 0x00 0x02 0x04 0x06 0x08 0x0A 0x0C 0x0E 0x10 0x12

; Vetor B 
.bits8 0x01 0x03 0x05 0x07 0x09 0x0B 0x0D 0x0F 0x11 0x13

; Vetor R 
.bits8 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00