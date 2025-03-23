// Demonstração do conceito de encapsulamento em Dart

void main() {
  // Criando uma conta e utilizando seus métodos
  var minhaConta = Conta('Maria Silva');
  
  print('Titular: ${minhaConta.titular}');
  print('Saldo inicial: ${minhaConta.saldo}');
  
  minhaConta.depositar(1500);
  minhaConta.sacar(300);
  
  // Tentativas inválidas
  minhaConta.depositar(-100);
  minhaConta.sacar(2000);
  
  // Tentando mudar o titular
  minhaConta.titular = 'Maria S. Santos';
  print('Novo titular: ${minhaConta.titular}');
  
  // Tentativa inválida de mudar o titular
  minhaConta.titular = '';
  print('Titular após tentativa inválida: ${minhaConta.titular}');
  
  // Demonstração de encapsulamento:
  // Não podemos acessar diretamente o saldo
  // Isso causaria um erro de compilação:
  // minhaConta._saldo = 1000000; // Erro!
  
  // A única forma de mudar o saldo é através dos métodos
  // públicos que incluem validação
}

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
      print('Titular atualizado com sucesso.');
    } else {
      print('Erro: Nome do titular não pode ser vazio.');
    }
  }
  
  // Método público para depositar
  void depositar(double valor) {
    if (valor > 0) {
      _saldo += valor;
      print('Depósito de $valor realizado. Novo saldo: $_saldo');
    } else {
      print('Erro: Valor de depósito inválido');
    }
  }
  
  // Método público para sacar
  bool sacar(double valor) {
    if (valor > 0 && valor <= _saldo) {
      _saldo -= valor;
      print('Saque de $valor realizado. Novo saldo: $_saldo');
      return true;
    } else {
      print('Erro: Saldo insuficiente ou valor inválido');
      return false;
    }
  }
  
  // Método privado - só pode ser chamado dentro desta classe
  void _registrarTransacao(String tipo, double valor) {
    // Simulação de registro interno
    print('LOG INTERNO: $tipo de $valor realizado por $_titular');
  }
}