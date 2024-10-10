# Requisitos

Neste desafio, vamos desenvolver uma aplicação que realiza a divisão de uma lista de compras entre pessoas. Por simplicidade, vamos escrever um módulo "Challenge" que expõe a função "split".

A função "Challange.split/2"deverá receber dois argumentos:

1. Uma lista de tuplas representam { nome_do_item, quantidade, preço por unidade (em centavos) }. Vamos considerar que a entrada é sempre válida, sem repetir um mesmo item com preços distintos.

2. Uma lista de e-mails (devemos ignorar repetições de emails)

Dadas essas entradas, a função Challange.split/2 precisa:
1. Calcular o valor total (ou seja, quantidade * valor_unitario) da lista;
2. Realizar a divisão *justa* entre os e-mails (ou seja, se houver resto, ele deve ser distribuido entre as pessoas)
3. Retornar um map do tipo ${email => valor_a_pagar}

Vale lembrar que todos os valores são representados como um Integer, em centavos de real, e, portanto, não podemos passar em momento algum por float.

