void main() {
  List<String> frutas = ['maçã', 'banana', 'laranja', 'uva', 'pera'];
  Map<String, double> precos = {
    'maçã': 3.5,
    'banana': 2.0,
    'laranja': 4.0,
    'uva': 6.0,
    'pera': 5.5,
  };
  Set<int> numeros = {1, 2, 3, 4, 5};
  
  // Iteração em listas
  
  // for tradicional com índice
  print('Iteração com for tradicional:');
  for (int i = 0; i < frutas.length; i++) {
    print('Fruta $i: ${frutas[i]}');
  }
  
  // for-in loop (recomendado para a maioria dos casos)
  print('\nIteração com for-in:');
  for (var fruta in frutas) {
    print('Fruta: $fruta');
  }
  
  // forEach com função anônima
  print('\nIteração com forEach:');
  frutas.forEach((fruta) {
    print('Fruta: $fruta');
  });
  
  // forEach com arrow function
  print('\nIteração com forEach e arrow function:');
  frutas.forEach((fruta) => print('Fruta: $fruta'));
  
  // Iterando com índice usando forEach
  print('\nIteração com índice usando forEach:');
  frutas.asMap().forEach((indice, fruta) {
    print('Fruta $indice: $fruta');
  });
  
  // Iteração em mapas
  
  // Iterando sobre entradas
  print('\nIteração sobre entradas do mapa:');
  for (var entrada in precos.entries) {
    print('${entrada.key}: R\$ ${entrada.value}');
  }
  
  // Iterando sobre chaves
  print('\nIteração sobre chaves do mapa:');
  for (var fruta in precos.keys) {
    print('Fruta: $fruta, Preço: R\$ ${precos[fruta]}');
  }
  
  // Usando forEach
  print('\nIteração em mapa com forEach:');
  precos.forEach((fruta, preco) {
    print('$fruta custa R\$ $preco');
  });
  
  // Iteração em sets
  
  // usando for-in
  print('\nIteração em set com for-in:');
  for (var numero in numeros) {
    print('Número: $numero');
  }
  
  // forEach em set
  print('\nIteração em set com forEach:');
  numeros.forEach((numero) => print('Número: $numero'));
  
  // Iteração com transformação
  
  // map durante a iteração
  print('\nTransformação durante iteração:');
  frutas.map((fruta) => fruta.toUpperCase()).forEach(print);
  
  // Iteração com filtro
  print('\nIteração com filtro:');
  for (var fruta in frutas) {
    if (fruta.length > 4) {
      print('Fruta com mais de 4 letras: $fruta');
    }
  }
  
  // Iteração e adição em nova lista
  List<String> frutasGrandes = [];
  for (var fruta in frutas) {
    if (fruta.length > 4) {
      frutasGrandes.add(fruta);
    }
  }
  print('\nFrutas com mais de 4 letras: $frutasGrandes');
  
  // O mesmo usando where (mais conciso)
  var frutasGrandes2 = frutas.where((fruta) => fruta.length > 4).toList();
  print('Frutas com mais de 4 letras (com where): $frutasGrandes2');
}