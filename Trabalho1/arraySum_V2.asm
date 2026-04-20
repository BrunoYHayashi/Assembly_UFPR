; SETUP INICIAL
; ---------------------------------------------------------
; R1 recebe o endereço de início do vetor A.
; Com 48 instruções (0 a 47), o Vetor A começará no endereço 48.
xor r0, r0
addi 7
addi 7
addi 7
addi 7
addi 7
addi 7
addi 6 ; R0 = 48
xor r1, r1
add r1, r0 ; R1 = 48 (Ponteiro para Vetor A)

; R3 recebe o endereço da instrução soma_V para o salto longo.
; O loop começa na instrução de índice 13.
xor r0, r0
addi 7
addi 7
addi 2 ; R0 = 16
xor r3, r3
add r3, r0 ; R3 = 16 (Endereço do Loop)

; LOOP DE SOMA
; ---------------------------------------------------------
soma_V:
    ld r2, r1 ; R2 = Valor de A[i]

    ; Calcular endereço de B[i] (R1 + 10)
    xor r0, r0
    addi 7
    addi 3          
    add r0, r1 ; R0 = Endereço de B[i]
    
    ld r0, r0 ; R0 = Valor de B[i]
    add r2, r0 ; R2 = A[i] + B[i]

    ; Calcular endereço de R[i] (R1 + 20)
    xor r0, r0
    addi 7
    addi 7
    addi 6
    add r0,r1         ; R0 = R1 + 20 = Endereço de R[i]
    st r2, r0       ; Salva a soma no Vetor R

    ; Avança ponteiro do loop (R1++)
    xor r0, r0
    addi 1
    add r1, r0


    ; Verifica fim: Como A começa em 43, termina quando R1 chegar em 53.
    ; Carrega endereço de 'fim' em R2
    xor r2, r2
    xor r0, r0
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 5;
    add r2, r0

    ; Verifica se R0 é = R1 + 10 (décimo primeiro elemento do vetor A [não existe])
    xor r0, r0
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 4 ; R0 = 53
    sub r0, r1 ; Se R1 for 53, R0 fica 0
    
    ; Controle de fluxo
    brzr r0, r2 ; Se acabou, pula o salto de volta
    xor r0, r0
    brzr r0, r3 ; Pula para o endereço em R3 (soma_V)

fim:
    ji 0 ;Halt (Instrução 42)

; DADOS (Endereço 43 em diante)
; ---------------------------------------------------------
db 0, 2, 4, 6, 8, 10, 12, 14, 16, 18    ; Vetor A
db 1, 3, 5, 7, 9, 11, 13, 15, 17, 19    ; Vetor B
db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0         ; Vetor R