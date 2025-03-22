# Estrutura de fluxo de controle

## 1. If/Else em Dart

A estrutura `if/else` é fundamental em qualquer linguagem de programação, permitindo que seu código tome decisões com base em condições.

>:warning: Código de exemplo no arquivo [ifelse.dart](../assets/code/ifelse.dart)

### Sintaxe Básica
```dart
if (condição) {
  // código executado se condição for verdadeira
} else {
  // código executado se condição for falsa
}
```
> ::warning: Importante:
> - A condição deve retornar um valor booleano (`true` ou `false`)
> - As chaves `{}` são obrigatórias quando há múltiplas instruções
> - Para uma única instrução, as chaves são opcionais
> - É possível encadear múltiplas condições com `else if`

### Operador Ternário
O operador ternário (`?:`) é uma forma concisa de escrever uma expressão if/else:
```dart
// Ao invés de:
String resultado;
if (idade >= 18) {
  resultado = 'adulto';
} else {
  resultado = 'menor';
}

// Você pode escrever:
String resultado = idade >= 18 ? 'adulto' : 'menor';
```

### Verificação de Nulidade
Dart 2.12+ incorpora o sistema de null safety, permitindo verificações de nulidade mais seguras:
```dart
String? nome; // O '?' indica que a variável pode ser nula
if (nome != null) {
  print('O nome tem ${nome.length} caracteres');
}

// Ou usando o operador '?.' (null-aware operator):
print('O nome tem ${nome?.length ?? 0} caracteres');
```

### Uso de If Aninhados
É possível aninhar estruturas if/else para lógicas mais complexas:
```dart
if (idade >= 18) {
  if (temCarteira) {
    print('Pode dirigir');
  } else {
    print('Precisa de carteira para dirigir');
  }
} else {
  print('Precisa ter 18 anos para dirigir');
}
```

> ::warning: Boas Práticas
> - Evite aninhar muitos níveis de if/else (mais de 3 níveis torna o código difícil de ler)
> - Para múltiplas condições relacionadas, considere usar switch/case
> - Use nomes de variáveis expressivos para tornar as condições mais legíveis

## 2. Switch/Case em Dart

A estrutura `switch/case` é ideal para comparar uma expressão com vários valores possíveis.

>:warning: Código de exemplo no arquivo [switchcase.dart](../assets/code/switchcase.dart)

### Sintaxe Básica
```dart
switch (expressão) {
  case valor1:
    // código para valor1
    break;
  case valor2:
    // código para valor2
    break;
  default:
    // código para quando nenhum caso corresponde
}
```

>::warning: Características Importantes
> - Em Dart, o `break` é obrigatório ao final de cada caso (exceto no último caso antes do default)
> - Sem o `break`, você recebe um erro em tempo de compilação (diferente de linguagens como C/Java)
> - Alternativamente, você pode usar `continue`, `return` ou lançar uma exceção
> - O caso `default` é opcional, mas recomendado

### Case Agrupados
Você pode agrupar múltiplos case para compartilhar o mesmo código:
```dart
switch (diaDaSemana) {
  case 'Segunda':
  case 'Terça':
  case 'Quarta':
  case 'Quinta':
  case 'Sexta':
    print('Dia útil');
    break;
  case 'Sábado':
  case 'Domingo':
    print('Final de semana');
    break;
}
```

### Usando com Enums
O switch é particularmente útil com enumerações:
```dart
enum Status { pendente, aprovado, rejeitado, emRevisao }

switch (status) {
  case Status.pendente:
    print('Aguardando análise');
    break;
  case Status.aprovado:
    print('Documento aprovado');
    break;
  case Status.rejeitado:
    print('Documento rejeitado');
    break;
  case Status.emRevisao:
    print('Em processo de revisão');
    break;
}
```

### Usando Continue com Labels
Você pode usar `continue` com labels para ir para outro caso:
```dart
switch (nota) {
  case 'A':
    print('Excelente!');
    break;
  case 'B':
    print('Muito bom!');
    continue aprovado;
  case 'C':
  aprovado:
    print('Aprovado');
    break;
  case 'F':
    print('Reprovado');
    break;
}
```

> :warning: Limitações e Quando Usar
> - Switch só funciona com tipos comparáveis (int, String, enum...)
> - Não funciona diretamente com comparações (>, <, >=, <=)
> - Ideal para quando você tem múltiplas condições baseadas em um único valor
> - Mais limpo que múltiplos if/else quando há mais de 3 condições

