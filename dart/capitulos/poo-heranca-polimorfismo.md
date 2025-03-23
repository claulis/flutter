# Herança e Polimorfismo

## 1. Herança 

A herança é um dos pilares fundamentais da programação orientada a objetos, permitindo que uma classe (chamada subclasse ou classe filha) herde características e comportamentos de outra classe (chamada superclasse ou classe pai). Em Dart, a herança é implementada através da palavra-chave `extends`.

A herança proporciona várias vantagens ao programador:

- **Reutilização de código**: evita a duplicação de código ao compartilhar funcionalidades comuns entre classes
- **Organização hierárquica**: permite modelar relações naturais do tipo "é um" entre objetos
- **Base para o polimorfismo**: possibilita tratar objetos de diferentes classes de maneira uniforme

### Sintaxe de Herança em Dart

Em Dart, a herança é implementada de maneira simples e direta:

```dart
class Animal {
  String nome;
  
  Animal(this.nome);
  
  void emitirSom() {
    print('Som genérico de animal');
  }
  
  void mover() {
    print('$nome está se movendo');
  }
}

class Cachorro extends Animal {
  Cachorro(String nome) : super(nome);
  
  @override
  void emitirSom() {
    print('$nome está latindo: Au au!');
  }
}
```

No exemplo acima, `Cachorro` é uma subclasse que herda de `Animal`. Todo `Cachorro` é um `Animal` e, portanto, herda as propriedades e métodos da classe `Animal`.

### Regras de Herança em Dart

Dart implementa um sistema de herança única, o que significa que:

1. Uma classe pode herdar de apenas uma única superclasse
2. Todas as classes derivam implicitamente da classe `Object` (a classe base para todas as classes em Dart)
3. Uma classe pode implementar múltiplas interfaces (usando a palavra-chave `implements`)
4. Uma classe pode estender outra classe e, simultaneamente, implementar várias interfaces

É importante notar que Dart não permite herança múltipla direta, diferente de linguagens como C++, mas oferece alternativas como o uso de mixins e interfaces.

>:warning: Código de exemplo no arquivo [heranca.dart](../assets/code/heranca.dart)

## 2. Extensão de Classes

Quando falamos sobre extensão de classes em Dart, estamos nos referindo ao mecanismo de herança que permite que uma classe (subclasse) estenda outra classe (superclasse). Esta extensão permite que a subclasse herde todos os atributos e métodos não privados da superclasse.

### Acesso a Membros Herdados

Ao estender uma classe, a subclasse tem acesso a:

- Atributos públicos e protegidos (em Dart, atributos começando com `_` são considerados privados à biblioteca, não à classe)
- Métodos públicos e protegidos
- Construtores, através do operador `super`

```dart
class Veiculo {
  String marca;
  String modelo;
  int ano;
  
  Veiculo(this.marca, this.modelo, this.ano);
  
  void exibirInformacoes() {
    print('$marca $modelo, ano $ano');
  }
}

class Carro extends Veiculo {
  int numeroDePortas;
  
  // Construtor que chama o construtor da superclasse
  Carro(String marca, String modelo, int ano, this.numeroDePortas) 
      : super(marca, modelo, ano);
  
  // Método que utiliza um método herdado
  void descricaoCompleta() {
    exibirInformacoes();  // Usando método herdado
    print('Número de portas: $numeroDePortas');
  }
}
```

### Extensão de Classes Abstratas

Em Dart, podemos estender classes abstratas, que são classes que não podem ser instanciadas diretamente e podem conter métodos sem implementação. Classes abstratas são definidas com a palavra-chave `abstract`.

```dart
abstract class Forma {
  // Método abstrato (sem implementação)
  double calcularArea();
  
  // Método concreto com implementação
  void exibirArea() {
    print('Área: ${calcularArea()}');
  }
}

class Circulo extends Forma {
  double raio;
  
  Circulo(this.raio);
  
  @override
  double calcularArea() {
    return 3.14 * raio * raio;
  }
}
```

