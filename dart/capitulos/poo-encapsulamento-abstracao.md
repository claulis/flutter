# Encapsulamento e Abstração

## 1. Encapsulamento em Dart

O encapsulamento é um dos pilares fundamentais da programação orientada a objetos. Em Dart, este conceito permite ocultar os detalhes internos de uma classe e expor apenas o necessário.

### O que é encapsulamento?

Encapsulamento é o conceito de agrupar dados (atributos) e os métodos que operam sobre esses dados em uma única unidade (classe), restringindo o acesso direto a alguns componentes. Isso cria uma "cápsula" em torno dos detalhes de implementação.

### Implementação em Dart

Em Dart, o encapsulamento é implementado principalmente usando o prefixo `_` (underscore) para tornar membros privados à biblioteca.

```dart
class Conta {
  // Atributos privados (encapsulados)
  double _saldo = 0.0;
  String _titular;
  
  // Construtor
  Conta(this._titular);
  
  // Getter público para acessar o saldo
  double get saldo => _saldo;
  
  // Getter e setter para o titular
  String get titular => _titular;
  set titular(String novoTitular) {
    if (novoTitular.isNotEmpty) {
      _titular = novoTitular;
    }
  }
  
  // Método público para depositar
  void depositar(double valor) {
    if (valor > 0) {
      _saldo += valor;
      print('Depósito de $valor realizado. Novo saldo: $_saldo');
    } else {
      print('Valor de depósito inválido');
    }
  }
  
  // Método público para sacar
  bool sacar(double valor) {
    if (valor > 0 && valor <= _saldo) {
      _saldo -= valor;
      print('Saque de $valor realizado. Novo saldo: $_saldo');
      return true;
    } else {
      print('Saldo insuficiente ou valor inválido');
      return false;
    }
  }
}
```

### Benefícios do encapsulamento

1. **Proteção dos dados:** Impede modificações diretas e indevidas dos dados
2. **Validação:** Permite validar dados antes de atribuí-los (como visto no setter de `titular`)
3. **Flexibilidade:** Facilita alterar a implementação interna sem afetar o código cliente
4. **Ocultação de complexidade:** Expõe apenas uma interface simples para os usuários da classe

>:warning: Código de exemplo no arquivo [encapsulamento.dart](../assets/code/encapsulamento.dart)

## 2. Modificadores de Acesso em Dart

Diferentemente de linguagens como Java ou C#, Dart possui uma abordagem simplificada para modificadores de acesso.

### Tipos de modificadores em Dart

1. **Público (default):** Todos os membros são públicos por padrão
2. **Privado à biblioteca:** Membros precedidos por `_` são acessíveis apenas dentro do arquivo onde estão definidos

### Exemplos práticos

```dart
// arquivo: pessoa.dart
class Pessoa {
  // Público (acessível de qualquer lugar)
  String nome;
  
  // Privado (acessível apenas neste arquivo)
  int _idade;
  
  // Construtor
  Pessoa(this.nome, this._idade);
  
  // Método público
  void apresentar() {
    print('Olá, sou $nome e tenho $_idade anos');
  }
  
  // Método privado
  void _calcularAlgoDaIdade() {
    // Lógica interna que não deve ser exposta
  }
}

// Mesmo arquivo, pode acessar membros privados
void funcaoDentroDoArquivo() {
  var p = Pessoa('Ana', 30);
  print(p._idade); // Acesso permitido
}
```

```dart
// arquivo: outro_arquivo.dart
import 'pessoa.dart';

void funcaoForaDoArquivo() {
  var p = Pessoa('João', 25);
  p.apresentar(); // Método público - OK
  // print(p._idade); // Erro! Não podemos acessar membro privado
}
```

### Implementando acesso controlado com getters e setters

```dart
class Funcionario {
  String nome;
  double _salario; // Privado
  
  Funcionario(this.nome, this._salario);
  
  // Getter para salário (somente leitura)
  double get salario => _salario;
  
  // Setter com validação
  set salario(double valor) {
    if (valor >= 0) {
      _salario = valor;
    } else {
      throw ArgumentError('Salário não pode ser negativo');
    }
  }
  
  // Método para aumento de salário com regras de negócio
  void aplicarAumento(double percentual) {
    if (percentual > 0 && percentual <= 30) {
      _salario += _salario * (percentual / 100);
    } else {
      throw ArgumentError('Percentual de aumento deve estar entre 0 e 30%');
    }
  }
}
```
>:warning: Código de exemplo no arquivo [modificadores.dart](../assets/code/modificadores.dart)

