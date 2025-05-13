void verificarIdade(int idade) {
  if (idade < 0) {
    throw Exception('Idade não pode ser negativa');
  }
  print('Idade válida: $idade');
}

void main() {
  try {
    try {
      verificarIdade(-5);
    } catch (e) {
      print('Erro interno: $e');
      rethrow; // Relança a exceção
    }
  } catch (e) {
    print('Erro capturado no nível superior: $e');
  }
}