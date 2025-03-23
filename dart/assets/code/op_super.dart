// operador_super.dart
// Demonstração do uso do operador super em Dart

// Classe base com construtor, propriedades e métodos
class Pessoa {
  String nome;
  int idade;
  
  Pessoa(this.nome, this.idade) {
    print('Construtor de Pessoa executado');
  }
  
  void apresentar() {
    print('Olá, meu nome é $nome e tenho $idade anos.');
  }
  
  void aniversario() {
    idade++;
    print('$nome agora tem $idade anos.');
  }
  
  String obterDados() {
    return 'Nome: $nome, Idade: $idade';
  }
}

// Subclasse que usa super para chamar o construtor da superclasse
class Estudante extends Pessoa {
  String escola;
  List<String> materias;
  
  // Usando super para chamar o construtor da classe pai
  Estudante(String nome, int idade, this.escola, this.materias) 
      : super(nome, idade) {
    print('Construtor de Estudante executado');
  }
  
  // Sobrescrevendo método e usando super para chamar a implementação da superclasse
  @override
  void apresentar() {
    super.apresentar();  // Chama o método da superclasse
    print('Estudo na $escola e curso as seguintes matérias: ${materias.join(", ")}.');
  }
  
  // Método específico que usa propriedades da superclasse via super
  void mudarEscola(String novaEscola) {
    print('${super.nome} está mudando da escola $escola para $novaEscola.');
    escola = novaEscola;
  }
  
  // Outro método que usa super para acessar método da superclasse
  @override
  String obterDados() {
    return '${super.obterDados()}, Escola: $escola';
  }
}

// Subclasse com construtor nomeado que usa super
class Funcionario extends Pessoa {
  String cargo;
  double salario;
  
  Funcionario(String nome, int idade, this.cargo, this.salario) 
      : super(nome, idade) {
    print('Construtor de Funcionário executado');
  }
  
  // Construtor nomeado que também usa super
  Funcionario.estagiario(String nome, int idade) 
      : cargo = 'Estagiário',
        salario = 1500.0,
        super(nome, idade) {
    print('Construtor nomeado de Funcionário executado');
  }
  
  @override
  void apresentar() {
    super.apresentar();
    print('Trabalho como $cargo e ganho R\$ $salario.');
  }
  
  void promover(String novoCargo, double novoSalario) {
    print('$nome foi promovido de $cargo para $novoCargo.');
    print('Salário atualizado de R\$ $salario para R\$ $novoSalario.');
    cargo = novoCargo;
    salario = novoSalario;
  }
  
  // Método que estende o comportamento do método da superclasse
  @override
  void aniversario() {
    super.aniversario();  // Chama o método da superclasse
    // Lógica adicional
    salario += salario * 0.05;
    print('$nome recebeu um aumento de 5% pelo aniversário. Novo salário: R\$ $salario');
  }
}

// Classe que mostra cadeia de herança com múltiplos super
class Gerente extends Funcionario {
  String departamento;
  List<String> funcionariosGerenciados;
  
  Gerente(String nome, int idade, double salario, this.departamento, this.funcionariosGerenciados)
      : super(nome, idade, 'Gerente', salario) {
    print('Construtor de Gerente executado');
  }
  
  @override
  void apresentar() {
    super.apresentar();  // Chama o método da classe Funcionario
    print('Gerencio o departamento de $departamento com ${funcionariosGerenciados.length} funcionários.');
  }
  
  void adicionarFuncionario(String nomeFuncionario) {
    funcionariosGerenciados.add(nomeFuncionario);
    print('$nomeFuncionario adicionado à equipe de $departamento, gerenciada por ${super.nome}.');
  }
}

// Classe com propriedades e métodos privados para demonstrar a limitação do super
class ContaBancaria {
  String titular;
  double _saldo;  // Propriedade privada
  
  ContaBancaria(this.titular, this._saldo);
  
  double get saldo => _saldo;
  
  void _registrarTransacao(String tipo, double valor) {
    print('[$tipo] Titular: $titular, Valor: R\$ $valor');
  }
  
  void depositar(double valor) {
    _saldo += valor;
    _registrarTransacao('DEPÓSITO', valor);
    print('Saldo atual: R\$ $_saldo');
  }
  
  bool sacar(double valor) {
    if (_saldo >= valor) {
      _saldo -= valor;
      _registrarTransacao('SAQUE', valor);
      print('Saldo atual: R\$ $_saldo');
      return true;
    }
    print('Saldo insuficiente');
    return false;
  }
}

class ContaPoupanca extends ContaBancaria {
  double taxaJuros;
  
  ContaPoupanca(String titular, double saldoInicial, this.taxaJuros) 
      : super(titular, saldoInicial);
  
  void calcularJuros() {
    double juros = super.saldo * taxaJuros;
    print('Juros calculados: R\$ $juros');
    depositar(juros);
  }
  
  @override
  void depositar(double valor) {
    // Chama o método da superclasse
    super.depositar(valor);
    // Adiciona comportamento específico
    print('Depósito em conta poupança registrado com sucesso.');
  }
  
  // Observação: não é possível acessar _registrarTransacao diretamente via super
  // pois métodos privados não são acessíveis, mesmo usando super
}

void main() {
  print('=== Demonstração do Operador super ===\n');
  
  print('--- Chamando construtor da superclasse ---');
  Estudante estudante = Estudante('Maria', 16, 'Colégio Central', ['Matemática', 'História', 'Ciências']);
  
  print('\n--- Chamando método da superclasse ---');
  estudante.apresentar();
  
  print('\n--- Sobrescrevendo e estendendo métodos ---');
  Funcionario funcionario = Funcionario('João', 30, 'Desenvolvedor', 5000.0);
  funcionario.apresentar();
  funcionario.aniversario();  // Método sobrescrito que chama super.aniversario()
  
  print('\n--- Construtor nomeado com super ---');
  Funcionario estagiario = Funcionario.estagiario('Pedro', 22);
  estagiario.apresentar();
  
  print('\n--- Cadeia de herança ---');
  Gerente gerente = Gerente('Ana', 35, 8000.0, 'TI', ['Carlos', 'Sérgio']);
  gerente.apresentar();
  gerente.adicionarFuncionario('Juliana');
  
  print('\n--- Acessando métodos da superclasse ---');
  print('Dados do Estudante: ${estudante.obterDados()}');
  estudante.mudarEscola('Escola Técnica');
  estudante.apresentar();
}