## 3. Loops em Dart

Loops permitem executar um bloco de código repetidamente. Dart oferece vários tipos de loops.

>:warning: Código de exemplo no arquivo [loops.dart](../assets/code/loops.dart)

### For Loop
O loop for tradicional é usado quando você sabe o número de iterações antecipadamente.

#### Sintaxe Básica
```dart
for (inicialização; condição; incremento) {
  // código a ser repetido
}
```

#### Exemplo Completo
```dart
for (int i = 0; i < 5; i++) {
  print('Iteração $i');
}
```

#### Partes do For Loop
- **Inicialização**: Executada uma vez antes do início do loop
- **Condição**: Avaliada antes de cada iteração; loop continua enquanto for verdadeira
- **Incremento**: Executado após cada iteração

### For-In Loop
Usado para iterar através de coleções (listas, conjuntos, mapas).

#### Sintaxe
```dart
for (var elemento in coleção) {
  // código que usa o elemento
}
```

#### Exemplos
```dart
// Com lista
List<String> nomes = ['Ana', 'Pedro', 'Maria'];
for (String nome in nomes) {
  print('Olá, $nome!');
}

// Com map
Map<String, int> idades = {'Ana': 23, 'Pedro': 35, 'Maria': 28};
for (var entrada in idades.entries) {
  print('${entrada.key} tem ${entrada.value} anos');
}
```

### While Loop
Executa um bloco de código enquanto uma condição é verdadeira, verificando a condição antes da execução.

#### Sintaxe
```dart
while (condição) {
  // código a ser repetido
}
```

#### Exemplo
```dart
int contador = 0;
while (contador < 5) {
  print('Contador: $contador');
  contador++;
}
```

### Do-While Loop
Similar ao while, mas garante que o bloco seja executado pelo menos uma vez, pois a condição é verificada após a execução.

#### Sintaxe
```dart
do {
  // código a ser repetido
} while (condição);
```

#### Exemplo
```dart
int contador = 0;
do {
  print('Contador: $contador');
  contador++;
} while (contador < 5);
```

#### Diferença entre While e Do-While
- **While**: Pode não executar nenhuma vez se a condição já for falsa inicialmente
- **Do-While**: Sempre executa pelo menos uma vez, independentemente da condição

### Métodos Funcionais de Iteração
Dart também oferece métodos funcionais para iteração em coleções:

```dart
// forEach
nomes.forEach((nome) => print('Olá, $nome!'));

// map - transforma cada elemento
List<String> nomesEmMaiusculo = nomes.map((nome) => nome.toUpperCase()).toList();

// where - filtra elementos
List<String> nomesCurtos = nomes.where((nome) => nome.length < 5).toList();

// Encadeamento de métodos
nomes
  .where((nome) => nome.startsWith('A'))
  .map((nome) => nome.toUpperCase())
  .forEach((nome) => print(nome));
```

### Escolhendo o Loop Correto
- **for**: Quando você conhece o número exato de iterações
- **for-in**: Para iterar em coleções de maneira simples
- **while**: Quando não sabe quantas iterações serão necessárias
- **do-while**: Quando precisa executar o código pelo menos uma vez
- **forEach/map/where**: Para operações funcionais em coleções

## 4. Break e Continue em Dart

As instruções `break` e `continue` permitem controlar o fluxo dentro de loops.

>:warning: Código de exemplo no arquivo [breakcontinue.dart](../assets/code/breakcontinue.dart)

### Break
A instrução `break` termina completamente o loop atual e passa o controle para a próxima instrução após o loop.

#### Usos Comuns
- Sair de um loop quando uma condição específica é encontrada
- Evitar processamento desnecessário após encontrar o que estava procurando
- Sair de um loop infinito (while(true))

#### Exemplos
```dart
// Encontrar o primeiro número divisível por 7
for (int i = 1; i <= 100; i++) {
  if (i % 7 == 0) {
    print('Primeiro número divisível por 7: $i');
    break; // Para o loop após encontrar
  }
}

// Loop infinito com condição de saída
int contador = 0;
while (true) {
  contador++;
  print(contador);
  if (contador >= 5) {
    break; // Sai do loop infinito
  }
}
```

### Continue
A instrução `continue` pula o restante do código no loop atual e vai direto para a próxima iteração.

#### Usos Comuns
- Pular elementos que não atendem a certas condições
- Evitar aninhamento excessivo de if/else dentro de loops
- Melhorar a legibilidade separando casos especiais

