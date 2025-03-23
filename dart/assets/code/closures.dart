
// Este arquivo demonstra o uso de closures em Dart.
// Uma closure é uma função que tem acesso a variáveis do escopo
// onde foi definida, mesmo após a execução desse escopo ter terminado.

import 'dart:math' as math;

void main() {
  print('=== CLOSURES EM DART ===\n');
  
  // ===== Exemplo 1: Closure básica =====
  print('=== Exemplo 1: Closure básica ===');
  
  // Função que retorna uma closure
  Function criarContador() {
    int contador = 0; // Variável do escopo externo
    
    // Esta função anônima é uma closure, pois mantém acesso ao 'contador'
    return () {
      contador++; // Acessa e modifica a variável do escopo externo
      return contador;
    };
  }
  
  // Criando duas instâncias independentes da closure
  var contador1 = criarContador();
  var contador2 = criarContador();
  
  // Cada closure mantém sua própria cópia da variável 'contador'
  print('Contador 1 - Chamada 1: ${contador1()}'); // 1
  print('Contador 1 - Chamada 2: ${contador1()}'); // 2
  print('Contador 1 - Chamada 3: ${contador1()}'); // 3
  
  print('Contador 2 - Chamada 1: ${contador2()}'); // 1
  print('Contador 2 - Chamada 2: ${contador2()}'); // 2
  
  // ===== Exemplo 2: Closure com parâmetros =====
  print('\n=== Exemplo 2: Closure com parâmetros ===');
  
  // Função que cria uma closure de multiplicação
  Function(int) multiplicadorPor(int fator) {
    // A closure captura o 'fator' do escopo externo
    return (int numero) => numero * fator;
  }
  
  // Criando closures específicas
  var dobrar = multiplicadorPor(2);
  var triplicar = multiplicadorPor(3);
  var multiplicarPor10 = multiplicadorPor(10);
  
  print('Dobro de 7: ${dobrar(7)}');
  print('Triplo de 7: ${triplicar(7)}');
  print('10 vezes 7: ${multiplicarPor10(7)}');
  
  // ===== Exemplo 3: Closure mantendo estado =====
  print('\n=== Exemplo 3: Closure mantendo estado entre chamadas ===');
  
  // Função que cria um gerenciador de carrinho de compras
  Map<String, dynamic> criarGerenciadorCarrinho() {
    // Estado interno
    List<String> itens = [];
    double total = 0.0;
    
    // Closures que manipulam o estado
    void adicionarItem(String item, double preco) {
      itens.add(item);
      total += preco;
      print('Item adicionado: $item - R\$ $preco');
    }
    
    void removerItem(String item, double preco) {
      if (itens.contains(item)) {
        itens.remove(item);
        total -= preco;
        print('Item removido: $item - R\$ $preco');
      } else {
        print('Item não encontrado: $item');
      }
    }
    
    Map<String, dynamic> resumoCarrinho() {
      return {
        'itens': List.from(itens), // Cópia para evitar modificação externa
        'total': total,
        'quantidade': itens.length
      };
    }
    
    // Retorna as closures empacotadas
    return {
      'adicionar': adicionarItem,
      'remover': removerItem,
      'resumo': resumoCarrinho
    };
  }
  
  // Usando o gerenciador de carrinho
  var carrinho = criarGerenciadorCarrinho();
  var adicionar = carrinho['adicionar'] as Function(String, double);
  var remover = carrinho['remover'] as Function(String, double);
  var resumo = carrinho['resumo'] as Function();
  
  adicionar('Notebook', 3500.0);
  adicionar('Mouse', 120.0);
  adicionar('Teclado', 250.0);
  
  print('Resumo do carrinho: ${resumo()}');
  
  remover('Mouse', 120.0);
  
  print('Resumo atualizado: ${resumo()}');
  
  // ===== Exemplo 4: Closures e loops =====
  print('\n=== Exemplo 4: Closures em loops (problema comum) ===');
  
  // Lista para armazenar funções
  List<Function> funcoes = [];
  
  // PROBLEMA: Todas as closures capturarão o mesmo 'i'
  print('Abordagem problemática:');
  for (var i = 0; i < 5; i++) {
    funcoes.add(() => print('Valor de i: $i'));
  }
  
  // Executando as funções - todas mostrarão i = 5
  for (var funcao in funcoes) {
    funcao();
  }
  
  // SOLUÇÃO: Usar um parâmetro para fixar o valor
  print('\nAbordagem correta:');
  funcoes = []; // Limpar a lista
  
  for (var i = 0; i < 5; i++) {
    // Função que recebe 'i' como parâmetro e retorna uma closure
    funcoes.add(((int capturedI) {
      return () => print('Valor capturado: $capturedI');
    })(i)); // Invoca imediatamente com o valor atual de i
  }
  
  // Executando as funções - cada uma mostrará seu próprio valor
  for (var funcao in funcoes) {
    funcao();
  }
  
  // ===== Exemplo 5: Closures para memoização (cache) =====
  print('\n=== Exemplo 5: Closure para memoização ===');
  
  // Função que cria uma closure para calcular Fibonacci com memoização
  Function(int) criarCalculadoraFibonacci() {
    // Cache para armazenar resultados já calculados
    Map<int, int> cache = {};
    
    // Função recursiva que utiliza o cache
    int fibonacci(int n) {
      // Verifica se o resultado já está no cache
      if (cache.containsKey(n)) {
        print('Usando cache para fib($n)');
        return cache[n]!;
      }
      
      // Calcula o valor se não estiver no cache
      print('Calculando fib($n)');
      int resultado;
      
      if (n <= 1) {
        resultado = n;
      } else {
        resultado = fibonacci(n - 1) + fibonacci(n - 2);
      }
      
      // Armazena no cache para uso futuro
      cache[n] = resultado;
      return resultado;
    }
    
    // Retorna a closure que tem acesso ao cache
    return fibonacci;
  }
  
  // Criando a calculadora
  var calcularFibonacci = criarCalculadoraFibonacci();
  
  // Primeira chamada - cálculo completo
  print('Fibonacci de 6: ${calcularFibonacci(6)}');
  
  // Segunda chamada - usa valores em cache
  print('\nFibonacci de 6 novamente: ${calcularFibonacci(6)}');
  
  // ===== Exemplo 6: Closure para configuração de função =====
  print('\n=== Exemplo 6: Closure para configuração de função ===');
  
  // Função que configura um formatador de texto
  Function(String) criarFormatador({
    bool maiusculas = false,
    bool prefixo = false,
    String prefixoTexto = '>> ',
    bool sufixo = false,
    String sufixoTexto = ' <<'
  }) {
    // A closure captura todas as opções de configuração
    return (String texto) {
      String resultado = texto;
      
      if (maiusculas) {
        resultado = resultado.toUpperCase();
      }
      
      if (prefixo) {
        resultado = '$prefixoTexto$resultado';
      }
      
      if (sufixo) {
        resultado = '$resultado$sufixoTexto';
      }
      
      return resultado;
    };
  }
  
  // Criando diferentes formatadores
  var formatadorPadrao = criarFormatador();
  var formatadorDestaque = criarFormatador(prefixo: true, sufixo: true);
  var formatadorGrito = criarFormatador(maiusculas: true, sufixo: true, sufixoTexto: '!!!');
  
  print('Texto normal: ${formatadorPadrao('Olá, mundo')}');
  print('Texto destacado: ${formatadorDestaque('Olá, mundo')}');
  print('Texto gritando: ${formatadorGrito('Olá, mundo')}');
}