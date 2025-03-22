void main() {
  // Break em um loop FOR
  print('\n--- Break em loop FOR ---');
  for (int i = 0; i < 10; i++) {
    if (i == 5) {
      print('Encontramos o 5! Parando o loop.');
      break; // Para completamente e sai do loop
    }
    print('Número: $i');
  }
  
  // Continue em um loop FOR
  print('\n--- Continue em loop FOR ---');
  for (int i = 0; i < 10; i++) {
    if (i % 2 == 0) {
      continue; // Pula para a próxima iteração (números pares serão ignorados)
    }
    print('Número ímpar: $i');
  }
  
  // Break em loop aninhado
  print('\n--- Break em loops aninhados ---');
  outerLoop: for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      print('i = $i, j = $j');
      if (i == 1 && j == 1) {
        print('Encontramos i=1, j=1! Saindo do loop externo.');
        break outerLoop; // Usa um label para sair do loop externo
      }
    }
  }
  
  // Continue em loop aninhado
  print('\n--- Continue em loops aninhados ---');
  outerLoop: for (int i = 0; i < 3; i++) {
    print('Loop externo: i = $i');
    
    for (int j = 0; j < 3; j++) {
      if (j == 1) {
        print('  Pulando j = 1');
        continue; // Pula apenas a iteração atual do loop interno
      }
      print('  Loop interno: j = $j');
    }
  }
  
  // Break em loop WHILE
  print('\n--- Break em loop WHILE ---');
  int contador = 0;
  while (true) { // Loop infinito
    contador++;
    print('Contador: $contador');
    
    if (contador >= 5) {
      print('Contador chegou a 5! Saindo do loop.');
      break;
    }
  }
  
  // Break em switch (já vimos nos exemplos de switch)
  print('\n--- Break em switch ---');
  String fruta = 'maçã';
  switch (fruta) {
    case 'maçã':
      print('É uma maçã!');
      break; // Sai do switch
    default:
      print('Não é uma maçã');
  }
  
  // Usando break e continue com condições complexas
  print('\n--- Uso avançado de break e continue ---');
  List<int> numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  
  for (int num in numeros) {
    // Pula múltiplos de 3
    if (num % 3 == 0) {
      print('$num é múltiplo de 3, pulando...');
      continue;
    }
    
    // Para ao encontrar o primeiro número maior que 8
    if (num > 8) {
      print('$num é maior que 8, parando o loop...');
      break;
    }
    
    print('Processando número: $num');
  }
}