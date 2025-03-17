# Tipos Básicos em Dart

## Números (int, double)
> Arquivo do código completo em [numeros.dart](../assets/code/numeros.dart)

Dart possui dois tipos principais para representar números:

### int

O tipo `int` representa números inteiros sem casas decimais. Em Dart, os inteiros têm precisão arbitrária, o que significa que podem representar valores de qualquer tamanho (limitado apenas pela memória disponível).

```dart
// Declaração de inteiros
int idade = 25;
int populacao = 7800000000;
int negativo = -42;

// Operações com inteiros
int soma = 5 + 3;         // 8
int subtracao = 10 - 4;   // 6
int multiplicacao = 3 * 7; // 21
int divisaoInteira = 7 ~/ 2; // 3 (divisão com resultado inteiro usando ~/)
int resto = 7 % 3;        // 1 (resto da divisão)

// Valores máximos e mínimos
int valorMaximo = 9007199254740991; // Em algumas plataformas
```

### double

O tipo `double` representa números de ponto flutuante, ou seja, números com casas decimais. Dart usa o formato IEEE 754 de 64 bits para representar valores double.

```dart
// Declaração de doubles
double altura = 1.75;
double preco = 19.99;
double temperatura = -5.3;
double notacao = 1.2e3;   // 1200.0 (notação científica)

// Operações com doubles
double soma = 5.5 + 3.2;         // 8.7
double subtracao = 10.7 - 4.2;   // 6.5
double multiplicacao = 3.5 * 2;  // 7.0
double divisao = 7 / 2;          // 3.5 (divisão normal retorna double)

// Constantes especiais
double infinito = double.infinity;
double naoNumero = double.nan;  // Not a Number
```

### Operações matemáticas

Dart fornece diversos operadores e funções matemáticas:

```dart
import 'dart:math';

void main() {
  // Valor absoluto
  int absoluto = -5.abs();    // 5
  
  // Arredondamento
  double d = 3.7;
  int arredondado = d.round();  // 4
  int paraBaixo = d.floor();    // 3
  int paraCima = d.ceil();      // 4
  
  // Potenciação e raiz quadrada
  double potencia = pow(2, 3) as double;  // 8.0 (2³)
  double raiz = sqrt(16);        // 4.0
  
  // Máximo e mínimo
  int maximo = max(5, 10);      // 10
  int minimo = min(5, 10);      // 5
  
  // Trigonometria
  double seno = sin(pi / 2);    // 1.0
  double cosseno = cos(pi);     // -1.0
}
```

## Strings

Strings em Dart são sequências de caracteres Unicode UTF-16. Podem ser definidas usando aspas simples ou duplas.

> Arquivo do código completo em [strings.dart](../assets/code/strings.dart)

### Declaração de strings

```dart
// Declaração com aspas simples ou duplas
String nome = 'Maria';
String sobrenome = "Silva";

// Strings multilinhas com três aspas
String paragrafo = '''
Este é um texto
que ocupa várias linhas
no código fonte.
''';

String outroParagrafo = """
Este também é um texto
multilinha usando aspas duplas.
""";

// String crua (raw) com prefixo r - ignora caracteres de escape
String caminho = r'C:\Users\Nome\Documentos';  // Não interpreta \U como escape
```

### Concatenação e interpolação

```dart
// Concatenação com operador +
String nomeCompleto = nome + ' ' + sobrenome;  // "Maria Silva"

// Interpolação com $variavel ou ${expressão}
String apresentacao = 'Olá, meu nome é $nome $sobrenome!';
int idade = 30;
String info = 'Em 5 anos, terei ${idade + 5} anos.';

// Concatenação de múltiplas strings
String endereco = 'Rua das Flores, '
    'nº 123, '
    'Centro';  // "Rua das Flores, nº 123, Centro"
```

### Operações com strings

```dart
String texto = 'Dart é uma linguagem incrível!';

// Comprimento
int tamanho = texto.length;  // 32

// Verificações
bool comecaCom = texto.startsWith('Dart');  // true
bool terminaCom = texto.endsWith('!');      // true
bool contem = texto.contains('linguagem');  // true

// Manipulação
String maiusculas = texto.toUpperCase();  // "DART É UMA LINGUAGEM INCRÍVEL!"
String minusculas = texto.toLowerCase();  // "dart é uma linguagem incrível!"
String substituir = texto.replaceAll('incrível', 'fantástica');  // "Dart é uma linguagem fantástica!"

// Divisão
List<String> palavras = texto.split(' ');  // ["Dart", "é", "uma", "linguagem", "incrível!"]

// Substrings
String parte = texto.substring(0, 4);  // "Dart"

// Remoção de espaços em branco
String comEspacos = '   texto com espaços   ';
String semEspacos = comEspacos.trim();         // "texto com espaços"
String semEspacosInicio = comEspacos.trimLeft();  // "texto com espaços   "
String semEspacosFim = comEspacos.trimRight();    // "   texto com espaços"
```

## Booleanos

O tipo `bool` em Dart representa valores booleanos que podem ser `true` (verdadeiro) ou `false` (falso).

> Arquivo do código completo em [booleanos.dart](../assets/code/booleanos.dart)

### Declaração e operações básicas

```dart
// Declaração de booleanos
bool ativo = true;
bool visivel = false;

// Operador de negação (!)
bool inativo = !ativo;  // false

// Operadores lógicos
bool resultado1 = ativo && visivel;  // AND lógico: true E false = false
bool resultado2 = ativo || visivel;  // OR lógico: true OU false = true

// Operadores de igualdade e comparação
bool igual = (5 == 5);        // true
bool diferente = (5 != 10);   // true
bool maior = (10 > 5);        // true
bool menor = (5 < 10);        // true
bool maiorOuIgual = (5 >= 5); // true
bool menorOuIgual = (5 <= 10);// true
```

