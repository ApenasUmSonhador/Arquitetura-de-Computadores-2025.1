# ========================================
# SEÇÃO DE DADOS
# ========================================
.data
    # Arte de boas-vindas
    welcome_art: .asciiz "\n+=========================================+\n\|.................FATORIAL................|\n\|.............Base da recursão............|\n\+=========================================+\n\|   __       _             _       _   _  |\n\|  / _| __ _| |_ ___  _ __(_) __ _| | | | |\n\| | |_ / _` | __/ _ \\| '__| |/ _` | | | | |\n\| |  _| (_| | || (_) | |  | | (_| | | |_| |\n\| |_|  \\__,_|\\__\\___/|_|  |_|\\__,_|_| (_) |\n\+=========================================+\n"
    # Mensagens e variáveis
    prompt:     .asciiz "Digite um numero: "
    result:     .asciiz "Fatorial = "
    newline:    .asciiz "\n"
    num:        .word 0

# ========================================
# SEÇÃO DE CÓDIGO EXECUTÁVEL
# ========================================
.text
.globl main

# ========================================
# FUNÇÃO PRINCIPAL
# ========================================
main:
    # Exibe arte de boas vindas
    li $v0, 4
    la $a0, welcome_art
    syscall

    # Exibe mensagem: "Digite um numero: "
    li      $v0, 4
    la      $a0, prompt
    syscall

    # Lê número inteiro digitado pelo usuário
    li      $v0, 5
    syscall
    move    $a0, $v0            # $a0 = número lido

    # Chama a função recursiva de fatorial
    jal     fatorial

    move    $t0, $v0            # salva o resultado do fatorial

    # Exibe mensagem: "Fatorial = "
    li      $v0, 4
    la      $a0, result
    syscall

    # Imprime o resultado do fatorial (corretamente agora)
    move    $a0, $t0            # coloca resultado salvo em $a0
    li      $v0, 1              # código do syscall para imprimir int
    syscall

    # Imprime nova linha
    li      $v0, 4
    la      $a0, newline
    syscall

    # Encerra o programa
    li      $v0, 10
    syscall

# ========================================
# FUNÇÃO: FATORIAL (RECURSIVA)
# Entrada: $a0 = n
# Saída:   $v0 = fatorial(n)
# ========================================
fatorial:
    addi    $sp, $sp, -8        # Aloca espaço na pilha
    sw      $ra, 4($sp)         # Salva endereço de retorno
    sw      $a0, 0($sp)         # Salva argumento n

    blez    $a0, base_case      # Se n <= 0, vai para caso base
    li      $t0, 1
    beq     $a0, $t0, base_case # Se n == 1, vai para caso base

    addi    $a0, $a0, -1        # $a0 = n - 1
    jal     fatorial            # Chama recursivamente fatorial(n-1)

    lw      $a0, 0($sp)         # Recupera n original
    mul     $v0, $v0, $a0       # $v0 = fatorial(n-1) * n
    j       end_fat             # Vai para final da função

base_case:
    li      $v0, 1              # Caso base: fatorial(0) ou fatorial(1) = 1

end_fat:
    lw      $ra, 4($sp)         # Recupera endereço de retorno
    addi    $sp, $sp, 8         # Libera espaço da pilha
    jr      $ra                 # Retorna para quem chamou