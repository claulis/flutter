
// Este arquivo demonstra diferentes formas de definir funções em Dart.

// Importações necessárias

/// Função com tipo de retorno explícito
/// Recebe dois números inteiros e retorna sua soma
int somar(int a, int b) {
  return a + b;
}

/// Função void (não retorna valor)
/// Apenas exibe uma mensagem formatada no console
void exibirResultado(String operacao, dynamic resultado) {
  print('O resultado da operação $operacao é: $resultado');
}

/// Função com expressão única usando sintaxe de seta (=>)
/// Calcula o quadrado de um número
double quadrado(double numero) => numero * numero;

/// Função com lógica mais complexa
/// Verifica se um número é primo
bool ehPrimo(int numero) {
  if (numero <= 1) return false;
  if (numero <= 3) return true;
  if (numero % 2 == 0 || numero % 3 == 0) return false;
  
  for (int i = 5; i * i <= numero; i += 6) {
    if (numero % i == 0 || numero % (i + 2) == 0) return false;
  }
  
  return true;
}

/// Função com múltiplos valores de retorno usando uma lista
List<int> calcularMinMax(List<int> numeros) {
  if (numeros.isEmpty) return [0, 0];
  
  int min = numeros[0];
  int max = numeros[0];
  
  for (int numero in numeros) {
    if (numero < min) min = numero;
    if (numero > max) max = numero;
  }
  
  return [min, max];
}

// Função principal para demonstrar o uso das funções definidas
void main() {
  // Usando a função somar
  int resultadoSoma = somar(5, 3);
  exibirResultado('soma', resultadoSoma);
  
  // Usando a função quadrado com sintaxe de seta
  double resultadoQuadrado = quadrado(4.5);
  exibirResultado('quadrado', resultadoQuadrado);
  
  // Verificando números primos
  int numeroPrimo = 17;
  int naoEhPrimo = 20;
  print('$numeroPrimo é primo? ${ehPrimo(numeroPrimo)}');
  print('$naoEhPrimo é primo? ${ehPrimo(naoEhPrimo)}');
  
  // Usando função que retorna múltiplos valores
  List<int> numeros = [7, 2, 9, 4, 5];
  List<int> minMax = calcularMinMax(numeros);
  print('Na lista $numeros, o valor mínimo é ${minMax[0]} e o máximo é ${minMax[1]}');
}