## 3. Classes Abstratas em Dart

Classes abstratas são modelos que não podem ser instanciados diretamente, servindo como base para outras classes.

### Características das classes abstratas

1. Declaradas com a palavra-chave `abstract`
2. Podem conter métodos abstratos (sem implementação) e métodos concretos (com implementação)
3. Subclasses devem implementar todos os métodos abstratos
4. Não podem ser instanciadas diretamente

### Exemplo prático

```dart
// Classe abstrata que define um contrato para formas geométricas
abstract class Forma {
  // Método abstrato (sem implementação)
  double calcularArea();
  
  // Método abstrato
  double calcularPerimetro();
  
  // Método concreto (com implementação)
  void descricao() {
    print('Esta é uma forma geométrica');
  }
  
  // Outro método concreto que usa métodos abstratos
  void mostrarDetalhes() {
    print('Área: ${calcularArea()}');
    print('Perímetro: ${calcularPerimetro()}');
  }
}

// Classe concreta que implementa a classe abstrata
class Retangulo extends Forma {
  double largura;
  double altura;
  
  Retangulo(this.largura, this.altura);
  
  // Implementação do método abstrato
  @override
  double calcularArea() {
    return largura * altura;
  }
  
  // Implementação do método abstrato
  @override
  double calcularPerimetro() {
    return 2 * (largura + altura);
  }
  
  // Sobrescrevendo um método concreto
  @override
  void descricao() {
    super.descricao(); // Chama o método da classe pai
    print('Especificamente, sou um retângulo de ${largura}x${altura}');
  }
}

// Outra implementação
class Circulo extends Forma {
  double raio;
  
  Circulo(this.raio);
  
  @override
  double calcularArea() {
    return 3.14159 * raio * raio;
  }
  
  @override
  double calcularPerimetro() {
    return 2 * 3.14159 * raio;
  }
}
```

### Uso das classes abstratas

```dart
void main() {
  // Forma f = Forma(); // Erro! Não pode instanciar classe abstrata
  
  Retangulo r = Retangulo(5, 3);
  r.descricao();
  r.mostrarDetalhes();
  
  Circulo c = Circulo(4);
  c.mostrarDetalhes();
  
  // Polimorfismo
  List<Forma> formas = [r, c];
  for (var forma in formas) {
    print('Área: ${forma.calcularArea()}');
  }
}
```

### Quando usar classes abstratas

- Para criar um "contrato" que subclasses devem seguir
- Quando você tem comportamentos comuns que podem ser compartilhados
- Quando quer garantir que certas funcionalidades sejam implementadas
- Para facilitar o polimorfismo

>:warning: Código de exemplo no arquivo [abstract_class.dart](../assets/code/abstract_class.dart)

## 4. Interfaces em Dart

Dart não possui uma palavra-chave `interface` explícita como outras linguagens. Em vez disso, qualquer classe pode ser usada como interface.

### Como funcionam interfaces em Dart

1. Em Dart, uma interface é definida implicitamente pela assinatura pública de uma classe
2. A palavra-chave `implements` é usada para implementar interfaces
3. Ao implementar uma interface, a classe deve fornecer implementações para todos os métodos e propriedades
4. Uma classe pode implementar múltiplas interfaces

### Exemplo de interfaces em Dart

```dart
// Esta classe será usada como interface
class Animal {
  void comer() {
    print('Animal comendo');
  }
  
  void dormir() {
    print('Animal dormindo');
  }
  
  void emitirSom() {
    print('Som genérico de animal');
  }
}

// Implementando a interface Animal
class Cachorro implements Animal {
  // Precisamos implementar todos os métodos
  @override
  void comer() {
    print('Cachorro comendo ração');
  }
  
  @override
  void dormir() {
    print('Cachorro dormindo na casinha');
  }
  
  @override
  void emitirSom() {
    print('Au au!');
  }
  
  // Métodos adicionais
  void abanarRabo() {
    print('Abanando o rabo');
  }
}

// Outra implementação da interface Animal
class Gato implements Animal {
  @override
  void comer() {
    print('Gato comendo ração de gato');
  }
  
  @override
  void dormir() {
    print('Gato dormindo no sofá');
  }
  
  @override
  void emitirSom() {
    print('Miau!');
  }
}
```

### Interface abstrata explícita

Para tornar a intenção mais clara, é comum criar classes abstratas para serem usadas como interfaces:

