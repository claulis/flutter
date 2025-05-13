void main() {
  // Nota: Assert só funciona em modo de desenvolvimento
  // Para executar com assert ativado: dart --enable-asserts nome_do_arquivo.dart
  
  // Assert básico
  int idade = 25;
  assert(idade >= 18, 'Idade deve ser maior ou igual a 18');
  print('Usuário tem idade válida: $idade');
  
  // Assert para verificar valor não nulo
  String? nome = 'João';
  print('Nome: $nome');
  
  // Assert em funções
  int resultado = calcularIdade(2000);
  assert(resultado > 0, 'A idade calculada deve ser positiva');
  print('Idade calculada: $resultado');
  
  // Verificando propriedades de objetos
  Pessoa pessoa = Pessoa('Maria', 30);
  assert(pessoa.nome.isNotEmpty, 'Nome da pessoa não pode estar vazio');
  assert(pessoa.idade > 0, 'Idade deve ser positiva');
  print('Pessoa criada: ${pessoa.nome}, ${pessoa.idade} anos');
  
  // Assert com expressões mais complexas
  List<int> numeros = [1, 2, 3, 4, 5];
  assert(numeros.length > 0, 'A lista não pode estar vazia');
  assert(numeros.every((n) => n > 0), 'Todos os números devem ser positivos');
  print('Lista válida: $numeros');
  
  // Usando assert para validar argumentos de função
  enviarEmail('usuario@exemplo.com', 'Assunto', 'Corpo do email');
  
  // Assert com expressão booleana
  bool condicao = idade > 18 && nome.length > 3;
  assert(condicao, 'A condição deve ser verdadeira');
  print('Condição verificada com sucesso');
  
  // Utilizando em um construtor
  Retangulo retangulo = Retangulo(10, 5);
  print('Área do retângulo: ${retangulo.calcularArea()}');
}

int calcularIdade(int anoNascimento) {
  int anoAtual = 2025;
  int idade = anoAtual - anoNascimento;
  return idade;
}

void enviarEmail(String destinatario, String assunto, String corpo) {
  assert(destinatario.contains('@'), 'Email deve conter @');
  assert(assunto.isNotEmpty, 'Assunto não pode estar vazio');
  assert(corpo.length > 10, 'Corpo do email deve ter pelo menos 10 caracteres');
  
  print('Email enviado para: $destinatario');
}

class Pessoa {
  String nome;
  int idade;
  
  Pessoa(this.nome, this.idade) {
    assert(nome.isNotEmpty, 'Nome não pode estar vazio');
    assert(idade >= 0, 'Idade não pode ser negativa');
  }
}

class Retangulo {
  final double largura;
  final double altura;
  
  Retangulo(this.largura, this.altura) {
    assert(largura > 0, 'Largura deve ser positiva');
    assert(altura > 0, 'Altura deve ser positiva');
  }
  
  double calcularArea() {
    return largura * altura;
  }
}