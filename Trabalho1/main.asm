; Soma de vetores (R = A + B)
; Autor: Bruno Yuuki Hayashi

; Inicializar R1 com o endereço do vetor A (será 70)
xor r0, r0
addi 7
addi 7
addi 7
addi 7
addi 7
addi 7
addi 7
addi 7
addi 7
addi 7
add r1, r0 

; Inicializa R2 como 0 para inicializar o vetor A
xor r2, r2

; Guarda o endereço de init_VA em R3
xor r0, r0,
addi 7
addi 6
add r3, r0

; Guarda 0 de R2 no endereço apontado por R1 (início do vetor A)
st r2, r1  

; Loop para preencher o vetor A
init_VA: 
    ; Aumenta em 1, R1.
    xor r0, r0
    addi 1 
    add r1, r0

    ; Aumenta 2 em R2, de acordo com as especificações do trabalho 
    xor r0, r0
    addi 2
    add r2, r0

    ; Atualiza em R2 o endereço de init_VB (supondo que seja 35)
    ; Guarda o valor correto de R2 na posição correta de A, 
    ; Pode ser que R1 aponte para o primeiro endereço do próximo vetor e B[0] seja = R2, 
    ; O que é errado. Porém, na inicialização de B, será corrigido
    st r2, r1
    xor r0, r0
    xor r2, r2
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    add r2, r0

    ; Lógica para verificar se já alcançou 10 posições de vetor
    xor r0, r0
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7   
    addi 3 ; R0 = 80 (número que seria um "11" elemento do vetor) 
    
    ; Verifica se 80 - R1 = 0, se for, significa que já preencheu 10 posições de vetor    
    sub r0, r1;
    brzr r0, r2 ; se 80 - R1 = 0, PC pula para init_VB

    ; Se não, R2 volta a ter o valor que era antes de carregar o endereço de init_VB
    ld r2, r1

    ; Volta para loop
    xor r0, r0
    brzr r0, r3