```dart
// Interface explícita para dispositivos eletrônicos
abstract class DispositivoEletronico {
  void ligar();
  void desligar();
  bool verificarEnergia();
}

// Interface para dispositivos com conexão à internet
abstract class ConexaoInternet {
  void conectar();
  void desconectar();
  bool verificarConexao();
}

// Classe que implementa múltiplas interfaces
class Smartphone implements DispositivoEletronico, ConexaoInternet {
  bool _ligado = false;
  bool _conectado = false;
  
  @override
  void ligar() {
    _ligado = true;
    print('Smartphone ligado');
  }
  
  @override
  void desligar() {
    _ligado = false;
    _conectado = false;
    print('Smartphone desligado');
  }
  
  @override
  bool verificarEnergia() {
    return _ligado;
  }
  
  @override
  void conectar() {
    if (_ligado) {
      _conectado = true;
      print('Conectado à internet');
    } else {
      print('Impossível conectar: dispositivo desligado');
    }
  }
  
  @override
  void desconectar() {
    _conectado = false;
    print('Desconectado da internet');
  }
  
  @override
  bool verificarConexao() {
    return _conectado;
  }
}
```

### Diferença entre extends e implements

```dart
// Com extends:
class Moto extends Veiculo {
  // Herda implementação e pode sobrescrever
}

// Com implements:
class Bicicleta implements Veiculo {
  // Não herda implementação, apenas o contrato
  // Deve implementar TODOS os métodos
}
```
>:warning: Código de exemplo no arquivo [interface.dart](../assets/code/interface.dart)

## 5. Mixins em Dart

Mixins são uma forma de reutilizar código em múltiplas hierarquias de classe.

### O que são Mixins?

- Mecanismo para compartilhar código entre classes sem usar herança
- Permite adicionar funcionalidades a uma classe sem necessidade de herança
- Útil quando queremos adicionar capacidades a classes sem criar relações pai-filho
- Resolve o problema da herança múltipla (que Dart não suporta diretamente)

### Sintaxe para criar Mixins

```dart
mixin NomeMixin {
  // Propriedades e métodos
}
```

### Exemplo prático

```dart
// Mixin para capacidade de nadar
mixin Nadador {
  void nadar() {
    print('Nadando');
  }
  
  void mergulhar() {
    print('Mergulhando');
  }
}

// Mixin para capacidade de voar
mixin Voador {
  void voar() {
    print('Voando');
  }
  
  void planar() {
    print('Planando');
  }
}

// Classe base
class Animal {
  String nome;
  
  Animal(this.nome);
  
  void comer() {
    print('$nome está comendo');
  }
}

// Classe que usa apenas um mixin
class Peixe extends Animal with Nadador {
  Peixe(String nome) : super(nome);
}

// Classe que usa vários mixins
class Pato extends Animal with Nadador, Voador {
  Pato(String nome) : super(nome);
  
  // Podemos sobrescrever métodos dos mixins
  @override
  void nadar() {
    print('$nome está nadando como um pato');
  }
}

// Classe que usa apenas o mixin Voador
class Passaro extends Animal with Voador {
  Passaro(String nome) : super(nome);
}
```

### Usando os mixins

```dart
void main() {
  var peixe = Peixe('Nemo');
  peixe.nadar(); // Do mixin Nadador
  peixe.comer(); // Da classe Animal
  
  var pato = Pato('Donald');
  pato.nadar(); // Sobrescrito
  pato.voar();  // Do mixin Voador
  pato.comer(); // Da classe Animal
  
  var passaro = Passaro('Blu');
  passaro.voar(); // Do mixin Voador
  // passaro.nadar(); // Erro! Passaro não tem o mixin Nadador
}
```

### Restrições em Mixins

Podemos restringir quais classes podem usar um mixin:

```dart
// Somente classes que extendem Ave podem usar este mixin
mixin VoadorAvancado on Ave {
  void voarRapido() {
    print('Voando em alta velocidade');
  }
  
  @override
  void voar() {
    print('Voando como um especialista');
  }
}

class Ave {
  void voar() {
    print('Voando como uma ave comum');
  }
}

// Funciona porque Aguia extende Ave
class Aguia extends Ave with VoadorAvancado {
  String nome;
  
  Aguia(this.nome);
}

// Erro! Aviao não extende Ave
// class Aviao with VoadorAvancado { }
```

### Benefícios dos Mixins

1. **Reutilização de código:** Compartilha funcionalidades entre classes não relacionadas
2. **Composição sobre herança:** Permite combinar comportamentos sem criar hierarquias complexas
3. **Flexibilidade:** Adiciona recursos específicos a classes conforme necessário
4. **Solução para "herança múltipla":** Permite que uma classe herde comportamentos de múltiplas fontes

