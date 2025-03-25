

class ExemploOperacoesFuncionais {
  static void demonstrar() {
    List<int> numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    // Map: Transformar cada elemento
    print('Quadrados:');
    var quadrados = numeros.map((n) => n * n);
    print(quadrados);

    // Filter: Filtrar elementos
    print('\nNúmeros pares:');
    var pares = numeros.where((n) => n % 2 == 0);
    print(pares);

    // Reduce: Reduzir a um único valor
    print('\nSoma de todos os números:');
    var soma = numeros.reduce((atual, proximo) => atual + proximo);
    print(soma);

    // Combinando operações
    print('\nSoma dos quadrados dos números pares:');
    var somaPares = numeros
        .where((n) => n % 2 == 0)  // Filtrar pares
        .map((n) => n * n)          // Elevar ao quadrado
        .reduce((a, b) => a + b);   // Somar
    print(somaPares);
  }
}

void main() {
  ExemploOperacoesFuncionais.demonstrar();
}