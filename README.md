# Arquitetura de Computadores  
## Propósito do Projeto  
O propósito deste projeto é aprofundar o entendimento dos principais conceitos de Arquitetura de Computadores, explorando tanto aspectos teóricos quanto práticos. O projeto envolve a implementação de algoritmos em linguagem de montagem (assembly), permitindo a compreensão sobre o funcionamento interno dos processadores, a organização e manipulação da memória, o fluxo de execução de instruções e a interação entre hardware e software. Ao realizar atividades como ordenação de arrays, cálculo de fatorial e jogo para facilitar o aprendizado de condicionais, os participantes desenvolvem habilidades essenciais para analisar, projetar e otimizar sistemas computacionais, preparando-se para desafios reais na área de computação.

---  

## Estrutura do Projeto  
A estrutura do projeto segue a seguinte organização:  
```yaml  
Arquitetura-de-Computadores-2025.1/
└── AP2/                           # Pasta com Avaliação Parcial 2 realizada  
    ├── bubble_sorter.asm          # Implementação do array sorter
    ├── fatorial_calculator.asm    # Implementação da calculadora de fatorial
    └── ta_quente_ta_frio.asm      # Implementação do jogo bobo,"Tá quente, ta frio"
└── utils/                         # Pasta com utilitários para facilitar o uso do projeto
    ├── Mars4_5.jar                # Arquivo do Mars, responsável por rodar os programas
    └── run.sh                     # Programa bash para facilitar uso do projeto
├── LICENSE                        # Licença estilo MIT sobre o projeto  
└── README.md                      # Documentação do projeto  
```
> **Observação:** O programa `ta_quente_ta_frio.asm` é uma brincadeira boba que muito auxiliou no aprendizado de condicionais e recepção de inputs do usuário, mas não deve, de maneira alguma, ser levado a sério para fins de análise de temperatura.
---  
## Como rodar o projeto

1. Certifique-se de ter o Java com JRE/JDK 9 ou superior instalado em sua máquina.
    > **Observação:** O arquivo `Mars4_5.jar` é utilizado para executar os códigos em Assembly. Não é necessário instalar nada além do Java para rodar o projeto.
2. Clone o repositório:
    ```bash
    git clone https://github.com/ApenasUmSonhador/Arquitetura-de-Computadores-2025.1.git
    ```
3. Dê permissão de execução ao script de inicialização:
    ```bash
    chmod +x ./utils/run.sh
    ./utils/run.sh
    ```
3. Execute o script para rodar o projeto:
    ```bash
    ./utils/run.sh
    ```
5. Siga as instruções exibidas no terminal para escolher qual programa deseja executar.
## Licença  
Este projeto está licenciado sob a licença MIT. Consulte o arquivo [`LICENSE`](LICENSE) para mais informações.  

---  

## Colaboradores  
Trabalho de Arquitetura de Computadores com os devidos créditos para:  
- [Antônio Cardoso do Nascimento Neto](https://github.com/CardosoNascimento)
- [Arthur Vinicius Carneiro Nunes](https://github.com/ApenasUmSonhador)
- [José Cleomon da Silva Junior](https://github.com/cleomon)
- [Rayane da Silva Lima](https://github.com/Rayane-Silva-Lima)
- [Samyra Vitória Lima de Almeida](https://github.com/samyraalmeida)