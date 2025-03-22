void main() {
  // Criação de mapas
  
  // Mapa vazio
  Map<String, int> mapaVazio = {};
  print('Mapa vazio: $mapaVazio');
  
  // Mapa com valores iniciais
  Map<String, double> precos = {
    'maçã': 3.5,
    'banana': 2.0,
    'laranja': 4.0,
  };
  print('Mapa de preços: $precos');
  
  // Usando construtor Map
  var capitais = Map<String, String>();
  capitais['Brasil'] = 'Brasília';
  capitais['Argentina'] = 'Buenos Aires';
  capitais['Peru'] = 'Lima';
  print('Mapa de capitais: $capitais');
  
  // Manipulação de mapas
  
  // Acessando valores
  print('Preço da maçã: ${precos['maçã']}');
  
  // Acessando com valor padrão se a chave não existir
  var precoPera = precos['pera'] ?? 0.0;
  print('Preço da pera: $precoPera');
  
  // Verificando se contém uma chave
  bool temPeru = capitais.containsKey('Peru');
  print('Tem Peru no mapa? $temPeru');
  
  // Verificando se contém um valor
  bool temLima = capitais.containsValue('Lima');
  print('Tem Lima como valor? $temLima');
  
  // Adicionando ou atualizando entradas
  precos['pera'] = 5.5;
  print('Mapa após adicionar pera: $precos');
  
  // Atualizando valor
  precos['maçã'] = 4.0;
  print('Mapa após atualizar maçã: $precos');
  
  // Removendo entradas
  precos.remove('banana');
  print('Mapa após remover banana: $precos');
  
  // Obtendo todas as chaves
  var chaves = precos.keys;
  print('Chaves do mapa: $chaves');
  
  // Obtendo todos os valores
  var valores = precos.values;
  print('Valores do mapa: $valores');
  
  // Obtendo entradas como pares
  var entradas = precos.entries;
  for (var entrada in entradas) {
    print('${entrada.key}: ${entrada.value}');
  }
  
  // Transformando mapas
  var precosEmReais = precos.map((chave, valor) => 
    MapEntry(chave, 'R\$ ${valor.toStringAsFixed(2)}'));
  print('Preços formatados: $precosEmReais');
  
  // Filtrando mapas
  var precosAltos = Map.fromEntries(
    precos.entries.where((entrada) => entrada.value > 3.0)
  );
  print('Produtos com preços altos: $precosAltos');
  
  // Mapa imutável
  final mapaFixo = Map.unmodifiable({'a': 1, 'b': 2});
  print('Mapa imutável: $mapaFixo');
  // mapaFixo['c'] = 3; // Isso causaria erro em tempo de execução
}