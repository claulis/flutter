void main() {
  // Criação de sets
  
  // Set vazio
  Set<int> setVazio = {};
  print('Set vazio: $setVazio');
  
  // Set com valores iniciais
  Set<String> cores = {'vermelho', 'verde', 'azul'};
  print('Set de cores: $cores');
  
  // Set a partir de lista
  var numeros = {1, 2, 3, 4, 5};
  print('Set de números: $numeros');
  
  // Tentando adicionar duplicatas (serão ignoradas)
  cores.add('vermelho');
  print('Set após tentar adicionar duplicata: $cores'); // 'vermelho' não será duplicado
  
  // Operações com sets
  
  // Adicionar elementos
  cores.add('amarelo');
  print('Após adicionar: $cores');
  
  // Remover elementos
  cores.remove('verde');
  print('Após remover: $cores');
  
  // Verificar se contém um elemento
  bool temAzul = cores.contains('azul');
  print('Contém azul? $temAzul');
  
  // Operações matemáticas de conjuntos
  Set<int> conjunto1 = {1, 2, 3, 4, 5};
  Set<int> conjunto2 = {4, 5, 6, 7, 8};
  
  // União
  var uniao = conjunto1.union(conjunto2);
  print('União: $uniao');
  
  // Interseção
  var intersecao = conjunto1.intersection(conjunto2);
  print('Interseção: $intersecao');
  
  // Diferença
  var diferenca = conjunto1.difference(conjunto2);
  print('Diferença (conjunto1 - conjunto2): $diferenca');
  
  // Removendo duplicatas de uma lista usando set
  List<String> palavras = ['olá', 'mundo', 'olá', 'dart', 'mundo'];
  var palavrasUnicas = Set<String>.from(palavras).toList();
  print('Lista original: $palavras');
  print('Lista sem duplicatas: $palavrasUnicas');
  
  // Set imutável
  final setFixo = Set.unmodifiable({1, 2, 3});
  print('Set imutável: $setFixo');
  // setFixo.add(4); // Isso causaria erro em tempo de execução
}