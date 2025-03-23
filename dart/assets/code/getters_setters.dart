// getters_setters.dart

class Temperatura {
  // Propriedade privada para armazenar a temperatura em Celsius
  double _celsius;
  
  // Construtor
  Temperatura(this._celsius);
  
  // Getter para temperatura em Celsius
  double get celsius => _celsius;
  
  // Setter para temperatura em Celsius com validação
  set celsius(double valor) {
    if (valor < -273.15) {
      throw ArgumentError('Temperatura não pode ser menor que o zero absoluto (-273.15°C)');
    }
    _celsius = valor;
  }
  
  // Getter para temperatura em Fahrenheit (calculado a partir de Celsius)
  double get fahrenheit => _celsius * 9/5 + 32;
  
  // Setter para temperatura em Fahrenheit (converte para Celsius)
  set fahrenheit(double valor) {
    celsius = (valor - 32) * 5/9; // Usa o setter de celsius para validação
  }
  
  // Getter para temperatura em Kelvin
  double get kelvin => _celsius + 273.15;
  
  // Setter para temperatura em Kelvin
  set kelvin(double valor) {
    celsius = valor - 273.15; // Usa o setter de celsius para validação
  }
}

class Pessoa {
  // Propriedades privadas
  String _nome;
  int _idade;
  double _altura;
  double _peso;
  
  // Construtor
  Pessoa(this._nome, this._idade, this._altura, this._peso);
  
  // Getters simples
  String get nome => _nome;
  int get idade => _idade;
  double get altura => _altura;
  double get peso => _peso;
  
  // Setters com validação
  set nome(String valor) {
    if (valor.isEmpty) {
      throw ArgumentError('Nome não pode estar vazio');
    }
    _nome = valor;
  }
  
  set idade(int valor) {
    if (valor < 0 || valor > 150) {
      throw ArgumentError('Idade deve estar entre 0 e 150 anos');
    }
    _idade = valor;
  }
  
  set altura(double valor) {
    if (valor <= 0 || valor > 3) {
      throw ArgumentError('Altura deve estar entre 0 e 3 metros');
    }
    _altura = valor;
  }
  
  set peso(double valor) {
    if (valor <= 0 || valor > 500) {
      throw ArgumentError('Peso deve estar entre 0 e 500 kg');
    }
    _peso = valor;
  }
  
  // Getter calculado - IMC (Índice de Massa Corporal)
  double get imc => _peso / (_altura * _altura);
  
  // Getter calculado - Classificação do IMC
  String get classificacaoIMC {
    final imc = this.imc; // Reutiliza o getter imc
    
    if (imc < 18.5) return 'Abaixo do peso';
    if (imc < 25) return 'Peso normal';
    if (imc < 30) return 'Sobrepeso';
    if (imc < 35) return 'Obesidade grau 1';
    if (imc < 40) return 'Obesidade grau 2';
    return 'Obesidade grau 3';
  }
  
  // Getter calculado - Maioridade
  bool get ehMaiorDeIdade => _idade >= 18;
}

class Produto {
  String _nome;
  double _preco;
  int _quantidadeEstoque;
  bool _ativo;
  
  // Construtor
  Produto(this._nome, this._preco, this._quantidadeEstoque, {bool ativo = true})
      : _ativo = ativo;
  
  // Getters básicos
  String get nome => _nome;
  double get preco => _preco;
  int get quantidadeEstoque => _quantidadeEstoque;
  bool get ativo => _ativo;
  
  // Setters com validação
  set nome(String valor) {
    if (valor.isEmpty) {
      throw ArgumentError('Nome do produto não pode estar vazio');
    }
    _nome = valor;
  }
  
  set preco(double valor) {
    if (valor < 0) {
      throw ArgumentError('Preço não pode ser negativo');
    }
    _preco = valor;
  }
  
  set quantidadeEstoque(int valor) {
    if (valor < 0) {
      throw ArgumentError('Quantidade em estoque não pode ser negativa');
    }
    _quantidadeEstoque = valor;
  }
  
  set ativo(bool valor) {
    _ativo = valor;
  }
  
  // Getters calculados
  bool get disponivel => _ativo && _quantidadeEstoque > 0;
  
  double get valorTotalEstoque => _preco * _quantidadeEstoque;
  
  String get status {
    if (!_ativo) return 'Inativo';
    if (_quantidadeEstoque <= 0) return 'Esgotado';
    if (_quantidadeEstoque < 10) return 'Estoque baixo';
    return 'Disponível';
  }
}