## Exemplo de Aplicação Prática

Vamos integrar todos estes conceitos em um exemplo coeso:

```dart
// Classe abstrata para formas
abstract class Forma {
  // Atributo protegido
  String _cor = 'Preto';
  
  // Getter e setter para cor
  String get cor => _cor;
  set cor(String novaCor) => _cor = novaCor;
  
  // Métodos abstratos
  double calcularArea();
  double calcularPerimetro();
  
  // Método concreto
  void apresentar() {
    print('Sou uma forma ${this.runtimeType} de cor $_cor');
    print('Área: ${calcularArea()}, Perímetro: ${calcularPerimetro()}');
  }
}

// Interface para formas que podem ser desenhadas
abstract class Desenhavel {
  void desenhar();
  void redimensionar(double fator);
}

// Mixin para formas que podem ser rotacionadas
mixin Rotacionavel {
  double _angulo = 0;
  
  double get angulo => _angulo;
  
  void rotacionar(double graus) {
    _angulo = (_angulo + graus) % 360;
    print('Rotacionado para $_angulo graus');
  }
  
  void resetarRotacao() {
    _angulo = 0;
    print('Rotação resetada');
  }
}

// Implementação concreta
class Retangulo extends Forma implements Desenhavel with Rotacionavel {
  double largura;
  double altura;
  
  // Construtor com inicialização
  Retangulo(this.largura, this.altura, {String cor = 'Azul'}) {
    this._cor = cor;
  }
  
  // Factory constructor para criar um quadrado
  factory Retangulo.quadrado(double lado, {String cor = 'Vermelho'}) {
    return Retangulo(lado, lado, cor: cor);
  }
  
  // Implementação dos métodos abstratos da classe Forma
  @override
  double calcularArea() => largura * altura;
  
  @override
  double calcularPerimetro() => 2 * (largura + altura);
  
  // Implementação dos métodos da interface Desenhavel
  @override
  void desenhar() {
    print('Desenhando um retângulo de ${largura}x${altura}');
    print('Rotação atual: $angulo graus');
  }
  
  @override
  void redimensionar(double fator) {
    if (fator > 0) {
      largura *= fator;
      altura *= fator;
      print('Retângulo redimensionado para ${largura}x${altura}');
    } else {
      print('Fator de redimensionamento inválido');
    }
  }
  
  // Método específico desta classe
  bool eQuadrado() => largura == altura;
}

// Uso
void main() {
  var retangulo = Retangulo(10, 5, cor: 'Azul');
  retangulo.apresentar();
  retangulo.desenhar();
  retangulo.rotacionar(45);
  retangulo.redimensionar(1.5);
  retangulo.desenhar();
  
  print('É quadrado? ${retangulo.eQuadrado()}');
  
  var quadrado = Retangulo.quadrado(7);
  quadrado.apresentar();
  print('É quadrado? ${quadrado.eQuadrado()}');
}
```
>:warning: Código de exemplo no arquivo [mixins.dart](../assets/code/mixins.dart.dart)

## Resumo das Boas Práticas

1. **Encapsulamento:**
   - Use atributos privados (com `_`) para dados sensíveis
   - Implemente getters e setters quando necessário
   - Valide dados nos setters para manter a integridade
   - Exponha apenas o que é necessário para o mundo exterior

2. **Modificadores de Acesso:**
   - Use `_` para membros privados à biblioteca
   - Agrupe código relacionado no mesmo arquivo para aproveitar o acesso privado
   - Considere a criação de APIs públicas claras e bem documentadas
   - Use getters e setters para controlar o acesso e incluir validações

3. **Classes Abstratas:**
   - Use para definir contratos e comportamentos comuns
   - Inclua implementações padrão quando possível
   - Não tente instanciar classes abstratas
   - Use métodos abstratos para forçar subclasses a implementar comportamentos

4. **Interfaces:**
   - Prefira interfaces abstratas explícitas para clareza
   - Use `implements` para múltiplas interfaces
   - Lembre-se que ao implementar uma interface, você deve fornecer todas as implementações
   - Use interfaces para definir capacidades em vez de herança

5. **Mixins:**
   - Use para adicionar comportamentos a classes sem herança
   - Mantenha mixins focados em uma única responsabilidade
   - Use restrições `on` quando o mixin depender de métodos específicos
   - Prefira mixins sobre herança múltipla para código reutilizável

---
Vai para:
- [Sumário](https://github.com/claulis/flutter/blob/main/dart/README.md)
- [Próximo capítulo](../capitulos/programacao-funcional.md)

