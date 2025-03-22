void main() {
  // Transformações com map
  List<int> numeros = [1, 2, 3, 4, 5];
  var dobrados = numeros.map((n) => n * 2).toList();
  print('Números dobrados: $dobrados');
  
  // Filtros com where
  var impares = numeros.where((n) => n % 2 != 0).toList();
  print('Números ímpares: $impares');
  
  // Redução com reduce
  var soma = numeros.reduce((valor, elemento) => valor + elemento);
  print('Soma dos números: $soma');
  
  // Redução com fold (permite especificar valor inicial)
  var somaComInicial = numeros.fold(10, (valor, elemento) => valor + elemento);
  print('Soma dos números com inicial 10: $somaComInicial');
  
  // every - verifica se todos os elementos atendem a uma condição
  bool todosMenoresQue10 = numeros.every((n) => n < 10);
  print('Todos são menores que 10? $todosMenoresQue10');
  
  // any - verifica se pelo menos um elemento atende a uma condição
  bool peloMenosUmMaiorQue4 = numeros.any((n) => n > 4);
  print('Pelo menos um maior que 4? $peloMenosUmMaiorQue4');
  
  // firstWhere - encontra o primeiro elemento que atende a uma condição
  var primeiroPar = numeros.firstWhere(
    (n) => n % 2 == 0,
    orElse: () => -1, // valor padrão se nenhum for encontrado
  );
  print('Primeiro número par: $primeiroPar');
  
  // lastWhere - encontra o último elemento que atende a uma condição
  var ultimoPar = numeros.lastWhere(
    (n) => n % 2 == 0,
    orElse: () => -1,
  );
  print('Último número par: $ultimoPar');
  
  // Combinando operações
  List<Map<String, dynamic>> produtos = [
    {'nome': 'Laptop', 'preco': 5000, 'disponivel': true},
    {'nome': 'Mouse', 'preco': 120, 'disponivel': true},
    {'nome': 'Monitor', 'preco': 1500, 'disponivel': false},
    {'nome': 'Teclado', 'preco': 200, 'disponivel': true},
  ];
  
  // Encontrar produtos disponíveis, obter seus nomes, e ordená-los
  var produtosDisponiveis = produtos
      .where((p) => p['disponivel'] == true)
      .map((p) => p['nome'] as String)
      .toList()
      ..sort();
  
  print('Produtos disponíveis: $produtosDisponiveis');
  
  // Calcular o valor total de produtos disponíveis
  var valorTotal = produtos
      .where((p) => p['disponivel'] == true)
      .map((p) => p['preco'] as int)
      .fold(0, (prev, preco) => prev + preco);
  
  print('Valor total dos produtos disponíveis: $valorTotal');
  
  // Agrupamento com group by (Dart 2.18+)
  // Esta funcionalidade requer Dart 2.18 ou superior
  Map<bool, List<Map<String, dynamic>>> produtosAgrupados = {};
  
  for (var produto in produtos) {
    bool disponivel = produto['disponivel'];
    if (!produtosAgrupados.containsKey(disponivel)) {
      produtosAgrupados[disponivel] = [];
    }
    produtosAgrupados[disponivel]!.add(produto);
  }
  
  print('Produtos agrupados por disponibilidade: ');
  produtosAgrupados.forEach((disponivel, lista) {
    print('${disponivel ? "Disponíveis" : "Indisponíveis"}: ${lista.length} produtos');
  });
}