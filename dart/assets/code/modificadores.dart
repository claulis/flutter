
// Demonstração de modificadores de acesso em Dart

void main() {
  var funcionario = Funcionario('Carlos', 5000);
  
  // Acesso a propriedades e métodos públicos
  print('Nome: ${funcionario.nome}');
  print('Salário: ${funcionario.salario}');
  
  // Modificando o salário com o setter
  funcionario.salario = 5500;
  print('Novo salário: ${funcionario.salario}');
  
  // Tentativa inválida
  try {
    funcionario.salario = -1000;
  } catch (e) {
    print('Erro ao definir salário: ${e.toString()}');
  }
  
  // Aplicando aumento
  try {
    funcionario.aplicarAumento(10);
    print('Salário após aumento de 10%: ${funcionario.salario}');
    
    // Tentativa inválida
    funcionario.aplicarAumento(50);
  } catch (e) {
    print('Erro ao aplicar aumento: ${e.toString()}');
  }
  
  // Demonstração de diferentes escopes
  var gerente = Gerente('Ana', 8000, 'TI');
  print('\nDados do gerente:');
  gerente.exibirDados();
  
  // Tentando acessar membro privado (só visível no arquivo da classe)
  // gerente._calcularBonus(); // Erro de compilação!
  
  // Dentro do mesmo arquivo
  print('\nDemonstrando acesso dentro do mesmo arquivo:');
  demonstrarAcessoNoMesmoArquivo();
}

void demonstrarAcessoNoMesmoArquivo() {
  var f = Funcionario('Teste', 1000);
  
  // Podemos acessar membros privados do mesmo arquivo
  print('Acesso ao ID interno: ${f._gerarId()}');
  
  // Mas não podemos acessar membros privados internos à classe
  // print(f._senhaInterna); // Erro de compilação!
}

class Funcionario {
  String nome;
  double _salario; // Privado ao arquivo
  final String _senhaInterna = 'xyz123'; // Privado à classe
  
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
  
  // Método privado ao arquivo
  String _gerarId() {
    return 'F${nome.substring(0, 1)}${_salario.toInt()}';
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

class Gerente extends Funcionario {
  String departamento;
  
  Gerente(String nome, double salario, this.departamento) : super(nome, salario);
  
  void exibirDados() {
    print('Nome: $nome');
    print('Departamento: $departamento');
    print('Salário: $salario');
    print('ID: ${_gerarId()}'); // Acesso a método privado da classe pai (mesmo arquivo)
  }
}