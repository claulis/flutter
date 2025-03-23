# Funções

## 1. Definição de Funções

As funções em Dart são blocos de código reutilizáveis que executam uma tarefa específica. Uma função bem definida segue o princípio de responsabilidade única, realizando apenas uma operação lógica. Em Dart, as funções são cidadãs de primeira classe, o que significa que podem ser atribuídas a variáveis, passadas como argumentos e retornadas por outras funções.

>:warning: Código de exemplo no arquivo [def_func.dart](../assets/code/def_func.dart)

A sintaxe básica para definir uma função em Dart inclui um tipo de retorno (opcional, mas recomendado), um nome descritivo, parâmetros entre parênteses e um corpo delimitado por chaves. Dart também suporta funções de uma única expressão usando a sintaxe de seta (=>).

### Boas Práticas:
- Sempre especifique o tipo de retorno para melhorar a legibilidade e segurança do código
- Use nomes descritivos que indicam claramente o propósito da função
- Mantenha as funções curtas e focadas em uma única responsabilidade
- Adicione documentação para funções públicas usando comentários de documentação (`///`)
- Use a sintaxe de seta para funções simples de uma linha

## 2. Parâmetros Obrigatórios e Opcionais

Dart oferece flexibilidade com diferentes tipos de parâmetros. Parâmetros obrigatórios devem ser fornecidos em todas as chamadas de função, enquanto parâmetros opcionais podem ser omitidos.

Os parâmetros opcionais posicionais são definidos colocando-os entre colchetes `[]`. Você pode fornecer valores padrão para parâmetros opcionais, que serão usados quando nenhum valor for fornecido na chamada da função.

### Boas Práticas:
- Coloque parâmetros obrigatórios antes dos opcionais
- Sempre forneça valores padrão significativos para parâmetros opcionais
- Use o tipo nullable (`?`) para parâmetros opcionais sem valor padrão
- Mantenha o número de parâmetros reduzido (preferencialmente menos de 4) para melhorar a usabilidade
- Considere usar parâmetros nomeados para funções com muitos parâmetros

>:warning: Código de exemplo no arquivo [param_func.dart](../assets/code/param_func.dart)

## 3. Parâmetros Nomeados

Parâmetros nomeados são uma excelente maneira de tornar as chamadas de função mais legíveis e autoexplicativas, especialmente quando a função aceita muitos parâmetros. Em Dart, os parâmetros nomeados são definidos entre chaves `{}`.

Desde o Dart 2.12 (com null safety), você pode marcar parâmetros nomeados como obrigatórios usando a palavra-chave `required`. Caso contrário, os parâmetros nomeados são opcionais por padrão e podem ter valores padrão.

### Boas Práticas:
- Use parâmetros nomeados para funções com mais de 2-3 parâmetros
- Marque claramente quais parâmetros são obrigatórios com `required`
- Forneça valores padrão significativos para parâmetros opcionais
- Use nomes claros e concisos para os parâmetros
- Mantenha a consistência em seu código: se uma função usa parâmetros nomeados, considere usar o mesmo padrão em funções relacionadas

>:warning: Código de exemplo no arquivo [namedparam_func.dart](../assets/code/namedparam_func.dart)

## 4. Funções Anônimas

Funções anônimas (também conhecidas como lambda ou closures) são funções sem nome que podem ser definidas inline. Elas são especialmente úteis para operações de curta duração, como callbacks ou manipulação de coleções.

Em Dart, as funções anônimas podem ser definidas usando a sintaxe completa com chaves ou a sintaxe de seta para expressões simples. Elas capturam o escopo onde são definidas, tendo acesso às variáveis disponíveis naquele escopo.

### Boas Práticas:
- Use funções anônimas para callbacks curtos e simples
- Prefira a sintaxe de seta para funções de uma única expressão
- Evite funções anônimas muito longas ou complexas; extraia-as para funções nomeadas se excederem algumas linhas
- Seja consistente com o estilo de função anônima em todo o seu código

>:warning: Código de exemplo no arquivo [anon_func.dart](../assets/code/anon_func.dart)

## 5. Funções de Ordem Superior

Funções de ordem superior são funções que operam com outras funções, seja aceitando funções como parâmetros ou retornando funções como resultado. Este conceito é fundamental para programação funcional e permite criar abstrações poderosas.

Em Dart, você pode passar funções como argumentos usando seu nome, uma variável que contém uma função, ou uma função anônima definida inline. Similarmente, uma função pode retornar outra função, que pode capturar variáveis do escopo original.

### Boas Práticas:
- Use tipos apropriados para parâmetros e retornos de função (`Function` ou tipos mais específicos como `int Function(String)`)
- Considere usar typedef para tornar os tipos de função mais legíveis
- Utilize funções de ordem superior para abstrair comportamentos comuns e reduzir a duplicação de código
- Tenha cuidado com o fechamento de variáveis para evitar bugs sutis

>:warning: Código de exemplo no arquivo [superior_func.dart](../assets/code/superior_func.dart)

## 6. Closures

Closures são funções que têm acesso a variáveis do escopo em que foram definidas, mesmo depois que o escopo original terminou sua execução. Este conceito é fundamental em Dart e permite criar funções com "memória" ou "estado".

As closures são criadas automaticamente quando uma função captura variáveis do seu escopo circundante. Esta capacidade é especialmente útil para criar funções factory, geradores, ou para manter estado em callbacks.

### Boas Práticas:
- Use closures para encapsular estado quando necessário
- Tenha cuidado com vazamentos de memória em closures de longa duração
- Evite modificar variáveis externas em excesso dentro de closures
- Considere explicitamente quais variáveis uma closure deve capturar
- Use closures para criar funções personalizadas dinamicamente

>:warning: Código de exemplo no arquivo [closures.dart](../assets/code/closures.dart)

---
Vai para:
- [Sumário](https://github.com/claulis/flutter/blob/main/dart/README.md)
- [Próximo capítulo](../capitulos/funcoes.md)