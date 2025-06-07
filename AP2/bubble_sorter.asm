# ========================================
# SEÇÃO DE DADOS
# ========================================
.data
    prompt_n: .asciiz "Indique o numero de inteiros no array: "
    prompt_value: .asciiz "Digite um numero: "
    new_line: .asciiz "\n"  # Nova linha para formatação
    .align 2                # alinha na fronteira de 4 bytes (2² = 4 bytes) ideal para inteiros
    array: .space 400       # Espaço para até 100 inteiros (adota-se 4 bytes cada)
    n: .word 0              # Variável para armazenar o número de elementos

# ========================================
# SEÇÃO DE CÓDIGO EXECUTÁVEL
# ========================================
.text
.globl main
# ========================================
# FUNÇÃO PRINCIPAL
# ========================================
main:
    # Exibe mensagem: "Indique o numero de inteiros no array: "
    li $v0, 4
    la $a0, prompt_n
    syscall

    # Lê número inteiro digitado pelo usuário
    li $v0, 5
    syscall
    move $t5, $v0           # $t5 = n
    sw $t5, n               # salva n na memória

    # Lê n números do usuário e armazena no array
    li $t0, 0               # contador i = 0
    la $t1, array           # endereço base do array em $t1

read_loop:
    bge $t0, $t5, sort_call # se i >= n, termina leitura

    # Mostra: "Digite um numero:"
    li $v0, 4
    la $a0, prompt_value
    syscall

    # Lê número digitado
    li $v0, 5
    syscall

    # Armazena no array: array[i] = $v0
    sw $v0, 0($t1)

    # Incrementa ponteiro e índice
    addi $t1, $t1, 4        # próximo endereço
    addi $t0, $t0, 1        # i++
    j read_loop

# ========================================
# CHAMA FUNÇÃO DE ORDENAÇÃO
# ========================================
sort_call:
    jal bubble_sort

# ========================================
# IMPRIME O ARRAY ORDENADO
# ========================================
print_sorted:
    li $t0, 0
    lw $t5, n               # carrega n
    la $t1, array           # base do array

print_loop:
    bge $t0, $t5, end       # se i >= n, end

    # carrega array[i]
    lw $a0, 0($t1)
    li $v0, 1
    syscall

    # imprime nova linha
    li $v0, 4
    la $a0, new_line
    syscall

    addi $t1, $t1, 4
    addi $t0, $t0, 1
    j print_loop

# ========================================
# FUNÇÃO: BUBBLE SORT (ALGORITMO DE ORDENAÇÃO)
# Entrada: Nenhum parâmetro via registrador (usa variável global 'array' e 'n')
# Saída:   Array ordenado em ordem crescente (em 'array')
# ========================================
bubble_sort:
    lw $t5, n               # $t5 = n
    addi $t5, $t5, -1       # $t5 = n - 1

    li $t1, 0               # $t1 = i

outer_loop:
    bge $t1, $t5, sort_end  # se i >= n - 1, end

    li $t2, 0               # $t2 = j

inner_loop:
    sub $t6, $t5, $t1       # $t6 = n - 1 - i
    bge $t2, $t6, next_i    # se j >= limite, vai para próximo i

    la $t0, array           # Base do array

    mul $t7, $t2, 4         # offset = j * 4
    add $t8, $t0, $t7       # Endereço de array[j]
    lw $t3, 0($t8)          # $t3 = array[j]
    lw $t4, 4($t8)          # $t4 = array[j+1]

    ble $t3, $t4, no_swap   # Se array[j] <= array[j+1], não troca

    # Troca array[j] com array[j+1]
    sw $t4, 0($t8)          # array[j] = array[j+1]
    sw $t3, 4($t8)          # array[j+1] = array[j]

no_swap:
    addi $t2, $t2, 1        # j++
    j inner_loop

next_i:
    addi $t1, $t1, 1        # i++
    j outer_loop

sort_end:
    jr $ra                  # Retorna para o main

end:
    li $v0, 10              # Encerra o programa
    syscall
