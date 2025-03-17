// Arquivo: numeros.dart
// Demonstração dos tipos numéricos em Dart: int e double

import 'dart:math';

void main() {
  print('=== NÚMEROS EM DART ===\n');
  
  // === INT ===
  print('--- Tipo int ---');
  
  // Declaração de inteiros
  int idade = 25;
  int populacao = 7800000000;
  int negativo = -42;
  
  print('Idade: $idade');
  print('População mundial: $populacao');
  print('Número negativo: $negativo');
  
  // Operações com inteiros
  int soma = 5 + 3;
  int subtracao = 10 - 4;
  int multiplicacao = 3 * 7;
  int divisaoInteira = 7 ~/ 2; // Divisão com resultado inteiro usando ~/
  int resto = 7 % 3;           // Resto da divisão (módulo)
  
  print('\nOperações com int:');
  print('5 + 3 = $soma');
  print('10 - 4 = $subtracao');
  print('3 * 7 = $multiplicacao');
  print('7 ~/ 2 = $divisaoInteira (divisão inteira)');
  print('7 % 3 = $resto (resto da divisão)');
  
  // === DOUBLE ===
  print('\n--- Tipo double ---');
  
  // Declaração de doubles
  double altura = 1.75;
  double preco = 19.99;
  double temperatura = -5.3;
  double notacao = 1.2e3;   // Notação científica (1200.0)
  
  print('Altura: $altura m');
  print('Preço: R\$ $preco');
  print('Temperatura: ${temperatura}°C');
  print('Notação científica 1.2e3: $notacao');
  
  // Operações com doubles
  double somaDouble = 5.5 + 3.2;
  double subtracaoDouble = 10.7 - 4.2;
  double multiplicacaoDouble = 3.5 * 2;
  double divisaoDouble = 7 / 2;          // Divisão normal retorna double
  
  print('\nOperações com double:');
  print('5.5 + 3.2 = $somaDouble');
  print('10.7 - 4.2 = $subtracaoDouble');
  print('3.5 * 2 = $multiplicacaoDouble');
  print('7 / 2 = $divisaoDouble (divisão normal)');
  
  // Constantes especiais
  double infinito = double.infinity;
  double naoNumero = double.nan;  // Not a Number
  
  print('\nValores especiais:');
  print('Infinito: $infinito');
  print('NaN (Not a Number): $naoNumero');
  print('É infinito?: ${infinito.isInfinite}');
  print('É NaN?: ${naoNumero.isNaN}');
  
  // === OPERAÇÕES MATEMÁTICAS ===
  print('\n--- Operações matemáticas ---');
  
  // Valor absoluto
  int numeroNegativo = -5;
  int absoluto = numeroNegativo.abs();
  print('Valor absoluto de $numeroNegativo: $absoluto');
  
  // Arredondamento
  double d = 3.7;
  int arredondado = d.round();  // 4
  int paraBaixo = d.floor();    // 3
  int paraCima = d.ceil();      // 4
  
  print('\nArredondamento de $d:');
  print('round(): $arredondado (mais próximo)');
  print('floor(): $paraBaixo (para baixo)');
  print('ceil(): $paraCima (para cima)');
  
  // Potenciação e raiz quadrada
  double base = 2;
  double expoente = 3;
  double potencia = pow(base, expoente) as double;
  double raiz = sqrt(16);
  
  print('\nOperações avançadas:');
  print('$base elevado a $expoente: $potencia');
  print('Raiz quadrada de 16: $raiz');
  
  // Máximo e mínimo
  int maximo = max(5, 10);
  int minimo = min(5, 10);
  
  print('\nComparações:');
  print('Maior valor entre 5 e 10: $maximo');
  print('Menor valor entre 5 e 10: $minimo');
  
  // Trigonometria
  double seno = sin(pi / 2);
  double cosseno = cos(pi);
  
  print('\nTrigonometria:');
  print('Seno de π/2: $seno');
  print('Cosseno de π: $cosseno');
  print('Valor de π: $pi');
}