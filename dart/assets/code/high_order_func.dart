
// Função de alta ordem que recebe função como parâmetro
void executarOperacao(int a, int b, int Function(int, int) operacao) {
  print('Resultado da operação: ${operacao(a, b)}');
}

// Função de alta ordem que retorna função
Function(int) criarMultiplicador(int multiplicador) {
  return (int numero) => numero * multiplicador;
}

class ExemploFuncoesAltaOrdem {
  static void demonstrar() {
    // Passando funções como argumentos
    executarOperacao(5, 3, (a, b) => a + b);  // Soma
    executarOperacao(5, 3, (a, b) => a * b);  // Multiplicação

    // Criando funções dinamicamente
    var dobrar = criarMultiplicador(2);
    var triplicar = criarMultiplicador(3);

    print('Dobrar 4: ${dobrar(4)}');
    print('Triplicar 4: ${triplicar(4)}');
  }
}

void main() {
  ExemploFuncoesAltaOrdem.demonstrar();
}