
// Este arquivo demonstra o uso de parâmetros nomeados em Dart.

/// Função com todos os parâmetros nomeados opcionais
/// Note que em Dart com null safety, parâmetros nomeados são opcionais por padrão
void configurarAplicacao({String? titulo, String? tema, bool depurar = false, int nivelLog = 1}) {
  print('Configurando aplicação:');
  print('- Título: ${titulo ?? "Não definido"}');
  print('- Tema: ${tema ?? "Padrão"}');
  print('- Modo de depuração: ${depurar ? "Ativado" : "Desativado"}');
  print('- Nível de log: $nivelLog');
}

/// Função com parâmetros nomeados obrigatórios usando 'required'
/// Introduzido no Dart 2.12 com null safety
void criarUsuario({
  required String nome,
  required String email,
  int? idade,
  String? endereco,
  List<String> papeis = const ['usuário'],
}) {
  print('Novo usuário criado:');
  print('- Nome: $nome');
  print('- Email: $email');
  print('- Idade: ${idade ?? "Não informada"}');
  print('- Endereço: ${endereco ?? "Não informado"}');
  print('- Papéis: $papeis');
}

/// Função combinando parâmetros posicionais e nomeados
/// Os parâmetros posicionais vêm primeiro, seguidos pelos nomeados
double calcularSalario(
  double salarioBase, 
  int horasTrabalhadas, 
  {double valorHoraExtra = 0, 
  double? bonus, 
  required double aliquotaImposto}
) {
  double salarioBruto = salarioBase + (valorHoraExtra * horasTrabalhadas) + (bonus ?? 0);
  double salarioLiquido = salarioBruto * (1 - aliquotaImposto);
  return salarioLiquido;
}

/// Função que retorna um widget (simulando Flutter)
/// Demonstra o uso prático de parâmetros nomeados em contextos reais
Map<String, dynamic> criarBotao({
  required String texto,
  String? icone,
  required Function onPressed,
  bool habilitado = true,
  Map<String, dynamic> estilo = const {'cor': 'azul', 'tamanho': 'médio'},
}) {
  return {
    'tipo': 'botão',
    'texto': texto,
    'icone': icone,
    'callback': onPressed,
    'habilitado': habilitado,
    'estilo': estilo,
  };
}

// Função para demonstrar como os parâmetros nomeados aumentam a legibilidade
void main() {
  // Configurando aplicação com diferentes combinações de parâmetros
  print('\n=== Exemplo 1: Parâmetros nomeados opcionais ===');
  configurarAplicacao(); // Sem parâmetros - usa valores padrão
  configurarAplicacao(titulo: 'Minha App'); // Apenas um parâmetro
  configurarAplicacao(
    titulo: 'App de Produtividade',
    tema: 'Escuro',
    depurar: true,
    nivelLog: 3,
  ); // Todos os parâmetros
  
  // Note como a ordem não importa em parâmetros nomeados
  configurarAplicacao(
    depurar: true,
    titulo: 'Configuração Alternativa',
    nivelLog: 2,
  );
  
  print('\n=== Exemplo 2: Parâmetros nomeados obrigatórios ===');
  criarUsuario(
    nome: 'João Silva',
    email: 'joao@email.com',
  ); // Apenas parâmetros obrigatórios
  
  criarUsuario(
    nome: 'Maria Oliveira',
    email: 'maria@email.com',
    idade: 32,
    endereco: 'Rua das Flores, 123',
    papeis: ['administrador', 'editor'],
  ); // Todos os parâmetros
  
  print('\n=== Exemplo 3: Combinando parâmetros posicionais e nomeados ===');
  double salario = calcularSalario(
    2000, // salário base (posicional)
    160,  // horas trabalhadas (posicional)
    valorHoraExtra: 20,
    bonus: 500,
    aliquotaImposto: 0.15,
  );
  print('Salário calculado: R\$ $salario');
  
  print('\n=== Exemplo 4: Simulação de API de UI (estilo Flutter) ===');
  var botao = criarBotao(
    texto: 'Salvar',
    icone: 'save_icon',
    onPressed: () => print('Botão pressionado'),
    estilo: {'cor': 'verde', 'tamanho': 'grande', 'arredondamento': 8},
  );
  print('Botão criado: $botao');
}