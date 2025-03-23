
// Este arquivo demonstra o uso de parâmetros obrigatórios e opcionais em Dart.

/// Função com apenas parâmetros obrigatórios
/// Todos os parâmetros devem ser fornecidos ao chamar a função
String formatarNome(String primeiro, String ultimo) {
  return '$primeiro $ultimo';
}

/// Função com parâmetros opcionais posicionais
/// Os parâmetros entre colchetes são opcionais
/// Note o uso de valores padrão e tipos nullable (?)
String gerarSaudacao(String nome, [String? titulo, String periodo = 'dia']) {
  String saudacaoCompleta = 'Bom $periodo, ';
  
  if (titulo != null) {
    saudacaoCompleta += '$titulo ';
  }
  
  saudacaoCompleta += nome;
  return saudacaoCompleta;
}

/// Função com múltiplos parâmetros opcionais posicionais
/// Note como os parâmetros opcionais vêm após os obrigatórios
double calcularPrecoFinal(double preco, [double desconto = 0, double imposto = 0, double frete = 0]) {
  double precoComDesconto = preco * (1 - desconto);
  double precoComImposto = precoComDesconto * (1 + imposto);
  return precoComImposto + frete;
}

/// Função com parâmetros obrigatórios e opcionais misturados
List<String> gerarListaCompras(String itemPrincipal, int quantidade, [List<String>? itensAdicionais]) {
  List<String> lista = ['$quantidade x $itemPrincipal'];
  
  if (itensAdicionais != null) {
    lista.addAll(itensAdicionais);
  }
  
  return lista;
}

/// Função demonstrando o uso de tipos complexos como parâmetros opcionais
Map<String, dynamic> criarPerfil(String nome, int idade, [Map<String, String>? contatos, List<String>? interesses]) {
  Map<String, dynamic> perfil = {
    'nome': nome,
    'idade': idade,
  };
  
  if (contatos != null) {
    perfil['contatos'] = contatos;
  }
  
  if (interesses != null) {
    perfil['interesses'] = interesses;
  }
  
  return perfil;
}

// Função principal para demonstrar o uso dos diversos tipos de parâmetros
void main() {
  // Parâmetros obrigatórios
  print(formatarNome('Maria', 'Silva'));
  
  // Parâmetros opcionais posicionais
  print(gerarSaudacao('João')); // Sem parâmetros opcionais
  print(gerarSaudacao('Ana', 'Dra.')); // Com um parâmetro opcional
  print(gerarSaudacao('Carlos', 'Prof.', 'tarde')); // Com todos os parâmetros opcionais
  
  // Calculando preços com diferentes combinações de parâmetros
  print('Preço básico: ${calcularPrecoFinal(100)}');
  print('Com desconto: ${calcularPrecoFinal(100, 0.1)}');
  print('Com desconto e imposto: ${calcularPrecoFinal(100, 0.1, 0.05)}');
  print('Completo: ${calcularPrecoFinal(100, 0.1, 0.05, 15)}');
  
  // Lista de compras
  List<String> lista = gerarListaCompras('Arroz', 2, ['Feijão', 'Óleo', 'Sal']);
  print('Lista de compras: $lista');
  
  // Criando perfil com diferentes níveis de detalhes
  var perfilSimples = criarPerfil('Pedro', 25);
  print('Perfil simples: $perfilSimples');
  
  var perfilCompleto = criarPerfil(
    'Laura', 
    30, 
    {'email': 'laura@email.com', 'telefone': '123-456-789'},
    ['Música', 'Fotografia', 'Viagens']
  );
  print('Perfil completo: $perfilCompleto');
}