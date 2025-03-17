// Arquivo: booleanos.dart
// Demonstração de booleanos em Dart

void main() {
  print('=== BOOLEANOS EM DART ===\n');
  
  // === DECLARAÇÃO E OPERAÇÕES BÁSICAS ===
  print('--- Declaração e operações básicas ---');
  
  // Declaração de booleanos
  bool ativo = true;
  bool visivel = false;
  
  print('Variável ativo: $ativo');
  print('Variável visível: $visivel');
  
  // Operador de negação (!)
  bool inativo = !ativo;
  bool invisivel = !visivel;
  
  print('\nNegação:');
  print('!ativo (inativo): $inativo');
  print('!visivel (invisível): $invisivel');
  
  // Operadores lógicos
  print('\nOperadores lógicos:');
  
  // AND lógico (&&)
  bool ambosVerdadeiros = ativo && visivel;  // true E false = false
  print('ativo && visivel: $ambosVerdadeiros (AND lógico)');
  
  // OR lógico (||)
  bool peloMenosUmVerdadeiro = ativo || visivel;  // true OU false = true
  print('ativo || visivel: $peloMenosUmVerdadeiro (OR lógico)');
  
  // Combinação de operadores
  bool resultadoComplexo = ativo && !visivel;  // true E !false = true E true = true
  print('ativo && !visivel: $resultadoComplexo');
  
  // === OPERADORES DE COMPARAÇÃO ===
  print('\n--- Operadores de comparação ---');
  
  // Igualdade e diferença
  bool igual = (5 == 5);
  bool diferente = (5 != 10);
  
  print('5 == 5: $igual');
  print('5 != 10: $diferente');
  
  // Maior e menor
  bool maior = (10 > 5);
  bool menor = (5 < 10);
  bool maiorOuIgual = (5 >= 5);
  bool menorOuIgual = (5 <= 10);
  
  print('10 > 5: $maior');
  print('5 < 10: $menor');
  print('5 >= 5: $maiorOuIgual');
  print('5 <= 10: $menorOuIgual');
  
  // === EXPRESSÕES CONDICIONAIS COM BOOLEANOS ===
  print('\n--- Expressões condicionais ---');
  
  // Variáveis para exemplos
  bool temPermissao = true;
  bool ehAdministrador = false;
  
  // If/else com booleanos
  print('\nUsando if/else:');
  if (temPermissao && ehAdministrador) {
    print('Acesso total concedido');
  } else if (temPermissao) {
    print('Acesso limitado concedido');
  } else {
    print('Acesso negado');
  }
  
  // Operador ternário (condição ? valor_se_verdadeiro : valor_se_falso)
  String mensagem = temPermissao ? 'Tem permissão' : 'Não tem permissão';
  print('\nUsando operador ternário:');
  print('mensagem: $mensagem');
  
  // Comparações em cascata com operador ternário
  String nivel = ehAdministrador ? 'Admin' : (temPermissao ? 'Usuário' : 'Visitante');
  print('\nOperador ternário em cascata:');
  print('Nível de acesso: $nivel');
  
  // Switch com booleanos
  print('\nUsando switch:');
  switch (temPermissao) {
    case true:
      print('Acesso permitido via switch');
      break;
    case false:
      print('Acesso negado via switch');
      break;
  }
  
  // === BOOLEANOS E OUTRAS ESTRUTURAS ===
  print('\n--- Booleanos em outras estruturas ---');
  
  // Lista de booleanos
  List<bool> permissoes = [true, false, true, true];
  print('Lista de permissões: $permissoes');
  
}