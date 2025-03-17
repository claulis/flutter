# Operadores em Dart

## Operadores Aritméticos

> O código completo encontra-se no arquivo [op_aritmeticos.dart](../assets/code/op_aritmeticos.dart). 

```dart
// Adição
int soma = 5 + 3;  // 8

// Subtração
int diferenca = 10 - 4;  // 6

// Multiplicação
int produto = 3 * 4;  // 12

// Divisão (retorna double)
double quociente = 10 / 3;  // 3.3333...

// Divisão inteira
int divisaoInteira = 10 ~/ 3;  // 3

// Módulo (resto da divisão)
int resto = 10 % 3;  // 1

// Incremento
int a = 5;
a++;  // a = 6 (pós-incremento)
++a;  // a = 7 (pré-incremento)

// Decremento
int b = 5;
b--;  // b = 4 (pós-decremento)
--b;  // b = 3 (pré-decremento)
```

## Operadores de Atribuição

> O código completo encontra-se no arquivo [op_atribuicao.dart](../assets/code/op_atribuicao.dart). 

```dart
// Atribuição simples
int x = 10;

// Atribuição com operação
x += 5;  // x = x + 5 (x = 15)
x -= 3;  // x = x - 3 (x = 12)
x *= 2;  // x = x * 2 (x = 24)
x /= 6;  // x = x / 6 (x = 4.0) - Note que x se torna double
x ~/= 2;  // x = x ~/ 2 (x = 2) - Divisão inteira
x %= 3;  // x = x % 3 (x = 2) - Resto da divisão

// Atribuição condicional
var y = null;
y ??= 10;  // y = 10 (atribui apenas se y for null)
```

## Operadores de Comparação

> O código completo encontra-se no arquivo [op_comparacao.dart](../assets/code/op_comparacao.dart). 

```dart
int a = 5;
int b = 10;

bool igual = a == b;  // false
bool diferente = a != b;  // true
bool maior = a > b;  // false
bool menor = a < b;  // true
bool maiorOuIgual = a >= b;  // false
bool menorOuIgual = a <= b;  // true
```

## Operadores Lógicos

> O código completo encontra-se no arquivo [op_logicos.dart](../assets/code/op_logicos.dart). 

```dart
bool x = true;
bool y = false;

// E lógico (AND)
bool and = x && y;  // false

// OU lógico (OR)
bool or = x || y;  // true

// NÃO lógico (NOT)
bool not = !x;  // false

// Exemplo de uso em condições
if (x && !y) {
  print("x é verdadeiro E y é falso");
}
```

## Operadores Bitwise

> O código completo encontra-se no arquivo [op_bitwise.dart](../assets/code/op_bitwise.dart). 

```dart
int a = 5;  // 101 em binário
int b = 3;  // 011 em binário

// AND bitwise
int bitwiseAnd = a & b;  // 001 = 1

// OR bitwise
int bitwiseOr = a | b;  // 111 = 7

// XOR bitwise
int bitwiseXor = a ^ b;  // 110 = 6

// NOT bitwise (complemento de um)
int bitwiseNot = ~a;  // -6 (dependendo do número de bits)

// Deslocamento à esquerda
int leftShift = a << 1;  // 1010 = 10

// Deslocamento à direita
int rightShift = a >> 1;  // 010 = 2
```

## Cascade Operator (..)

> O código completo encontra-se no arquivo [op_cascade.dart](../assets/code/op_cascade.dart). 

O operador cascade (..) permite realizar várias operações em um mesmo objeto sem precisar referenciá-lo várias vezes:

```dart
class Pessoa {
  String nome;
  int idade;
  
  Pessoa(this.nome, this.idade);
  
  void apresentar() {
    print("Meu nome é $nome e tenho $idade anos.");
  }
  
  void fazerAniversario() {
    idade++;
    print("Agora tenho $idade anos!");
  }
}

void main() {
  // Sem cascade operator
  Pessoa p1 = Pessoa("Ana", 25);
  p1.apresentar();
  p1.fazerAniversario();
  
  // Com cascade operator
  Pessoa p2 = Pessoa("João", 30)
    ..apresentar()
    ..fazerAniversario();
    
  // Também pode ser usado com atribuições
  Pessoa p3 = Pessoa("Maria", 40)
    ..nome = "Maria Silva"
    ..idade = 41
    ..apresentar();
}
```

O cascade operator é particularmente útil quando você está trabalhando com widgets no Flutter, permitindo encadear múltiplas configurações de forma mais limpa e legível.

---
Vai para:
- [Sumário](https://github.com/claulis/flutter/blob/main/dart/README.md)
- [Próximo capítulo](../capitulos/estruturas-controle.md)