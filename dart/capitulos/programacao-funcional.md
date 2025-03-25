# Programação Funcional 

A programação funcional é um paradigma de programação que trata a computação como uma avaliação de funções matemáticas, evitando mudanças de estado e dados mutáveis. Em Dart, podemos aplicar diversos conceitos de programação funcional para criar código mais previsível, testável e conciso.

## 1. Funções Puras

### O que são Funções Puras?

Funções puras são funções que possuem duas características fundamentais:
1. Dado o mesmo conjunto de argumentos, sempre retornam o mesmo resultado
2. Não causam efeitos colaterais externos

#### Exemplo de Função Pura
```dart
// Função pura - sempre retorna o mesmo resultado para os mesmos inputs
int multiplicar(int a, int b) {
  return a * b;
}

// Função impura - resultado pode variar
int contadorGlobal = 0;
int incrementarContador(int valor) {
  contadorGlobal++; // Efeito colateral
  return valor + contadorGlobal;
}
```

### Benefícios das Funções Puras
- Previsibilidade
- Facilidade de teste
- Maior facilidade de refatoração
- Melhor paralelismo

>:warning: Código de exemplo no arquivo [pure_func.dart](../assets/code/pure_func.dart)


## 2. Funções de Alta Ordem

Funções de alta ordem são funções que podem:
- Receber outras funções como argumentos
- Retornar funções como resultado

### Exemplos de Funções de Alta Ordem
```dart
// Função que recebe outra função como parâmetro
void executarOperacao(int a, int b, int Function(int, int) operacao) {
  print('Resultado: ${operacao(a, b)}');
}

// Função que retorna outra função
Function(int) criarMultiplicador(int multiplicador) {
  return (int numero) => numero * multiplicador;
}
```
>:warning: Código de exemplo no arquivo [high_order_func.dart](../assets/code/high_order_func.dart)


## 3. Operações Funcionais: Map, Filter, Reduce

### Map
Transforma cada elemento de uma coleção aplicando uma função.

```dart
List<int> numeros = [1, 2, 3, 4, 5];
List<int> quadrados = numeros.map((numero) => numero * numero).toList();
```

### Filter
Filtra elementos de uma coleção baseado em uma condição.

```dart
List<int> numeros = [1, 2, 3, 4, 5, 6];
List<int> pares = numeros.where((numero) => numero % 2 == 0).toList();
```

### Reduce
Reduz uma coleção a um único valor aplicando uma função cumulativa.

```dart
List<int> numeros = [1, 2, 3, 4, 5];
int soma = numeros.reduce((atual, proximo) => atual + proximo);
```
>:warning: Código de exemplo no arquivo [op_func.dart](../assets/code/op_func.dart)

## 4. Imutabilidade em Dart

Imutabilidade significa que, após um objeto ser criado, seu estado não pode ser alterado.

### Técnicas para Garantir Imutabilidade
1. Usar `final` e `const`
2. Criar objetos imutáveis
3. Utilizar métodos que retornam novas instâncias

```dart
// Classe imutável
class Pessoa {
  final String nome;
  final int idade;

  const Pessoa(this.nome, this.idade);

  // Método que retorna nova instância
  Pessoa comNovaIdade(int novaIdade) {
    return Pessoa(nome, novaIdade);
  }
}
```

### Vantagens da Imutabilidade
- Prevenção de efeitos colaterais
- Facilita concorrência
- Melhora a previsibilidade do código
- Simplifica depuração

>:warning: Código de exemplo no arquivo [immutability.dart](../assets/code/immutabilty.dart)

---
Vai para:
- [Sumário](https://github.com/claulis/flutter/blob/main/dart/README.md)
- [Próximo capítulo](../capitulos/manipulacao-eventos.md)