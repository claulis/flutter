void main() {
  print('==== Operadores Lógicos em Dart ====\n');
  
  bool x = true;
  bool y = false;
  
  print('Valores: x = $x, y = $y\n');
  
  // AND lógico (&&)
  bool and = x && y;
  print('x && y: $and');
  
  // OR lógico (||)
  bool or = x || y;
  print('x || y: $or');
  
  // NOT lógico (!)
  bool notX = !x;
  bool notY = !y;
  print('!x: $notX');
  print('!y: $notY');
  
  // Exemplos de uso em condições
  print('\n==== Exemplos de uso em condições ====');
  
  if (x && !y) {
    print('x é verdadeiro E y é falso');
  }
  
  if (x || y) {
    print('x OU y é verdadeiro');
  }
  
  // Exemplo com condições combinadas
  bool z = true;
  print('\nAdicionando z = $z');
  
  if (x && (y || z)) {
    print('x é verdadeiro E (y OU z é verdadeiro)');
  }
  
  // Uso com operador condicional
  String resultado = (x && z) ? 'Ambos verdadeiros' : 'Pelo menos um falso';
  print('\nResultado do operador condicional: $resultado');
}