void main() {
  try {
    int resultado = 10 ~/ 0; // Divisão por zero gera uma exceção
    print('Resultado: $resultado');
  } catch (e) {
    print('Erro capturado: $e');
  } finally {
    print('Bloco finally: sempre executado.');
  }
}