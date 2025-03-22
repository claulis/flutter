void main() {
  // Criação de listas
  
  // Lista vazia
  List<int> listaVazia = [];
  print('Lista vazia: $listaVazia');
  
  // Lista com valores iniciais
  List<String> frutas = ['maçã', 'banana', 'laranja'];
  print('Lista de frutas: $frutas');
  
  // Lista usando construtor
  var numeros = List<int>.filled(5, 0); // Cria lista com 5 zeros
  print('Lista preenchida: $numeros');
  
  // Lista usando generate
  var quadrados = List<int>.generate(5, (index) => index * index);
  print('Lista de quadrados: $quadrados');
  
  // Manipulação de listas
  
  // Acessando elementos
  print('Primeiro elemento: ${frutas[0]}');
  print('Último elemento: ${frutas[frutas.length - 1]}');
  
  // Adicionando elementos
  frutas.add('morango');
  print('Após adicionar: $frutas');
  
  // Inserindo em posição específica
  frutas.insert(1, 'abacaxi');
  print('Após inserir: $frutas');
  
  // Removendo elementos
  frutas.remove('banana');
  print('Após remover banana: $frutas');
  
  // Removendo por índice
  frutas.removeAt(0);
  print('Após remover o primeiro: $frutas');
  
  // Verificando elementos
  bool temLaranja = frutas.contains('laranja');
  print('Contém laranja? $temLaranja');
  
  // Encontrando índice
  int indice = frutas.indexOf('morango');
  print('Índice do morango: $indice');
  
  // Limpando a lista
  frutas.clear();
  print('Lista após clear: $frutas');
  
  // Ordenação de listas
  List<int> desordenados = [5, 2, 8, 1, 4];
  desordenados.sort();
  print('Lista ordenada: $desordenados');
  
  // Ordenação personalizada
  List<String> nomes = ['Carlos', 'Ana', 'Zeca', 'Beatriz'];
  nomes.sort((a, b) => a.length.compareTo(b.length)); // Ordenar por tamanho
  print('Nomes ordenados por tamanho: $nomes');
  
  // Filtragem
  var numerosPares = desordenados.where((numero) => numero % 2 == 0).toList();
  print('Números pares: $numerosPares');
  
  // Lista imutável
  final listaFixa = List.unmodifiable([1, 2, 3]);
  print('Lista imutável: $listaFixa');
  // listaFixa.add(4); // Isso causaria erro em tempo de execução
}