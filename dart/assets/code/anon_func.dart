
// Este arquivo demonstra o uso de funções anônimas (lambda) em Dart.

import 'dart:math' as math;

void main() {
  print('=== FUNÇÕES ANÔNIMAS EM DART ===\n');
  
  // Lista para demonstrar exemplos
  List<int> numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  print('Lista original: $numeros');
  
  // ===== Exemplo 1: Função anônima com sintaxe completa =====
  print('\n=== Exemplo 1: Função anônima básica ===');
  
  // Usando forEach com função anônima para imprimir cada número
  print('Imprimindo cada número:');
  numeros.forEach((numero) {
    print('Número: $numero');
  });
  
  // ===== Exemplo 2: Função anônima com sintaxe de seta =====
  print('\n=== Exemplo 2: Função anônima com sintaxe de seta ===');
  
  // Usando map com uma função anônima de seta para dobrar cada número
  List<int> duplicados = numeros.map((numero) => numero * 2).toList();
  print('Números duplicados: $duplicados');
  
  // ===== Exemplo 3: Funções anônimas como argumentos =====
  print('\n=== Exemplo 3: Função anônima como argumento ===');
  
  // Filtrando números pares usando função anônima
  List<int> pares = numeros.where((numero) => numero % 2 == 0).toList();
  print('Números pares: $pares');
  
  // Encontrando o primeiro número maior que 5
  int? primeiroPGrandinho = numeros.firstWhere(
    (numero) => numero > 5,
    orElse: () => -1,
  );
  print('Primeiro número maior que 5: $primeiroPGrandinho');
  
  // ===== Exemplo 4: Armazenando funções anônimas em variáveis =====
  print('\n=== Exemplo 4: Armazenando funções anônimas em variáveis ===');
  
  // Definindo uma função anônima e armazenando em uma variável
  var ehPar = (int numero) => numero % 2 == 0;
  var ehPositivo = (int numero) => numero > 0;
  
  // Usando funções armazenadas
  print('Verificando cada número:');
  for (var numero in numeros) {
    print('$numero - Par: ${ehPar(numero)}, Positivo: ${ehPositivo(numero)}');
  }
  
  // ===== Exemplo 5: Função anônima com múltiplas linhas =====
  print('\n=== Exemplo 5: Função anônima com múltiplas linhas ===');
  
  // Função anônima para classificar números
  var classificarNumero = (int numero) {
    if (numero % 2 == 0) {
      if (numero % 3 == 0) return 'Divisível por 2 e 3';
      return 'Par';
    } else {
      if (numero % 3 == 0) return 'Divisível por 3';
      return 'Ímpar';
    }
  };
  
  // Usar a função anônima para classificar todos os números
  List<String> classificacoes = numeros.map(classificarNumero).toList();
  for (int i = 0; i < numeros.length; i++) {
    print('${numeros[i]} é ${classificacoes[i]}');
  }
  
  // ===== Exemplo 6: Ordenação personalizada =====
  print('\n=== Exemplo 6: Ordenação personalizada com função anônima ===');
  
  List<String> frutas = ['maçã', 'banana', 'laranja', 'abacaxi', 'uva', 'kiwi'];
  print('Lista de frutas original: $frutas');
  
  // Ordenando por tamanho da string usando função anônima
  frutas.sort((a, b) => a.length.compareTo(b.length));
  print('Frutas ordenadas por tamanho: $frutas');
  
  // Ordenando alfabeticamente
  frutas.sort((a, b) => a.compareTo(b));
  print('Frutas ordenadas alfabeticamente: $frutas');
  
  // ===== Exemplo 7: Redução (reduce) com função anônima =====
  print('\n=== Exemplo 7: Redução com função anônima ===');
  
  // Somando todos os números usando reduce
  int soma = numeros.reduce((valorAcumulado, elemento) => valorAcumulado + elemento);
  print('Soma de todos os números: $soma');
  
  // Encontrando o maior número
  int maior = numeros.reduce((max, elemento) => math.max(max, elemento));
  print('Maior número: $maior');
  
  // ===== Exemplo 8: Função anônima como callback assíncrono (simulado) =====
  print('\n=== Exemplo 8: Função anônima como callback ===');
  
  // Simulando uma função que executa uma operação e chama um callback
  void buscarDadosDoServidor(Function(String) onSucesso, Function(String) onErro) {
    // Simulando operação assíncrona
    bool sucesso = math.Random().nextBool();
    
    if (sucesso) {
      onSucesso('Dados recebidos com sucesso!');
    } else {
      onErro('Falha ao receber dados.');
    }
  }
  
  // Chamando com funções anônimas como callbacks
  buscarDadosDoServidor(
    (mensagem) => print('Sucesso: $mensagem'),
    (erro) => print('Erro: $erro')
  );
}