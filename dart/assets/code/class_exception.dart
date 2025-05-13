class SaldoInsuficienteException implements Exception {
  final String mensagem;
  SaldoInsuficienteException(this.mensagem);
  
  @override
  String toString() => 'SaldoInsuficienteException: $mensagem';
}

class ContaBancaria {
  double saldo;
  ContaBancaria(this.saldo);
  
  void sacar(double valor) {
    if (valor > saldo) {
      throw SaldoInsuficienteException('Saldo insuficiente para sacar $valor');
    }
    saldo -= valor;
    print('Saque de $valor realizado. Novo saldo: $saldo');
  }
}

void main() {
  var conta = ContaBancaria(100.0);
  try {
    conta.sacar(150.0);
  } catch (e) {
    print('Erro: $e');
  }
}