# Classes e Objetos

## Definição de Classes

Em Dart, uma classe é um modelo ou blueprint que define as propriedades e comportamentos de um tipo de objeto. As classes são fundamentais para programação orientada a objetos (POO) e permitem encapsular dados e funcionalidades relacionadas.

Uma classe em Dart é definida usando a palavra-chave `class` seguida pelo nome da classe (geralmente em PascalCase) e um par de chaves que contém os membros da classe.

```dart
class Pessoa {
  // Propriedades (atributos)
  String nome;
  int idade;
  
  // Métodos
  void apresentar() {
    print('Olá, meu nome é $nome e tenho $idade anos.');
  }
}
```

## Criação de Objetos

Um objeto é uma instância de uma classe. Para criar um objeto em Dart, você usa a palavra-chave `new` (opcional desde Dart 2) seguida pelo nome da classe e parênteses, que podem incluir argumentos para o construtor.

```dart
void main() {
  // Criando um objeto da classe Pessoa
  Pessoa pessoa1 = Pessoa();
  
  // Atribuindo valores às propriedades
  pessoa1.nome = 'Maria';
  pessoa1.idade = 30;
  
  // Chamando um método
  pessoa1.apresentar();  // Saída: Olá, meu nome é Maria e tenho 30 anos.
  
  // Criando outro objeto
  var pessoa2 = Pessoa();
  pessoa2.nome = 'João';
  pessoa2.idade = 25;
  pessoa2.apresentar();  // Saída: Olá, meu nome é João e tenho 25 anos.
}
```

>:warning: Código de exemplo no arquivo [class.dart](../assets/code/class.dart) e [object.dart](../assets/code/object.dart)

## Construtores

Os construtores são métodos especiais usados para inicializar objetos. Em Dart, existem vários tipos de construtores:

### Construtor Padrão

Se você não definir um construtor, Dart fornece um construtor padrão sem argumentos.

```dart
class Pessoa {
  String nome;
  int idade;
  
  // Este construtor é implícito se não for declarado
  // Pessoa();
}
```

### Construtor Nomeado

```dart
class Pessoa {
  String nome;
  int idade;
  
  // Construtor padrão
  Pessoa(this.nome, this.idade);
  
  // Construtor nomeado
  Pessoa.semIdade(this.nome) : idade = 0;
  
  // Outro construtor nomeado
  Pessoa.padrao() : nome = 'Sem nome', idade = 0;
}
```

### Construtor com Lista de Inicialização

```dart
class Retangulo {
  final double largura;
  final double altura;
  final double area;
  
  // Construtor com lista de inicialização
  Retangulo(this.largura, this.altura) : area = largura * altura;
}
```

### Construtor de Fábrica (Factory Constructor)

```dart
class Ponto {
  final double x;
  final double y;
  
  // Construtor normal
  Ponto(this.x, this.y);
  
  // Construtor de fábrica
  factory Ponto.origem() {
    return Ponto(0, 0);
  }
  
  factory Ponto.fromJson(Map<String, double> json) {
    return Ponto(json['x'] ?? 0, json['y'] ?? 0);
  }
}
```

>:warning: Código de exemplo no arquivo [constructor.dart](../assets/code/constructor.dart)

## Propriedades e Métodos

### Propriedades

As propriedades (ou atributos) são variáveis associadas a uma classe. Em Dart, as propriedades podem ser:

- **Públicas**: acessíveis de qualquer lugar (padrão em Dart)
- **Privadas**: iniciadas com underscore (_) e só acessíveis dentro da biblioteca

```dart
class Conta {
  // Propriedade pública
  String titular;
  
  // Propriedade privada
  double _saldo;
  
  Conta(this.titular, this._saldo);
  
  void depositar(double valor) {
    if (valor > 0) {
      _saldo += valor;
    }
  }
  
  bool sacar(double valor) {
    if (_saldo >= valor && valor > 0) {
      _saldo -= valor;
      return true;
    }
    return false;
  }
  
  double consultarSaldo() {
    return _saldo;
  }
}
```

### Métodos

Métodos são funções definidas dentro de uma classe que representam comportamentos dos objetos. Podem ser:

- **Métodos de instância**: operam em uma instância específica da classe
- **Métodos estáticos**: pertencem à classe, não a instâncias

