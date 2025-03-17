void main() {
  print('==== Operadores Aritméticos em Dart ====\n');
  
  // Adição
  int soma = 5 + 3;
  print('Adição: 5 + 3 = $soma');
  
  // Subtração
  int diferenca = 10 - 4;
  print('Subtração: 10 - 4 = $diferenca');
  
  // Multiplicação
  int produto = 3 * 4;
  print('Multiplicação: 3 * 4 = $produto');
  
  // Divisão (retorna double)
  double quociente = 10 / 3;
  print('Divisão: 10 / 3 = $quociente');
  
  // Divisão inteira
  int divisaoInteira = 10 ~/ 3;
  print('Divisão inteira: 10 ~/ 3 = $divisaoInteira');
  
  // Módulo (resto da divisão)
  int resto = 10 % 3;
  print('Módulo: 10 % 3 = $resto');
  
  // Incremento e decremento
  print('\n==== Incremento e Decremento ====');
  
  int a = 5;
  print('Valor inicial de a: $a');
  
  // Pós-incremento
  int posIncremento = a++;
  print('Pós-incremento: posIncremento = $posIncremento, a = $a');
  
  // Pré-incremento
  int preIncremento = ++a;
  print('Pré-incremento: preIncremento = $preIncremento, a = $a');
  
  int b = 5;
  print('\nValor inicial de b: $b');
  
  // Pós-decremento
  int posDecremento = b--;
  print('Pós-decremento: posDecremento = $posDecremento, b = $b');
  
  // Pré-decremento
  int preDecremento = --b;
  print('Pré-decremento: preDecremento = $preDecremento, b = $b');
}