// Arquivo: strings.dart
// Demonstração de strings em Dart

void main() {
  print('=== STRINGS EM DART ===\n');
  
  // === DECLARAÇÃO DE STRINGS ===
  print('--- Declaração de strings ---');
  
  // Com aspas simples ou duplas
  String nome = 'Maria';
  String sobrenome = "Silva";
  
  print('Nome com aspas simples: $nome');
  print('Sobrenome com aspas duplas: $sobrenome');
  
  // Strings multilinhas com três aspas
  String paragrafo = '''
Este é um texto
que ocupa várias linhas
no código fonte.
''';
  print('\nString multilinha com aspas simples:');
  print(paragrafo);
  
  String outroParagrafo = """
Este também é um texto
multilinha usando aspas duplas.
""";
  print('String multilinha com aspas duplas:');
  print(outroParagrafo);
  
  // String crua (raw) com prefixo r - ignora caracteres de escape
  String caminhoNormal = 'C:\\Users\\Nome\\Documentos';
  String caminhoRaw = r'C:\Users\Nome\Documentos';
  
  print('\nString normal (com escapes): $caminhoNormal');
  print('String raw (sem escapes): $caminhoRaw');
  
  // === CONCATENAÇÃO E INTERPOLAÇÃO ===
  print('\n--- Concatenação e interpolação ---');
  
  // Concatenação com operador +
  String nomeCompleto = nome + ' ' + sobrenome;
  print('Concatenação com +: $nomeCompleto');
  
  // Interpolação com $variavel ou ${expressão}
  String apresentacao = 'Olá, meu nome é $nome $sobrenome!';
  print('Interpolação simples: $apresentacao');
  
  int idade = 30;
  String info = 'Em 5 anos, terei ${idade + 5} anos.';
  print('Interpolação com expressão: $info');
  
  // Concatenação de múltiplas strings adjacentes
  String endereco = 'Rua das Flores, '
      'nº 123, '
      'Centro';
  print('Strings adjacentes: $endereco');
  
  // === OPERAÇÕES COM STRINGS ===
  print('\n--- Operações com strings ---');
  
  String texto = 'Dart é uma linguagem incrível!';
  print('Texto de exemplo: "$texto"');
  
  // Comprimento
  int tamanho = texto.length;
  print('\nComprimento: $tamanho caracteres');
  
  // Verificações
  bool comecaCom = texto.startsWith('Dart');
  bool terminaCom = texto.endsWith('!');
  bool contem = texto.contains('linguagem');
  
  print('\nVerificações:');
  print('Começa com "Dart"? $comecaCom');
  print('Termina com "!"? $terminaCom');
  print('Contém "linguagem"? $contem');
  
  // Manipulação
  String maiusculas = texto.toUpperCase();
  String minusculas = texto.toLowerCase();
  String substituir = texto.replaceAll('incrível', 'fantástica');
  
  print('\nManipulação:');
  print('Em maiúsculas: $maiusculas');
  print('Em minúsculas: $minusculas');
  print('Substituição: $substituir');
  
  // Divisão
  List<String> palavras = texto.split(' ');
  
  print('\nDivisão em palavras:');
  print('Resultado do split: $palavras');
  print('Número de palavras: ${palavras.length}');
  
  // Substrings
  String parte = texto.substring(0, 4);
  print('\nSubstring (0, 4): "$parte"');
  
  // Remoção de espaços em branco
  String comEspacos = '   texto com espaços   ';
  String semEspacos = comEspacos.trim();
  String semEspacosInicio = comEspacos.trimLeft();
  String semEspacosFim = comEspacos.trimRight();
  
  print('\nRemoção de espaços:');
  print('Original: "$comEspacos"');
  print('trim(): "$semEspacos"');
  print('trimLeft(): "$semEspacosInicio"');
  print('trimRight(): "$semEspacosFim"');
  
  // Posição em uma string
  int posicao = texto.indexOf('linguagem');
  print('\nPosição de "linguagem": $posicao');
  
  // Verificar se está vazia
  String vazia = '';
  bool estaVazia = vazia.isEmpty;
  bool naoEstaVazia = vazia.isNotEmpty;
  print('\nString vazia:');
  print('isEmpty: $estaVazia');
  print('isNotEmpty: $naoEstaVazia');
  
  // Construção de strings maiores
  StringBuffer buffer = StringBuffer();
  buffer.write('Olá, ');
  buffer.write('tudo bem? ');
  buffer.writeAll(['Este', 'é', 'um', 'teste'], ' ');
  
  String resultado = buffer.toString();
  print('\nUsando StringBuffer:');
  print(resultado);
}