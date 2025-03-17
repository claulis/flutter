void main() {
  print('==== Operadores de Atribuição em Dart ====\n');
  
  // Atribuição simples
  int x = 10;
  print('Valor inicial de x: $x');
  
  // Atribuição com operação
  x += 5;  // x = x + 5
  print('Após x += 5: $x');
  
  x -= 3;  // x = x - 3
  print('Após x -= 3: $x');
  
  x *= 2;  // x = x * 2
  print('Após x *= 2: $x');
  
  // Nota: x se torna double após divisão
  num y = x;
  y /= 6;  // y = y / 6
  print('Após y /= 6: $y');
  
  // Voltando para int para os próximos exemplos
  int z = 10;
  z ~/= 2;  // z = z ~/ 2 (divisão inteira)
  print('Após z ~/= 2: $z');
  
  z %= 3;  // z = z % 3 (resto da divisão)
  print('Após z %= 3: $z');
  
  // Atribuição condicional
  print('\n==== Atribuição Condicional ====');
  
  var a = null;
  print('Valor inicial de a: $a');
  
  a ??= 10;  // atribui apenas se a for null
  print('Após a ??= 10: $a');
  
  a ??= 20;  // não atribui pois a já não é null
  print('Após a ??= 20: $a');
}