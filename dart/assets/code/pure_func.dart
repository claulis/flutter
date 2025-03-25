
// Função pura - sempre retorna o mesmo resultado
int calcularQuadrado(int numero) {
  return numero * numero;
}

// Demonstração de função pura vs impura
class ExemploFuncoesPuras {
  static void demonstrar() {
    // Função pura
    print('Quadrado de 5: ${calcularQuadrado(5)}');
    print('Quadrado de 5 novamente: ${calcularQuadrado(5)}');

    // Função impura com estado global
    ContadorImpuro contador = ContadorImpuro();
    print('Primeiro incremento: ${contador.incrementar(10)}');
    print('Segundo incremento: ${contador.incrementar(10)}');
  }
}

class ContadorImpuro {
  int _contagem = 0;

  // Função impura - resultado muda a cada chamada
  int incrementar(int valor) {
    _contagem++;
    return valor + _contagem;
  }
}

void main() {
  ExemploFuncoesPuras.demonstrar();
}