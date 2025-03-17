// Arquivo: exemplo_variaveis.dart
// Um exemplo completo demonstrando diversos conceitos de variáveis em Dart

// Variáveis globais
String globalNome = "Aplicação de Gerenciamento";
final int versaoApp = 1;
const double PI = 3.14159;

// Enum para status
enum Status { ativo, inativo, pendente, bloqueado }

void main() {
  print("=== Demonstração de Variáveis em Dart ===\n");
  
  // SEÇÃO 1: Declaração de variáveis
  print("--- Declaração de Variáveis ---");
  
  // Com tipo explícito
  String nome = "Maria Silva";
  int idade = 28;
  double salario = 4500.50;
  bool ativo = true;
  
  print("Nome: $nome, Idade: $idade, Salário: $salario, Ativo: $ativo");
  
  // Com inferência de tipo (var)
  var empresa = "Tech Solutions";
  var funcionarios = 150;
  var valorMercado = 10500000.75;
  var emExpansao = true;
  
  print("Empresa: $empresa, Funcionários: $funcionarios, " +
        "Valor de Mercado: $valorMercado, Em Expansão: $emExpansao");
  
  // Variáveis dinâmicas
  dynamic informacao = "Texto inicial";
  print("Informação (String): $informacao");
  
  informacao = 42;
  print("Informação (int): $informacao");
  
  informacao = false;
  print("Informação (bool): $informacao");
  
  // SEÇÃO 2: Tipos de variáveis
  print("\n--- Tipos de Variáveis ---");
  
  // Lista (Array)
  List<String> frutas = ["Maçã", "Banana", "Laranja", "Uva"];
  print("Lista de frutas: $frutas");
  print("Primeira fruta: ${frutas[0]}");
  
  // Adicionando à lista
  frutas.add("Morango");
  print("Lista após adicionar morango: $frutas");
  
  // Set (conjunto sem duplicatas)
  Set<int> numeros = {1, 2, 3, 4, 5, 5}; // Note o 5 duplicado
  print("Set de números: $numeros"); // O 5 aparecerá apenas uma vez
  
  // Map (dicionário)
  Map<String, dynamic> funcionario = {
    "nome": "João Costa",
    "cargo": "Desenvolvedor",
    "idade": 32,
    "habilidades": ["Dart", "Flutter", "Firebase"]
  };
  
  print("Dados do funcionário: $funcionario");
  print("Nome do funcionário: ${funcionario["nome"]}");
  print("Habilidades: ${funcionario["habilidades"]}");
  
  // SEÇÃO 3: Const vs Final
  print("\n--- Const vs Final ---");
  
  // Final - pode ser definido em tempo de execução
  final agora = DateTime.now();
  print("Data e hora atual (final): $agora");
  
  final String mensagemBoasVindas = "Bem-vindo à aplicação v$versaoApp";
  print(mensagemBoasVindas);
  
  // Const - deve ser conhecido em tempo de compilação
  const double GRAVIDADE = 9.81;
  const String EMPRESA_NOME = "Tech Solutions Ltd.";
  
  print("Gravidade: $GRAVIDADE m/s²");
  print("Nome da empresa: $EMPRESA_NOME");
  
  // Erro: não compila - const não pode usar valores definidos em tempo de execução
  // const String dataAtual = DateTime.now().toString();
  
  // SEÇÃO 4: Escopo de variáveis
  print("\n--- Escopo de Variáveis ---");
  
  // Acessando variável global
  print("Variável global: $globalNome");
  
  // Variável de função
  String funcaoVar = "Visível apenas dentro de main()";
  print("Variável de função: $funcaoVar");
  
  // Demonstrando escopo de bloco
  if (true) {
    String blocoVar = "Visível apenas neste bloco if";
    var outraVarDeBloco = 100;
    print("Dentro do bloco - blocoVar: $blocoVar, outraVarDeBloco: $outraVarDeBloco");
  }
  
  // Erro: não compila - variáveis de bloco não são acessíveis fora do bloco
  // print("Fora do bloco - blocoVar: $blocoVar");
  
  // Demonstrando tipos de escopo com uma função
  demonstrarEscopo();
  
  // SEÇÃO 5: Usando classe para demonstrar naming conventions
  print("\n--- Demonstração de Classe e Naming Conventions ---");
  
  // Criando objeto da classe ContaBancaria
  var conta = ContaBancaria("123456-7", "Ana Pereira", 5000.0, Status.ativo);
  
  // Usando métodos e propriedades
  print("Titular: ${conta.titular}");
  print("Status: ${conta.status}");
  print("Saldo Atual: ${conta.consultarSaldo()}");
  
  conta.depositar(1500.0);
  print("Saldo após depósito: ${conta.consultarSaldo()}");
  
  conta.sacar(2000.0);
  print("Saldo após saque: ${conta.consultarSaldo()}");
  
  // Tentar sacar mais do que tem na conta
  var sucesso = conta.sacar(10000.0);
  if (!sucesso) {
    print("Operação de saque não realizada por saldo insuficiente");
  }
}

// Demonstração de escopo com função separada
void demonstrarEscopo() {
  print("\nDentro da função demonstrarEscopo():");
  
  // Pode acessar variáveis globais
  print("Acessando variável global: $globalNome");
  
  // Não pode acessar variáveis da função main
  // Erro: não compila
  // print("Tentando acessar funcaoVar: $funcaoVar");
  
  // Variável local da função
  String localVar = "Esta variável é local à demonstrarEscopo()";
  print(localVar);
}

// Classe para demonstrar escopo de classe e naming conventions
class ContaBancaria {
  // Atributos privados com prefixo _
  final String _numeroConta;
  double _saldo;
  
  // Atributos públicos em lowerCamelCase
  String titular;
  Status status;
  
  // Constantes de classe em lowerCamelCase
  static const double taxaManutencao = 2.5;
  static const double limiteSaqueDiario = 5000.0;
  
  // Construtor
  ContaBancaria(this._numeroConta, this.titular, this._saldo, this.status);
  
  // Método para consultar saldo (getter)
  double consultarSaldo() {
    return _saldo;
  }
  
  // Método para depósito
  void depositar(double valor) {
    if (valor > 0) {
      // Variável local ao método
      double valorLiquido = valor - (valor * 0.01); // Taxa de 1%
      _saldo += valorLiquido;
      print("Depósito de $valor realizado. Taxa aplicada: ${valor * 0.01}");
    } else {
      print("Valor de depósito deve ser maior que zero");
    }
  }
  
  // Método para saque
  bool sacar(double valor) {
    if (valor <= 0) {
      print("Valor de saque deve ser maior que zero");
      return false;
    }
    
    if (_saldo < valor) {
      print("Saldo insuficiente para realizar o saque");
      return false;
    }
    
    if (valor > limiteSaqueDiario) {
      print("Valor excede o limite diário de saque de $limiteSaqueDiario");
      return false;
    }
    
    _saldo -= valor;
    print("Saque de $valor realizado com sucesso");
    return true;
  }
}