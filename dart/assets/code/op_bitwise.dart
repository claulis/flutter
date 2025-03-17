void main() {
  print('==== Operadores Bitwise em Dart ====\n');
  
  int a = 5;  // 101 em binário
  int b = 3;  // 011 em binário
  
  print('Valores: a = $a (${a.toRadixString(2)}), b = $b (${b.toRadixString(2)})\n');
  
  // AND bitwise (&)
  int bitwiseAnd = a & b;
  print('a & b = $bitwiseAnd (${bitwiseAnd.toRadixString(2)})');
  
  // OR bitwise (|)
  int bitwiseOr = a | b;
  print('a | b = $bitwiseOr (${bitwiseOr.toRadixString(2)})');
  
  // XOR bitwise (^)
  int bitwiseXor = a ^ b;
  print('a ^ b = $bitwiseXor (${bitwiseXor.toRadixString(2)})');
  
  // NOT bitwise (~)
  int bitwiseNot = ~a;
  print('~a = $bitwiseNot (${bitwiseNot.toRadixString(2)})');
  
  // Deslocamento à esquerda (<<)
  int leftShift = a << 1;
  print('a << 1 = $leftShift (${leftShift.toRadixString(2)})');
  
  // Deslocamento à direita (>>)
  int rightShift = a >> 1;
  print('a >> 1 = $rightShift (${rightShift.toRadixString(2)})');
  
  print('\n==== Exemplo de uso prático ====');
  
  // Verificando se um número é par usando AND bitwise
  int numero = 42;
  bool ePar = (numero & 1) == 0;
  print('O número $numero é par? $ePar');
  
  // Verificando se um número é ímpar usando AND bitwise
  int outroNumero = 37;
  bool eImpar = (outroNumero & 1) == 1;
  print('O número $outroNumero é ímpar? $eImpar');
}