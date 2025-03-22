void main() {
  // Loop FOR básico
  print('\n--- Loop FOR básico ---');
  for (int i = 0; i < 5; i++) {
    print('Contagem: $i');
  }
  
  // Loop FOR com incremento personalizado
  print('\n--- Loop FOR com incremento personalizado ---');
  for (int i = 0; i <= 10; i += 2) {
    print('Número par: $i');
  }
  
  // Loop FOR-IN com listas
  print('\n--- Loop FOR-IN com lista ---');
  List<String> frutas = ['maçã', 'banana', 'laranja', 'uva'];
  for (String fruta in frutas) {
    print('Fruta: $fruta');
  }
  
  // Loop FOR-IN com maps
  print('\n--- Loop FOR-IN com map ---');
  Map<String, int> idades = {
    'João': 25,
    'Maria': 30,
    'Pedro': 22
  };
  
  for (String nome in idades.keys) {
    print('Nome: $nome');
  }
  
  for (int idade in idades.values) {
    print('Idade: $idade');
  }
  
  for (var entrada in idades.entries) {
    print('${entrada.key} tem ${entrada.value} anos');
  }
  
  // Loop WHILE
  print('\n--- Loop WHILE ---');
  int contador = 0;
  while (contador < 5) {
    print('Contador (while): $contador');
    contador++;
  }
  
  // Loop DO-WHILE
  print('\n--- Loop DO-WHILE ---');
  contador = 0;
  do {
    print('Contador (do-while): $contador');
    contador++;
  } while (contador < 5);
  
  // Diferença entre WHILE e DO-WHILE
  print('\n--- Diferença WHILE vs DO-WHILE ---');
  contador = 10;
  
  print('WHILE (não executa quando a condição já é falsa):');
  while (contador < 5) {
    print('Este texto nunca será impresso');
    contador++;
  }
  
  print('DO-WHILE (executa pelo menos uma vez):');
  do {
    print('Este texto será impresso uma vez');
    contador++;
  } while (contador < 5);
  
  // forEach (método funcional)
  print('\n--- forEach ---');
  frutas.forEach((fruta) {
    print('Fruta (forEach): $fruta');
  });
  
  // Loop com .where() e .map() (programação funcional)
  print('\n--- Programação funcional ---');
  frutas
    .where((f) => f.length > 4)  // filtra frutas com mais de 4 letras
    .map((f) => f.toUpperCase())  // converte para maiúsculas
    .forEach((f) => print('Fruta processada: $f'));
}