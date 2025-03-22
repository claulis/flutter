void main() {
  // Exemplo básico de switch com inteiros
  int dia = 3;
  
  switch (dia) {
    case 1:
      print('Segunda-feira');
      break;
    case 2:
      print('Terça-feira');
      break;
    case 3:
      print('Quarta-feira');
      break;
    case 4:
      print('Quinta-feira');
      break;
    case 5:
      print('Sexta-feira');
      break;
    case 6:
    case 7:
      print('Final de semana');
      break;
    default:
      print('Dia inválido');
  }
  
  // Switch com strings
  String fruta = 'maçã';
  
  switch (fruta) {
    case 'maçã':
      print('Fruta vermelha ou verde');
      break;
    case 'banana':
      print('Fruta amarela');
      break;
    case 'laranja':
      print('Fruta cítrica');
      break;
    default:
      print('Fruta desconhecida');
  }
  
  // Usando "continue" para compartilhar código entre casos
  String nota = 'B';
  
  switch (nota) {
    case 'A':
      print('Excelente!');
      break;
    case 'B':
      print('Muito bom!');
    case 'C':
    print('Aprovado');
      break;
    case 'D':
    print('Reprovado');
      break;
    default:
      print('Nota inválida');
  }
  
  // Switch com enums (muito comum)
  EstadoCivil status = EstadoCivil.casado;
  
  switch (status) {
    case EstadoCivil.solteiro:
      print('Pessoa solteira');
      break;
    case EstadoCivil.casado:
      print('Pessoa casada');
      break;
    case EstadoCivil.divorciado:
      print('Pessoa divorciada');
      break;
    case EstadoCivil.viuvo:
      print('Pessoa viúva');
      break;
  }
}

enum EstadoCivil { solteiro, casado, divorciado, viuvo }