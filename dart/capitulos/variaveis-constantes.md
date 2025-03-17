# Variáveis em Dart

> O código completo encontra-se no arquivo [variaveis.dart](../assets/code/variaveis.dart). 

## Declaração de variáveis

Em Dart, você pode declarar variáveis de várias maneiras, dependendo do contexto e das necessidades:

### Usando o tipo explícito

```dart
String nome = 'João';
int idade = 25;
double altura = 1.75;
bool ativo = true;
```

### Usando inferência de tipo com `var`

O Dart pode inferir automaticamente o tipo da variável baseado no valor atribuído:

```dart
var nome = 'João';      // infere String
var idade = 25;         // infere int
var altura = 1.75;      // infere double
var ativo = true;       // infere bool
```

### Declaração sem inicialização

Se você precisa declarar uma variável sem atribuir um valor inicial:

```dart
String nome;
int idade;

// Posteriormente no código
nome = 'João';
idade = 25;
```

### Variáveis dinâmicas com `dynamic`

Para variáveis que podem mudar de tipo durante a execução:

```dart
dynamic valor = 'texto';
valor = 42;      // agora valor é um int
valor = true;    // agora valor é um bool
```

## Tipos de variáveis

Dart é uma linguagem fortemente tipada que oferece diversos tipos de variáveis:

### Tipos básicos
- `int`: números inteiros
- `double`: números de ponto flutuante
- `String`: sequências de caracteres
- `bool`: valores booleanos (true/false)
- `dynamic`: pode armazenar qualquer tipo

### Coleções
- `List`: arrays/listas ordenadas
- `Set`: coleções não ordenadas de itens únicos
- `Map`: coleções de pares chave-valor

### Exemplos de coleções

```dart
// Lista (Array)
List<String> nomes = ['Ana', 'Carlos', 'Pedro'];
var numeros = <int>[1, 2, 3, 4, 5];

// Set
Set<String> frutas = {'maçã', 'banana', 'laranja'};
var numeros = <int>{1, 2, 3, 4, 5};

// Map
Map<String, int> idades = {
  'Ana': 25,
  'Carlos': 30,
  'Pedro': 22
};
var capitais = <String, String>{
  'Brasil': 'Brasília',
  'Japão': 'Tóquio',
  'França': 'Paris'
};
```

### Outros tipos importantes
- `Runes`: para representar caracteres Unicode
- `Symbol`: um operador ou identificador declarado em um programa Dart
- `Object`: o tipo base de todos os objetos Dart (exceto `null` em Dart não nulo)
- `Future` e `Stream`: para programação assíncrona

## Const vs Final

Ambas as palavras-chave `const` e `final` são usadas para declarar variáveis imutáveis, mas com diferenças importantes:

### Final

- O valor deve ser atribuído no momento da declaração ou no construtor
- O valor não pode ser alterado depois de atribuído
- O valor pode ser definido em tempo de execução

```dart
final String nome = 'João';
final agora = DateTime.now();  // Valor determinado em tempo de execução
```

### Const

- O valor deve ser constante e conhecido em tempo de compilação
- Usado para valores literais e imutáveis
- Não pode receber valores calculados em tempo de execução

```dart
const pi = 3.14159;
const double gravidade = 9.81;
const List<int> numeros = [1, 2, 3];  // Lista constante

// Erro: não compila porque DateTime.now() é avaliado em tempo de execução
// const agora = DateTime.now();
```

### Quando usar cada um

- Use `const` para valores que nunca mudarão e são conhecidos em tempo de compilação
- Use `final` para valores que são atribuídos apenas uma vez, mas podem ser determinados em tempo de execução

## Escopo de variáveis

O escopo de uma variável define onde ela pode ser acessada no código:

### Escopo global

Variáveis declaradas fora de qualquer função ou classe são globais e acessíveis em todo o arquivo:

```dart
String globalVar = 'Visível em todo o arquivo';

void main() {
  print(globalVar); // Acesso válido
}

void outraFuncao() {
  print(globalVar); // Acesso válido
}
```

### Escopo de função

Variáveis declaradas dentro de uma função só são visíveis dentro dela:

```dart
void main() {
  String localVar = 'Visível apenas dentro de main()';
  print(localVar); // Acesso válido
}

void outraFuncao() {
  // print(localVar); // Erro! localVar não é visível aqui
}
```

### Escopo de bloco

Variáveis declaradas dentro de um bloco de código (entre chaves `{}`) são visíveis apenas dentro desse bloco:

```dart
void main() {
  if (true) {
    String blocoVar = 'Visível apenas neste bloco if';
    print(blocoVar); // Acesso válido
  }
  // print(blocoVar); // Erro! blocoVar não é visível aqui
}
```

### Escopo de classe

Variáveis declaradas em uma classe (atributos) têm escopo definido pelos modificadores:

```dart
class Pessoa {
  String nome;       // Visível dentro da classe e classes derivadas
  int _idade;        // O prefixo _ torna a variável "privada" ao arquivo
  
  Pessoa(this.nome, this._idade);
}
```

## Naming conventions (Convenções de nomenclatura)

Dart segue convenções específicas para nomenclatura de variáveis:

### Regras gerais

- Use nomes descritivos que indiquem o propósito da variável
- Evite abreviações ambíguas
- Seja consistente com o estilo em todo o código

### Para variáveis e funções

- Use `lowerCamelCase`: primeira palavra em minúsculo, demais palavras com inicial maiúscula
- Exemplos: `nomeCompleto`, `calcularTotal()`, `idadeDoUsuario`

### Para constantes

- Use `lowerCamelCase` para constantes declaradas com `const` ou `final`
- Exemplos: `pi`, `valorMaximo`, `urlBase`

### Para classes, enums e typedefs

- Use `UpperCamelCase` (ou PascalCase): todas as palavras começam com letra maiúscula
- Exemplos: `Pessoa`, `ContaBancaria`, `StatusPedido`

### Para variáveis privadas

- Prefixe com underscore (`_`) para indicar que uma variável é privada ao arquivo/biblioteca
- Exemplos: `_senha`, `_contador`, `_valorInterno`

### Exemplos práticos

```dart
// Classes em UpperCamelCase
class ContaBancaria {
  // Variáveis privadas com prefixo _
  final String _numeroConta;
  double _saldo;
  
  // Constantes em lowerCamelCase
  static const double taxaAdministracao = 2.5;
  
  // Variáveis públicas em lowerCamelCase
  String nomeCorrentista;
  bool contaAtiva;
  
  // Construtor
  ContaBancaria(this._numeroConta, this.nomeCorrentista, this._saldo, this.contaAtiva);
  
  // Métodos em lowerCamelCase
  void depositar(double valor) {
    // Variável local em lowerCamelCase
    double valorComTaxa = valor - taxaAdministracao;
    _saldo += valorComTaxa;
  }
}

// Enum em UpperCamelCase
enum TipoConta { corrente, poupanca, salario, investimento }
```

---
Vai para:
- [Sumário](https://github.com/claulis/flutter/blob/main/dart/README.md)
- [Próximo capítulo](../capitulos/tipos-dados-basicos.md)