Neste exemplo, `Circulo` estende a classe abstrata `Forma` e deve fornecer uma implementação para o método abstrato `calcularArea()`.

## 3. Sobrescrita de Métodos

A sobrescrita de métodos (method overriding) é uma característica poderosa da herança que permite que uma subclasse forneça uma implementação específica para um método já definido na superclasse. Isso possibilita que diferentes subclasses se comportem de maneiras distintas quando o mesmo método é chamado.

### Anotação @override

Em Dart, é uma boa prática utilizar a anotação `@override` quando sobrescrevemos um método. Esta anotação não é obrigatória, mas serve para:

1. Melhorar a legibilidade do código
2. Verificar em tempo de compilação se o método está realmente sobrescrevendo um método da superclasse
3. Documentar claramente a intenção do programador

```dart
class Animal {
  void fazerSom() {
    print('Som genérico de animal');
  }
}

class Gato extends Animal {
  @override
  void fazerSom() {
    print('Miau!');
  }
}

class Cachorro extends Animal {
  @override
  void fazerSom() {
    print('Au au!');
  }
}
```

### Regras para Sobrescrita de Métodos

Ao sobrescrever métodos em Dart, é necessário seguir algumas regras:

1. O método na subclasse deve ter o mesmo nome que o método na superclasse
2. O método na subclasse deve ter a mesma assinatura (tipos de parâmetros) que o método na superclasse
3. O tipo de retorno do método na subclasse deve ser o mesmo ou um subtipo do tipo de retorno do método na superclasse (covariância de retorno)
4. O método na subclasse não pode ser menos acessível que o método na superclasse

### Sobrescrita de Getters e Setters

Em Dart, também é possível sobrescrever getters e setters:

```dart
class Produto {
  double _preco;
  
  Produto(this._preco);
  
  double get preco => _preco;
  
  set preco(double valor) {
    if (valor >= 0) {
      _preco = valor;
    }
  }
}

class ProdutoImportado extends Produto {
  double taxaImportacao;
  
  ProdutoImportado(double preco, this.taxaImportacao) : super(preco);
  
  @override
  double get preco => super.preco * (1 + taxaImportacao);
}
```

No exemplo acima, a classe `ProdutoImportado` sobrescreve o getter `preco` para incluir a taxa de importação no cálculo do preço.

>:warning: Código de exemplo no arquivo [override.dart](../assets/code/override.dart.dart)

## 4. Polimorfismo

Polimorfismo é a capacidade de objetos de classes diferentes responderem ao mesmo método ou propriedade de maneiras distintas. Em termos simples, é a habilidade de tratar objetos de classes derivadas como objetos da classe base.

### Tipos de Polimorfismo em Dart

Dart suporta dois tipos principais de polimorfismo:

1. **Polimorfismo de Subtipo (Run-time)**: baseado na herança, permite que uma referência de tipo superclasse aponte para um objeto de uma subclasse
2. **Polimorfismo Paramétrico (Compile-time)**: implementado através de genéricos, permite criar classes e métodos que operem sobre tipos não especificados

### Polimorfismo de Subtipo em Ação

O polimorfismo de subtipo é amplamente utilizado e é uma consequência direta da herança:

```dart
void cuidarDeAnimal(Animal animal) {
  print('Cuidando de ${animal.nome}');
  animal.emitirSom();  // Chama a implementação específica da subclasse
  animal.mover();
}

void main() {
  Animal meuAnimal = Animal('Criatura');
  Cachorro meuCachorro = Cachorro('Rex');
  
  cuidarDeAnimal(meuAnimal);    // Usa implementação da classe Animal
  cuidarDeAnimal(meuCachorro);  // Usa implementação da classe Cachorro
  
  // Uma referência do tipo Animal pode apontar para um objeto Cachorro
  Animal animalPolimorfico = Cachorro('Totó');
  animalPolimorfico.emitirSom();  // Chama o método sobrescrito em Cachorro
}
```