class Retangulo {
  double _largura;
  double _altura;
  
  Retangulo(this._largura, this._altura) {
    _validarDimensoes();
  }
  
  // Getters
  double get largura => _largura;
  double get altura => _altura;
  
  // Setters com validação
  set largura(double valor) {
    _largura = valor;
    _validarDimensoes();
  }
  
  set altura(double valor) {
    _altura = valor;
    _validarDimensoes();
  }
  
  // Método privado para validação
  void _validarDimensoes() {
    if (_largura <= 0 || _altura <= 0) {
      throw ArgumentError('Dimensões devem ser positivas');
    }
  }
  
  // Getters calculados para área e perímetro
  double get area => _largura * _altura;
  double get perimetro => 2 * (_largura + _altura);
  
  // Getter para verificar se é um quadrado
  bool get ehQuadrado => _largura == _altura;
}

void main() {
  print('---- Temperatura - Getters e Setters ----');
  
  var temp = Temperatura(25);
  
  print('Temperatura em Celsius: ${temp.celsius}°C');
  print('Temperatura em Fahrenheit: ${temp.fahrenheit}°F');
  print('Temperatura em Kelvin: ${temp.kelvin}K');
  
  // Usando os setters
  temp.celsius = 30;
  print('Nova temperatura em Celsius: ${temp.celsius}°C');
  print('Nova temperatura em Fahrenheit: ${temp.fahrenheit}°F');
  
  temp.fahrenheit = 68;
  print('Temperatura após ajuste em Fahrenheit: ${temp.celsius}°C');
  
  temp.kelvin = 300;
  print('Temperatura após ajuste em Kelvin: ${temp.celsius}°C');
  
  // Validação de temperatura
  try {
    temp.celsius = -300; // Abaixo do zero absoluto
  } catch (e) {
    print('Erro: $e');
  }
  
  print('\n---- Pessoa - Getters e Setters com validação ----');
  
  var pessoa = Pessoa('João', 25, 1.75, 70);
  
  print('Nome: ${pessoa.nome}');
  print('Idade: ${pessoa.idade}');
  print('Altura: ${pessoa.altura}m');
  print('Peso: ${pessoa.peso}kg');
  print('IMC: ${pessoa.imc.toStringAsFixed(2)}');
  print('Classificação IMC: ${pessoa.classificacaoIMC}');
  print('É maior de idade? ${pessoa.ehMaiorDeIdade ? "Sim" : "Não"}');
  
  // Validação de dados
  try {
    pessoa.idade = -5;
  } catch (e) {
    print('Erro ao alterar idade: $e');
  }
  
  try {
    pessoa.altura = 0;
  } catch (e) {
    print('Erro ao alterar altura: $e');
  }
  
  print('\n---- Produto - Getters calculados ----');
  
  var produto = Produto('Notebook', 3500, 15);
  
  print('Produto: ${produto.nome}');
  print('Preço: R\$ ${produto.preco}');
  print('Estoque: ${produto.quantidadeEstoque} unidades');
  print('Valor total em estoque: R\$ ${produto.valorTotalEstoque}');
  print('Status: ${produto.status}');
  print('Disponível para venda? ${produto.disponivel ? "Sim" : "Não"}');
  
  // Alterando o estoque
  produto.quantidadeEstoque = 5;
  print('\nApós venda:');
  print('Estoque: ${produto.quantidadeEstoque} unidades');
  print('Status: ${produto.status}');
  
  // Desativando o produto
  produto.ativo = false;
  print('\nApós desativação:');
  print('Status: ${produto.status}');
  print('Disponível para venda? ${produto.disponivel ? "Sim" : "Não"}');
  
  print('\n---- Retângulo - Getters calculados ----');
  
  var retangulo = Retangulo(5, 10);
  
  print('Largura: ${retangulo.largura}');
  print('Altura: ${retangulo.altura}');
  print('Área: ${retangulo.area}');
  print('Perímetro: ${retangulo.perimetro}');
  print('É um quadrado? ${retangulo.ehQuadrado ? "Sim" : "Não"}');
  
  // Transformando em um quadrado
  retangulo.altura = 5;
  print('\nApós ajuste:');
  print('É um quadrado? ${retangulo.ehQuadrado ? "Sim" : "Não"}');
  
  // Validação de dimensões
  try {
    retangulo.largura = -10;
  } catch (e) {
    print('\nErro ao alterar largura: $e');
  }
}