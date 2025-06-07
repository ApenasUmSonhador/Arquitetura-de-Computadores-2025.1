#!/bin/bash

# Script para rodar o MARS com os arquivos ASM do diretório AP2
JAR_PATH="Mars4_5.jar"
ASM_DIR="../AP2/"

# Definindo os programas disponíveis
declare -A PROGRAMS=(
    [1]="bubble_sorter.asm"
    [2]="fatorial_calculator.asm"
    [3]="ta_quente_ta_frio.asm"
)

# Lógica para exibir os programas disponíveis e permitir a seleção
echo "Selecione os programas em ordem para executar (separe por espaço):"
for i in "${!PROGRAMS[@]}"; do
    echo "$i) ${PROGRAMS[$i]}"
done

# Lê as escolhas do usuário
read -p "Opções: " -a choices

# Rodando os programas selecionados na ordem escolhida
for choice in "${choices[@]}"; do
    prog="${PROGRAMS[$choice]}"
    if [[ -n "$prog" ]]; then
        java -jar "$JAR_PATH" "$ASM_DIR/$prog"
    else
        echo "Opção inválida: $choice"
    fi
done