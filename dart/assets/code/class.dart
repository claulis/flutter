// definicao_classes.dart

// Definição de uma classe básica em Dart
class Pessoa {
  // Propriedades (atributos)
  late String nome;
  late int idade;
  
  // Métodos
  void apresentar() {
    print('Olá, meu nome é $nome e tenho $idade anos.');
  }
  
  bool ehMaiorDeIdade() {
    return idade >= 18;
  }
}

// Definição de classe com campos privados
class Funcionario {
  late String nome;
  // Campo privado (acessível apenas neste arquivo)
  late double _salario;
  
  // Método que acessa o campo privado
  void aumentarSalario(double percentual) {
    if (percentual > 0) {
      _salario += _salario * (percentual / 100);
    }
  }
  
  // Método para acessar o valor do campo privado
  double obterSalario() {
    return _salario;
  }
}

// Classe que usa composição
class Departamento {
  late String nome;
  List<Funcionario> funcionarios = [];
  
  void adicionarFuncionario(Funcionario funcionario) {
    funcionarios.add(funcionario);
  }
  
  int obterTotalFuncionarios() {
    return funcionarios.length;
  }
}

// Exemplo de uso
void main() {
  // Demonstração da classe Pessoa
  var pessoa = Pessoa();
  pessoa.nome = "Ana";
  pessoa.idade = 25;
  pessoa.apresentar();
  
  print('É maior de idade? ${pessoa.ehMaiorDeIdade()}');
  
  // Demonstração da classe com campos privados
  var funcionario = Funcionario();
  funcionario.nome = "Carlos";
  // funcionario._salario = 5000; // Erro: não pode acessar campo privado diretamente
  
  // Demonstração de composição
  var rh = Departamento();
  rh.nome = "Recursos Humanos";
  rh.adicionarFuncionario(funcionario);
  print('Total de funcionários em ${rh.nome}: ${rh.obterTotalFuncionarios()}');
}