### Expressões condicionais com booleanos

```dart
void main() {
  bool temPermissao = true;
  bool ehAdministrador = false;
  
  // If/else com booleanos
  if (temPermissao && ehAdministrador) {
    print('Acesso total concedido');
  } else if (temPermissao) {
    print('Acesso limitado concedido');
  } else {
    print('Acesso negado');
  }
  
  // Operador ternário
  String mensagem = temPermissao ? 'Tem permissão' : 'Não tem permissão';
  
  // Comparações em cascata
  String nivel = ehAdministrador ? 'Admin' : (temPermissao ? 'Usuário' : 'Visitante');
}
```

## Dynamic e var

Dart oferece duas formas de declarar variáveis sem especificar explicitamente o tipo: `dynamic` e `var`.

### var - Inferência de tipo

Com `var`, o tipo é inferido no momento da atribuição e não muda depois:

```dart
// O tipo é inferido na atribuição
var nome = 'Carlos';  // inferido como String
var idade = 30;       // inferido como int
var altura = 1.75;    // inferido como double
var ativo = true;     // inferido como bool

// Depois da inferência, o tipo é fixo
nome = 'Maria';       // OK, continua sendo String
// idade = 'trinta';  // ERRO: não pode atribuir String a int
```

### dynamic - Tipo dinâmico

Com `dynamic`, a variável pode mudar de tipo durante a execução:

```dart
// Tipo dinâmico que pode mudar
dynamic valor = 'texto';
print(valor.runtimeType);  // String

valor = 42;
print(valor.runtimeType);  // int

valor = true;
print(valor.runtimeType);  // bool

// Com dynamic, métodos e propriedades são resolvidos em tempo de execução
dynamic texto = 'Olá';
print(texto.length);   // 3, funciona
texto = 42;
// print(texto.length); // ERRO em tempo de execução, int não tem propriedade length
```

### Quando usar cada um

- Use `var` quando quiser inferência de tipo, mas sem perder a segurança de tipos
- Use `dynamic` apenas quando realmente precisar de uma variável que mude de tipo
- Como regra geral, prefira `var` a menos que tenha um motivo específico para usar `dynamic`

## Conversão entre tipos

Dart oferece diversas formas de converter entre tipos de dados:

### Conversão entre tipos numéricos

```dart
// De int para double
int i = 42;
double d = i.toDouble();  // 42.0

// De double para int
double pi = 3.14159;
int iPi = pi.toInt();     // 3 (trunca a parte decimal)
int iPiArredondado = pi.round();  // 3 (arredonda para o inteiro mais próximo)

// Usando parse
int numero = int.parse('42');    // String para int
double valor = double.parse('3.14');  // String para double

// Tratando erros de parse
try {
  int invalido = int.parse('abc');
} catch (e) {
  print('Erro na conversão: $e');
}

// Usando tryParse (retorna null se falhar)
int? numeroOuNull = int.tryParse('42');    // 42
int? invalido = int.tryParse('abc');       // null
```

### Conversão para String

```dart
// Qualquer tipo para String
int numero = 42;
String sNumero = numero.toString();  // "42"

double pi = 3.14159;
String sPi = pi.toString();          // "3.14159"

bool flag = true;
String sFlag = flag.toString();      // "true"

// Formatando números
double preco = 19.99;
String sPreco = preco.toStringAsFixed(1);  // "20.0" (1 casa decimal)

int grande = 1000000;
String sGrande = grande.toString();      // "1000000"
```

### Conversão de String para outros tipos

```dart
// String para bool
String textoVerdadeiro = 'true';
bool valor = textoVerdadeiro.toLowerCase() == 'true';  // true

// String para DateTime
DateTime data = DateTime.parse('2023-12-31');  // 31 de dezembro de 2023
```

### Conversão entre coleções

```dart
// Lista para Set (remove duplicatas)
List<int> listaComDuplicatas = [1, 2, 3, 2, 1];
Set<int> conjunto = listaComDuplicatas.toSet();  // {1, 2, 3}

// Set para Lista
List<int> listaSemDuplicatas = conjunto.toList();  // [1, 2, 3]

// Lista/Set para Map
List<String> chaves = ['nome', 'idade'];
List<dynamic> valores = ['João', 30];
Map<String, dynamic> mapa = Map.fromIterables(chaves, valores);  // {nome: João, idade: 30}
```

### Exemplo completo de conversões

```dart
void main() {
  // String para número
  String numeroTexto = '42';
  int numero = int.parse(numeroTexto);
  double numeroDouble = double.parse('3.14');
  
  // Número para String com formatação
  double valor = 1234.5678;
  String valorFormatado = valor.toStringAsFixed(2);  // "1234.57"
  
  // Entre tipos numéricos
  int inteiro = 42;
  double flutuante = inteiro.toDouble();  // 42.0
  
  double pi = 3.14159;
  int piInteiro = pi.toInt();  // 3
  
  // Conversão segura com tryParse
  int? seguro = int.tryParse('abc');  // null
  if (seguro == null) {
    print('Conversão falhou');
  }
  
  // Conversão de booleano
  String textoBooleano = 'false';
  bool booleano = textoBooleano.toLowerCase() == 'true';  // false
  
  // Demonstração da importância da conversão de tipos
  String a = '10';
  String b = '20';
  print(a + b);  // "1020" (concatenação de strings)
  
  print(int.parse(a) + int.parse(b));  // 30 (soma de inteiros)
}
```

---
Vai para:
- [Sumário](https://github.com/claulis/flutter/blob/main/dart/README.md)
- [Próximo capítulo](../capitulos/operadores.md)