#### Exemplos
```dart
// Imprimir apenas números ímpares
for (int i = 0; i < 10; i++) {
  if (i % 2 == 0) {
    continue; // Pula números pares
  }
  print('Número ímpar: $i');
}

// Processa apenas strings não vazias
List<String> palavras = ['olá', '', 'mundo', '', 'dart'];
for (String palavra in palavras) {
  if (palavra.isEmpty) {
    continue;
  }
  print('Palavra: $palavra');
}
```

### Break e Continue com Labels
Para loops aninhados, você pode usar labels para especificar qual loop controlar:

```dart
outerLoop: for (int i = 0; i < 3; i++) {
  for (int j = 0; j < 3; j++) {
    if (i == 1 && j == 1) {
      print('Pulando para a próxima iteração do loop externo');
      continue outerLoop;
    }
    print('i = $i, j = $j');
  }
}
```

### Boas Práticas
- Use `break` e `continue` com moderação para não tornar o código difícil de entender
- Adicione comentários explicando por que está saindo ou pulando uma iteração
- Para lógicas complexas, considere extrair o código para uma função separada

## 5. Assert Statements em Dart

A instrução `assert` é uma ferramenta de desenvolvimento para verificar condições que devem ser verdadeiras.
>:warning: Código de exemplo no arquivo [assert.dart](../assets/code/asset.dart)

### Função Principal
Verificar se determinadas condições são atendidas durante o desenvolvimento, ajudando a identificar bugs precocemente.

### Sintaxe
```dart
assert(condição, 'mensagem opcional de erro');
```

### Comportamento
- Se a condição for verdadeira, nada acontece e o programa continua
- Se a condição for falsa, um `AssertionError` é lançado com a mensagem de erro fornecida
- Asserts são ignorados completamente em código de produção, não afetando o desempenho

### Ativando Asserts
- Em linha de comando: `dart --enable-asserts seu_arquivo.dart`
- No Flutter, asserts são habilitados automaticamente em modo debug
- Em produção, asserts são removidos durante a compilação

### Casos de Uso Comuns

#### 1. Verificação de Argumentos de Função
```dart
void processarDados(List<int> dados) {
  assert(dados != null, 'A lista de dados não pode ser nula');
  assert(dados.isNotEmpty, 'A lista de dados não pode estar vazia');
  
  // Processamento seguro pode continuar...
}
```

#### 2. Validação de Estado Interno
```dart
class Contador {
  int _valor = 0;
  
  void incrementar() {
    _valor++;
    assert(_valor > 0, 'O contador deve ser positivo após incremento');
  }
  
  void decrementar() {
    _valor--;
    assert(_valor >= 0, 'O contador não pode ser negativo');
  }
}
```

#### 3. Verificação de Pós-condições
```dart
int calcularRaizQuadrada(int valor) {
  assert(valor >= 0, 'Não é possível calcular raiz de número negativo');
  
  final resultado = sqrt(valor);
  
  // Verificar se o resultado está correto
  assert((resultado * resultado - valor).abs() < 0.001, 'Cálculo impreciso');
  
  return resultado.round();
}
```

#### 4. Verificações em Construtores
```dart
class Retangulo {
  final double largura;
  final double altura;
  
  Retangulo(this.largura, this.altura) {
    assert(largura > 0, 'Largura deve ser positiva');
    assert(altura > 0, 'Altura deve ser positiva');
  }
}
```

#### 5. Verificações Durante o Desenvolvimento
```dart
void main() {
  final config = carregarConfiguracao();
  assert(config.containsKey('apiKey'), 'Arquivo de configuração deve conter apiKey');
  
  // Resto do programa...
}
```

### Vantagens do Assert
- Documenta pressupostos e condições esperadas
- Falha rapidamente quando algo está errado (fail fast)
- Não adiciona overhead em produção
- Serve como documentação executável

### Limitações
- Não funciona em produção, então não substitui validações normais
- Não deve ser usado para tratamento de erros em tempo de execução
- Não deve verificar entradas do usuário (use if/else para isso)

### Alternativas para Produção
Quando você precisa de verificações em produção, use:
```dart
void processarDados(List<int> dados) {
  if (dados == null || dados.isEmpty) {
    throw ArgumentError('A lista de dados não pode ser nula ou vazia');
  }
  
  // Processamento seguro...
}
```





---
Vai para:
- [Sumário](https://github.com/claulis/flutter/blob/main/dart/README.md)
- [Próximo capítulo](../capitulos/colecoes.md)