No exemplo acima, a função `cuidarDeAnimal()` aceita qualquer objeto do tipo `Animal`, incluindo instâncias de suas subclasses. O método `emitirSom()` chamará a implementação específica de cada subclasse, demonstrando o polimorfismo em ação.

### Benefícios do Polimorfismo

O polimorfismo traz várias vantagens para o desenvolvimento de software:

1. **Flexibilidade**: código mais adaptável a mudanças
2. **Extensibilidade**: facilita a adição de novos tipos sem modificar o código existente
3. **Desacoplamento**: reduz dependências entre componentes
4. **Reutilização**: promove o uso de interfaces comuns para comportamentos similares

>:warning: Código de exemplo no arquivo [polimorfismo.dart](../assets/code/polimorfismo.dart)

## 5. Operador super

O operador `super` em Dart é uma referência à superclasse, permitindo acessar membros (métodos, propriedades e construtores) da classe pai a partir da classe filha.

### Chamando o Construtor da Superclasse

Uma das principais utilizações do operador `super` é na chamada do construtor da superclasse:

```dart
class Pessoa {
  String nome;
  int idade;
  
  Pessoa(this.nome, this.idade);
  
  void apresentar() {
    print('Olá, meu nome é $nome e tenho $idade anos.');
  }
}

class Funcionario extends Pessoa {
  String cargo;
  double salario;
  
  // Utilizando super para chamar o construtor da superclasse
  Funcionario(String nome, int idade, this.cargo, this.salario) 
      : super(nome, idade);
  
  @override
  void apresentar() {
    super.apresentar();  // Chamando o método da superclasse
    print('Trabalho como $cargo e ganho R\$ $salario.');
  }
}
```

Neste exemplo, `Funcionario` usa `super(nome, idade)` para chamar o construtor da classe `Pessoa` e inicializar os atributos herdados.

### Chamando Métodos da Superclasse

O operador `super` também é útil para chamar métodos da superclasse, especialmente quando você deseja estender (e não apenas substituir) o comportamento do método:

```dart
class Ave {
  void voar() {
    print('Ave voando...');
  }
}

class Papagaio extends Ave {
  @override
  void voar() {
    super.voar();  // Chama o método voar() da superclasse
    print('Papagaio falando enquanto voa: Olá!');
  }
}
```

### Acessando Propriedades da Superclasse

O operador `super` também pode ser usado para acessar propriedades da superclasse:

```dart
class Dispositivo {
  bool ligado = false;
  
  void ligar() {
    ligado = true;
    print('Dispositivo ligado');
  }
  
  void desligar() {
    ligado = false;
    print('Dispositivo desligado');
  }
}

class Computador extends Dispositivo {
  bool sistemaOperacionalCarregado = false;
  
  @override
  void ligar() {
    super.ligar();  // Chama o método ligar() da superclasse
    sistemaOperacionalCarregado = true;
    print('Sistema operacional carregado');
  }
  
  @override
  void desligar() {
    if (super.ligado) {  // Acessa a propriedade da superclasse
      sistemaOperacionalCarregado = false;
      print('Desligando sistema operacional');
      super.desligar();  // Chama o método desligar() da superclasse
    }
  }
}
```

### Considerações Importantes Sobre o Operador super

1. O operador `super` só pode ser usado em métodos de instância, não em métodos estáticos
2. Em construtores, a chamada a `super()` deve aparecer na lista de inicialização (antes do corpo do construtor)
3. Não é possível acessar membros privados da superclasse usando `super` (membros que começam com `_`)
4. A chamada `super()` para construtores deve ser a primeira instrução na lista de inicialização

>:warning: Código de exemplo no arquivo [op_super.dart](../assets/code/op_super.dart)

---
Vai para:
- [Sumário](https://github.com/claulis/flutter/blob/main/dart/README.md)
- [Próximo capítulo](../capitulos/poo-encapsulamento-abstracao.md)