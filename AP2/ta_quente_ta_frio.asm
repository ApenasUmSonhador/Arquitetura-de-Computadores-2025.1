# ========================================
# SEÇÃO DE DADOS
# ========================================
.data
    # Arte de boas-vindas
    welcome_art: .asciiz "\n\+==================================================+\n\|.................Tá quente tá frio................|\n\|....Precisão absurda na análise da temperatura....|\n\|.................Não levar a sério................|\n\|..............Feito para aprendizado..............|\n\+==================================================+\n\                          ####                    \n\                          ####                    \n\                          ####                    \n\          ####            ####            ##      \n\          ####                          ######    \n\            ####      ############    ######      \n\                  ##################    ##        \n\                ######################            \n\                ########################          \n\              ##########################          \n\              ############################        \n\    ######    ############################  ######\n\    ######    ############################  ######\n\              ############################        \n\              ############################        \n\              ##########################          \n\                ######################            \n\                  ##################              \n\            ####    ##############    ####        \n\          ######                        ####      \n\          ####                            ##      \n\                          ####                    \n\                          ####                    \n\                          ####                    \n\                                                  \n\+==================================================+\n"
    # Mensagens e variáveis
    prompt_temp: .asciiz "Digite a temperatura (somente inteiros): "
    msg_cold:   .asciiz "Tá frio por aí\n"
    msg_hot: .asciiz "Tá quente aí viu\n"
    msg_show:   .asciiz "Tá show oh\n"

# ========================================
# SEÇÃO DE CÓDIGO EXECUTÁVEL
# ========================================
.text
.globl main

main:
    # Exibe arte de boas vindas
    li $v0, 4
    la $a0, welcome_art
    syscall

    # Exibe mensagem: "Digite a temperatura: "
    li $v0, 4
    la $a0, prompt_temp
    syscall

    # Lê temperatura do usuário
    li $v0, 5
    syscall
    move $t0, $v0           # $t0 = temperatura

    li $t1, 15              # $t1 = 15
    li $t2, 25              # $t2 = 25

    # Verifica se está frio (temp < 15)
    blt $t0, $t1, cold

    # Verifica se está quente (temp > 25)
    bgt $t0, $t2, hot

    # Se não for frio nem quente, está show
    li $v0, 4
    la $a0, msg_show
    syscall
    j end

cold:
    # Exibe mensagem: "Tá frio"
    li $v0, 4
    la $a0, msg_cold
    syscall
    j end

hot:
    # Exibe mensagem: "Tá quente"
    li $v0, 4
    la $a0, msg_hot
    syscall

end:
    li $v0, 10
    syscall