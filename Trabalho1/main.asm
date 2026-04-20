; Soma de vetores (R = A + B)
; Autor: Bruno Yuuki Hayashi

;; -------------------- SETUP PARA PREENCHER O VETOR A --------------------
; Inicializar R1 com o endereço do vetor A (será 64)
xor r0, r0
addi 1
xor r1, r1
add r1, r0
addi 5
slr r1, r0 ; Desliza o "1" de R1, 6(R0) vezes a esquerda, indicando 64

; Inicializa R2 como 0 para inicializar o vetor A
xor r2, r2

; Guarda o endereço de init_VA em R3
xor r0, r0
addi 7
addi 5
add r3, r0

; Guarda 0 de R2 no endereço apontado por R1 (início do vetor A)
st r2, r1 
;; -------------------- FIM DO SETUP PARA PREENCHER VETOR A -------------------- 

;; -------------------- PREENCHIMENTO DO VETOR A --------------------
; Loop para preencher o vetor A
init_VA: 
    ; Aumenta em 1, R1.
    xor r0, r0
    addi 1 
    add r1, r0

    ; Aumenta 2 em R2, de acordo com as especificações do trabalho 
    addi 1
    add r2, r0

    ; Atualiza em R2 o endereço de init_VB (supondo que seja 35)
    ; Guarda o valor correto de R2 na posição correta de A, 
    ; Pode ser que R1 aponte para o primeiro endereço do próximo vetor e B[0] seja = R2, 
    ; O que é errado. Porém, na inicialização de B, será corrigido
    st r2, r1
    xor r0, r0
    xor r2, r2
    addi 4
    add r2, r0
    addi -1
    slr r2, r0
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
    brzr r0, r2 ; se 80 - R1 = 0, PC pula para setup_VB

    ; Se não, R2 volta a ter o valor que era antes de carregar o endereço de setup_VB
    ld r2, r1

    ; Volta para loop
    xor r0, r0
    brzr r0, r3

;; -------------------- FIM DO PREENCHIMENTO DO VETOR A --------------------

;; -------------------- SETUP PARA PREENCHIMENTO DO VETOR B --------------------
setup_VB:
    ; R1 vai carregar o endereço do início do vetor B (74)
    xor r0, r0
    addi 1
    xor r1, r1
    add r1, r0
    addi 5
    slr r1, r0 ; Desliza o "1" de R1, 6(R0) vezes a esquerda, indicando 64
    addi 4
    add r1, r0


    add r1, r0

    ; R2 vai ser os elementos do vetor
    xor r0, r0
    xor r2, r2
    addi 1
    add r2, r1

    ; R3 vai carregar o endereço da instrução init_VB (supondo que seja 42)
    xor r3, r3
    xor r0, r0
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    add r3, r0

    ; Guarda R2(1) na primeira posição do vetor
    st r2, r1 
;; -------------------- FIM DO SETUP PARA PREENCHIMENTO DO VETOR B --------------------

;; -------------------- PREENCHIMENTO DO VETOR B --------------------
init_VB:
    ; Incrementa em 1 o endereço do vetor 
    xor r0, r0
    addi 1
    add r1, r0

    ; Incrementa em 2 o valor de R2
    addi 1
    add r2, r0

    ; Garda o próximo valor no próximo endereço de memória
    st r2, r1
    xor r0, r0
    xor r2, r2 ; R2 agora carrega o endereço da instrução de Soma (supondo que seja 60)
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 4
    add r2, r0

    ; R0 agora carrega o endereço do fim do vetor (90)
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
    addi 7
    addi 6

    ; Verifica se 90 - R1 = 0, se for, significa que já preencheu 10 posições de vetor    
    sub r0, r1;
    brzr r0, r2 ; se 90 - R1 = 0, PC pula para setup_SV

    ; Se não, R2 volta a ter o valor que era antes de carregar o endereço de setup_SV
    ld r2, r1

    ; Volta para loop
    xor r0, r0
    brzr r0, r3
;; -------------------- FIM DO PREENCHIMENTO DO VETOR B --------------------

;; -------------------- SETUP PARA PREENCHIMENTO DO VETOR SOMA --------------------
setup_SV:
    ; R1 carrega o endereço para guardar o endereço de soma_V(94)
    xor r0, r0
    addi 1
    xor r1, r1
    add r1, r0
    addi 5
    slr r1, r0 ; Desliza o "1" de R1, 6(R0) vezes a esquerda, indicando 64
    addi 7
    addi 7
    add r1, r0


    ; Supondo que o endereço de soma_V seja 63, r2 recebe o endereço de soma_V
    xor r0, r0
    xor r2, r2
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    add r2, r0

    ; R3 recebe o endereço do primeiro elemento do vetor a (70)
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
    xor r3, r3
    add r3, r0
;; -------------------- FIM DO SETUP PARA PREENCHIMENTO DO VETOR SOMA --------------------

;; -------------------- PREENCHIMENTO DO VETOR SOMA --------------------
soma_V:
    ; Guarda na memória
    st r2, r1

    ; Reseta R2 e R1
    xor r2, r2
    xor r1, r1

    ; Load do A[R3] em R2
    ld r2, r3

    ; R3 é somado +10 para alcançar o endereço do vetor Bruno
    xor r0, r0
    addi 7
    addi 3
    add r3, r0

    ; Load do B[R3] em R1
    ld r1, r3

    ; R3 volta ao endereço anterior
    addi -8
    addi -2
    add r3, r0

    ; Soma R2 E R1
    add r2, r1

    ; R3 aumenta em 20 para chegar no endereço de carrega
    xor r0, r0
    addi 7
    addi 7
    addi 6
    add r3, r0

    ; Guarda a soma no vetor novo
    st r2, r3

    ; R3 volta ao endereço de A e soma 1 para pegar o próximo número
    xor r0, r0
    addi -8
    addi -8
    addi -3
    add r3, r0

    ; R0 recebe o endereço de memória depois da última posição do vetor A (80)
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
    addi 3
    
    ; R2 recebe endereço de fim (supondo que seja 69)
    xor r0, r0
    xor r2, r2
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 6
    add r2, r0

    ; Verifica se 80 - R3 = 0, se for, pula para fim
    sub r0, r3
    brzr r0, r2

    ; R1 carrega o endereço para guardar o endereço de soma_V(101)
    xor r0, r0
    xor r1, r1
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
    addi 7
    addi 7
    addi 3
    add r1, r0

    ; R2 carrega o endereço que estava guardado no endereço de memória de r1
    ld r2, r1

    ; Volta para loop
    xor r0, r0
    brzr r0, r2;
;; -------------------- FIM DO PREENCHIMENTO DO VETOR SOMA --------------------

fim:
    ji 0;