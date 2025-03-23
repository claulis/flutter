
// Este arquivo demonstra o uso de funções de ordem superior em Dart.
// Uma função de ordem superior é uma função que recebe outra função
// como parâmetro ou retorna uma função como resultado.

// ===== Definição de funções auxiliares =====

// Função que será passada como parâmetro
int somar(int a, int b) {
  return a + b;
}

// Outra função para ser passada como parâmetro
int multiplicar(int a, int b) {
  return a * b;
}

// Função que verifica se um número é par
bool ehPar(int numero) {
  return numero % 2 == 0;
}

// Função que verifica se um número é ímpar
bool ehImpar(int numero) {
  return numero % 2 != 0;
}

// ===== Exemplo 1: Função que recebe outra função como parâmetro =====

/// Função de ordem superior que aplica uma operação (função) aos números fornecidos
/// e retorna o resultado
int calcular(int a, int b, int Function(int, int) operacao) {
  print('Calculando usando uma função passada como parâmetro...');
  return operacao(a, b);
}

// ===== Exemplo 2: Função que retorna outra função =====

/// Cria e retorna uma função que aplica um fator de multiplicação
/// Este é um exemplo de factory function
Function criarMultiplicador(int fator) {
  // Retorna uma função anônima que captura o 'fator'
  return (int numero) => numero * fator;
}

// ===== Exemplo 3: Função que processa uma lista usando um predicado =====

/// Filtra uma lista de números com base em uma função predicado (retorna true/false)
List<int> filtrar(List<int> numeros, bool Function(int) predicado) {
  List<int> resultado = [];
  
  for (var numero in numeros) {
    if (predicado(numero)) {
      resultado.add(numero);
    }
  }
  
  return resultado;
}

// ===== Exemplo 4: Função que transforma cada elemento usando uma função =====

/// Aplica uma transformação a cada elemento da lista
List<R> transformar<T, R>(List<T> items, R Function(T) transformacao) {
  List<R> resultado = [];
  
  for (var item in items) {
    resultado.add(transformacao(item));
  }
  
  return resultado;
}

// ===== Exemplo 5: Composição de funções =====

/// Cria uma nova função que é a composição de duas funções
/// Ou seja, aplica g(f(x))
Function compor(Function f, Function g) {
  return (x) => g(f(x));
}

// Função principal
void main() {
  print('=== FUNÇÕES DE ORDEM SUPERIOR EM DART ===\n');
  
  // ===== Demonstração do Exemplo 1 =====
  print('=== Exemplo 1: Função que recebe outra função como parâmetro ===');
  int resultado1 = calcular(5, 3, somar);
  int resultado2 = calcular(5, 3, multiplicar);
  
  print('5 + 3 = $resultado1');
  print('5 * 3 = $resultado2');
  
  // Usando função anônima diretamente como parâmetro
  int resultado3 = calcular(5, 3, (a, b) => a - b);
  print('5 - 3 = $resultado3');
  
  // ===== Demonstração do Exemplo 2 =====
  print('\n=== Exemplo 2: Função que retorna outra função ===');
  
  // Criando funções multiplicadoras
  var dobrar = criarMultiplicador(2);
  var triplicar = criarMultiplicador(3);
  var quintuplicar = criarMultiplicador(5);
  
  print('Dobro de 7: ${dobrar(7)}');
  print('Triplo de 7: ${triplicar(7)}');
  print('Quíntuplo de 7: ${quintuplicar(7)}');
  
  // ===== Demonstração do Exemplo 3 =====
  print('\n=== Exemplo 3: Filtrando com função predicado ===');
  
  List<int> numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  print('Lista original: $numeros');
  
  // Filtrando usando funções nomeadas
  List<int> numerosPares = filtrar(numeros, ehPar);
  List<int> numerosImpares = filtrar(numeros, ehImpar);
  
  print('Números pares: $numerosPares');
  print('Números ímpares: $numerosImpares');
  
  // Filtrando com funções anônimas
  List<int> maioresQueCinco = filtrar(numeros, (n) => n > 5);
  List<int> divisivelPorTres = filtrar(numeros, (n) => n % 3 == 0);
  
  print('Números maiores que 5: $maioresQueCinco');
  print('Números divisíveis por 3: $divisivelPorTres');
  
  // ===== Demonstração do Exemplo 4 =====
  print('\n=== Exemplo 4: Transformando elementos ===');
  
  // Transformar números em suas representações de texto
  List<String> textosNumeros = transformar<int, String>(numeros, (n) => 'Número: $n');
  print('Números transformados em texto: $textosNumeros');
  
  // Calcular quadrados
  List<int> quadrados = transformar<int, int>(numeros, (n) => n * n);
  print('Quadrados dos números: $quadrados');
  
  // ===== Demonstração do Exemplo 5 =====
  print('\n=== Exemplo 5: Composição de funções ===');
  
  // Definindo funções simples para compor
  int dobro(int x) => x * 2;
  int incrementar(int x) => x + 1;
  
  // Compondo funções de diferentes maneiras
  var dobroDoIncremento = compor(incrementar, dobro); // dobro(incrementar(x))
  var incrementoDoDobro = compor(dobro, incrementar); // incrementar(dobro(x))
  
  print('Dobro do incremento de 5: ${dobroDoIncremento(5)}'); // dobro(5+1) = dobro(6) = 12
  print('Incremento do dobro de 5: ${incrementoDoDobro(5)}'); // incrementar(5*2) = incrementar(10) = 11
  
  // ===== Exemplo 6: Aplicação prática - processamento de dados =====
  print('\n=== Exemplo 6: Processamento de dados com funções de ordem superior ===');
  
  List<Map<String, dynamic>> produtos = [
    {'nome': 'Notebook', 'preco': 3500.0, 'estoque': 10},
    {'nome': 'Mouse', 'preco': 120.0, 'estoque': 50},
    {'nome': 'Teclado', 'preco': 250.0, 'estoque': 30},
    {'nome': 'Monitor', 'preco': 1200.0, 'estoque': 15},
    {'nome': 'Headset', 'preco': 350.0, 'estoque': 5},
  ];
  
  // Função para processar uma lista de produtos com uma estratégia personalizada
  List<Map<String, dynamic>> processarProdutos(
    List<Map<String, dynamic>> produtos,
    bool Function(Map<String, dynamic>) filtro,
    Map<String, dynamic> Function(Map<String, dynamic>) transformacao
  ) {
    List<Map<String, dynamic>> resultado = [];
    
    for (var produto in produtos) {
      if (filtro(produto)) {
        resultado.add(transformacao(produto));
      }
    }
    
    return resultado;
  }
  
  // Usando a função de ordem superior para processar produtos
  var produtosProcessados = processarProdutos(
    produtos,
    (p) => p['preco'] > 200.0 && p['estoque'] > 5, // Filtro
    (p) { // Transformação
      return {
        'nome': p['nome'],
        'valor_total': p['preco'] * p['estoque'],
        'disponivel': p['estoque'] > 0 ? 'Sim' : 'Não'
      };
    }
  );
  
  print('Produtos processados: ');
  for (var produto in produtosProcessados) {
    print('${produto['nome']} - Valor total: ${produto['valor_total']} - Disponível: ${produto['disponivel']}');
  }
}