```dart
class Calculadora {
  // Método de instância
  double somar(double a, double b) {
    return a + b;
  }
  
  // Método privado
  double _subtrair(double a, double b) {
    return a - b;
  }
  
  // Método que usa outro método
  double somarEMultiplicar(double a, double b, double fator) {
    double soma = somar(a, b);
    return soma * fator;
  }
}
```
>:warning: Código de exemplo no arquivo [propiedades_metodos.dart](../assets/code/propiedades_metodos.dart)

## Getters e Setters

Getters e setters são métodos especiais que permitem controlar o acesso às propriedades de um objeto. Eles são úteis para validação de dados e encapsulamento.

```dart
class Temperatura {
  double _celsius;
  
  Temperatura(this._celsius);
  
  // Getter para celsius
  double get celsius => _celsius;
  
  // Setter para celsius com validação
  set celsius(double valor) {
    if (valor >= -273.15) {  // Validação: não pode ser menor que o zero absoluto
      _celsius = valor;
    } else {
      throw Exception('Temperatura abaixo do zero absoluto não é possível.');
    }
  }
  
  // Getter para temperatura em Fahrenheit
  double get fahrenheit => _celsius * 9/5 + 32;
  
  // Setter para temperatura em Fahrenheit
  set fahrenheit(double valor) {
    _celsius = (valor - 32) * 5/9;
  }
}
```
>:warning: Código de exemplo no arquivo [getters_setters.dart](../assets/code/getters_setters.dart)

## Static Members (Membros Estáticos)

Membros estáticos (propriedades e métodos) pertencem à classe, não a instâncias individuais. São úteis para constantes e utilitários compartilhados.

```dart
class MathUtils {
  // Propriedade estática
  static const double PI = 3.14159265359;
  
  // Método estático
  static double calcularAreaCirculo(double raio) {
    return PI * raio * raio;
  }
  
  static double calcularPerimetroCirculo(double raio) {
    return 2 * PI * raio;
  }
}

// Uso:
// double area = MathUtils.calcularAreaCirculo(5);
```
>:warning: Código de exemplo no arquivo [static.dart](../assets/code/static.dart)

## Boas Práticas

1. **Nomes Significativos**: Use nomes claros e descritivos para suas classes e métodos.
   - Classes em PascalCase: `Pessoa`, `ContaBancaria`
   - Métodos e propriedades em camelCase: `calcularSalario()`, `nomeCompleto`

2. **Encapsulamento**: Use propriedades privadas (com _) para proteger o estado interno:
   ```dart
   class Pessoa {
     String _nome;  // Privado
     
     String get nome => _nome;
     set nome(String valor) => _nome = valor;
   }
   ```

3. **Classes Imutáveis**: Considere usar campos `final` para criar objetos imutáveis:
   ```dart
   class Ponto {
     final double x;
     final double y;
     
     const Ponto(this.x, this.y);  // Construtor const para objetos imutáveis
   }
   ```

4. **Construtores Nomeados**: Use construtores nomeados para deixar o código mais legível:
   ```dart
   class Usuario {
     // Em vez de ter múltiplos construtores confusos
     // Usuario(String email, String senha);
     // Usuario(String telefone, String senha);
     
     // Use construtores nomeados
     Usuario.comEmail(String email, String senha);
     Usuario.comTelefone(String telefone, String senha);
   }
   ```

5. **Inicialização Adequada**: Inicialize todos os campos não-nulos:
   ```dart
   class Produto {
     final String nome;
     final double preco;
     
     Produto(this.nome, this.preco) {
       // Validação na inicialização
       if (preco < 0) throw ArgumentError('Preço não pode ser negativo');
     }
   }
   ```

6. **Interface vs Implementação**: Separe interface da implementação usando classes abstratas:
   ```dart
   abstract class Forma {
     double calcularArea();
   }
   
   class Retangulo implements Forma {
     final double largura;
     final double altura;
     
     Retangulo(this.largura, this.altura);
     
     @override
     double calcularArea() => largura * altura;
   }
   ```

7. **Princípio da Responsabilidade Única**: Cada classe deve ter uma única responsabilidade:
   ```dart
   // Ruim: Uma classe fazendo muitas coisas
   class UsuarioGerenciador {
     void autenticar() {}
     void salvarNoDatabase() {}
     void enviarEmail() {}
   }
   
   // Melhor: Classes separadas com responsabilidades únicas
   class AutenticadorUsuario { void autenticar() {} }
   class RepositorioUsuario { void salvar() {} }
   class ServicoEmail { void enviar() {} }
   ```

---
Vai para:
- [Sumário](https://github.com/claulis/flutter/blob/main/dart/README.md)
- [Próximo capítulo](../capitulos/poo-heranca-polimorfismo.md)