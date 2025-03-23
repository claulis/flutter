
// Classe com diferentes tipos de construtores
class Pessoa {
  String nome;
  int idade;
  String? endereco;
  
  // 1. Construtor básico
  Pessoa(this.nome, this.idade);
  
  // 2. Construtor nomeado
  Pessoa.comEndereco(this.nome, this.idade, this.endereco);
  
  // 3. Construtor sem idade (valor padrão)
  Pessoa.semIdade(this.nome) : idade = 0;
  
  // 4. Construtor padrão
  Pessoa.padrao() : nome = 'Anônimo', idade = 0;
  
  void apresentar() {
    String info = 'Nome: $nome, Idade: $idade';
    if (endereco != null) {
      info += ', Endereço: $endereco';
    }
    print(info);
  }
}

// Classe com construtor e validação
class Retangulo {
  final double largura;
  final double altura;
  
  // Construtor com validação
  Retangulo(this.largura, this.altura) {
    if (largura <= 0 || altura <= 0) {
      throw ArgumentError('Dimensões devem ser positivas');
    }
  }
  
  // Método para calcular área
  double calcularArea() {
    return largura * altura;
  }
}

// Classe com lista de inicialização
class Circulo {
  final double raio;
  final double area;
  final double perimetro;
  
  // Construtor com lista de inicialização
  Circulo(this.raio)
      : area = 3.14159 * raio * raio,
        perimetro = 2 * 3.14159 * raio {
    if (raio <= 0) {
      throw ArgumentError('Raio deve ser positivo');
    }
  }
}

// Classe com construtor factory
class Ponto {
  final double x;
  final double y;
  
  // Construtor padrão
  Ponto(this.x, this.y);
  
  // Construtor factory para criar um ponto na origem
  factory Ponto.origem() {
    return Ponto(0, 0);
  }
  
  // Construtor factory para criar um ponto a partir de um Map
  factory Ponto.fromMap(Map<String, dynamic> map) {
    return Ponto(
      map['x']?.toDouble() ?? 0.0,
      map['y']?.toDouble() ?? 0.0
    );
  }
  
  // Construtor factory que pode retornar um objeto já existente
  static final Ponto _unitario = Ponto(1, 1);
  
  factory Ponto.unitario() {
    return _unitario;
  }
  
  @override
  String toString() => 'Ponto($x, $y)';
}

// Classe com construtor const
class Cor {
  final int r;
  final int g;
  final int b;
  
  // Construtor const para objetos imutáveis
  const Cor(this.r, this.g, this.b);
  
  // Cores predefinidas como constantes
  static const Cor vermelho = Cor(255, 0, 0);
  static const Cor verde = Cor(0, 255, 0);
  static const Cor azul = Cor(0, 0, 255);
  
  @override
  String toString() => 'Cor($r, $g, $b)';
}

void main() {
  print('---- Construtores básicos ----');
  
  // Usando diferentes construtores
  var pessoa1 = Pessoa('João', 30);
  var pessoa2 = Pessoa.comEndereco('Maria', 25, 'Av. Principal, 123');
  var pessoa3 = Pessoa.semIdade('Pedro');
  var pessoa4 = Pessoa.padrao();
  
  pessoa1.apresentar();
  pessoa2.apresentar();
  pessoa3.apresentar();
  pessoa4.apresentar();
  
  print('\n---- Construtor com validação ----');
  
  try {
    var retangulo = Retangulo(5, 10);
    print('Área do retângulo: ${retangulo.calcularArea()}');
    
    // Isso vai lançar uma exceção
    var retanguloInvalido = Retangulo(-1, 5);
  } catch (e) {
    print('Erro: $e');
  }
  
  print('\n---- Construtor com lista de inicialização ----');
  
  var circulo = Circulo(5);
  print('Círculo com raio ${circulo.raio}');
  print('Área: ${circulo.area}');
  print('Perímetro: ${circulo.perimetro}');
  
  print('\n---- Construtores factory ----');
  
  var origem = Ponto.origem();
  print('Ponto na origem: $origem');
  
  var pontoMap = Ponto.fromMap({'x': 10, 'y': 20});
  print('Ponto do mapa: $pontoMap');
  
  var unitario1 = Ponto.unitario();
  var unitario2 = Ponto.unitario();
  print('Unitários são a mesma instância: ${identical(unitario1, unitario2)}');
  
  print('\n---- Construtores const ----');
  
  // Objetos const com mesmos valores são a mesma instância
  const cor1 = Cor(100, 100, 100);
  const cor2 = Cor(100, 100, 100);
  print('Cores const iguais são a mesma instância: ${identical(cor1, cor2)}');
  
  // Usando cores predefinidas
  print('Azul: ${Cor.azul}');
}