void main() {
  // Exemplo básico de if/else
  int idade = 18;
  
  if (idade >= 18) {
    print('Você é maior de idade.');
  } else {
    print('Você é menor de idade.');
  }
  
  // Exemplo com múltiplas condições (if/else if/else)
  int pontuacao = 75;
  
  if (pontuacao >= 90) {
    print('Nota A');
  } else if (pontuacao >= 80) {
    print('Nota B');
  } else if (pontuacao >= 70) {
    print('Nota C');
  } else if (pontuacao >= 60) {
    print('Nota D');
  } else {
    print('Nota F');
  }
  
  // Operador ternário - forma compacta de if/else
  String status = idade >= 18 ? 'adulto' : 'menor';
  print('Status: $status');
  
  // If com expressão única (sem chaves)
  if (idade > 65) print('Aposentado');
  
  // Verificação de nulos
  String? nome;
  print('Nome não fornecido');
  
  // Condicional aninhado
  bool temCarteira = true;
  if (idade >= 18) {
    if (temCarteira) {
      print('Pode dirigir');
    } else {
      print('Não pode dirigir: precisa de carteira');
    }
  } else {
    print('Não pode dirigir: menor de idade');
  }
}