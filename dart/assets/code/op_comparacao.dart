void main() {
  print('==== Operadores de Comparação em Dart ====\n');
  
  int a = 5;
  int b = 10;
  
  print('Valores: a = $a, b = $b\n');
  
  // Igualdade
  bool igual = a == b;
  print('a == b: $igual');
  
  // Diferença
  bool diferente = a != b;
  print('a != b: $diferente');
  
  // Maior que
  bool maior = a > b;
  print('a > b: $maior');
  
  // Menor que
  bool menor = a < b;
  print('a < b: $menor');
  
  // Maior ou igual
  bool maiorOuIgual = a >= b;
  print('a >= b: $maiorOuIgual');
  
  // Menor ou igual
  bool menorOuIgual = a <= b;
  print('a <= b: $menorOuIgual');
  
  // Exemplo de uso em condições
  print('\n==== Uso em condições if ====');
  
  if (a < b) {
    print('a é menor que b');
  } else {
    print('a não é menor que b');
  }
  
  // Verificando tipos
  print('\n==== Verificando tipos ====');
  
  var valor = 'texto';
  print('valor é String? ${valor is String}');
  print('valor não é int? ${valor is! int}');
}