# Coleções

## Listas

As listas são uma das estruturas de dados mais fundamentais em Dart. Elas armazenam elementos ordenados que podem ser acessados por índice.

>:warning: Código de exemplo no arquivo [list.dart](../assets/code/list.dart)

### Características das Listas:
- Mantêm a ordem de inserção
- Permitem elementos duplicados
- São indexadas (começando em 0)
- São mutáveis (podem ser modificadas após a criação)

```dart
void main() {
  // Criação de listas
  
  // Lista vazia
  List<int> listaVazia = [];
  print('Lista vazia: $listaVazia');
  
  // Lista com valores iniciais
  List<String> frutas = ['maçã', 'banana', 'laranja'];
  print('Lista de frutas: $frutas');
  
  // Lista usando construtor
  var numeros = List<int>.filled(5, 0); // Cria lista com 5 zeros
  print('Lista preenchida: $numeros');
  
  // Lista usando generate
  var quadrados = List<int>.generate(5, (index) => index * index);
  print('Lista de quadrados: $quadrados');
  
  // Manipulação de listas
  
  // Acessando elementos
  print('Primeiro elemento: ${frutas[0]}');
  print('Último elemento: ${frutas[frutas.length - 1]}');
  
  // Adicionando elementos
  frutas.add('morango');
  print('Após adicionar: $frutas');
  
  // Inserindo em posição específica
  frutas.insert(1, 'abacaxi');
  print('Após inserir: $frutas');
  
  // Removendo elementos
  frutas.remove('banana');
  print('Após remover banana: $frutas');
  
  // Removendo por índice
  frutas.removeAt(0);
  print('Após remover o primeiro: $frutas');
  
  // Verificando elementos
  bool temLaranja = frutas.contains('laranja');
  print('Contém laranja? $temLaranja');
  
  // Encontrando índice
  int indice = frutas.indexOf('morango');
  print('Índice do morango: $indice');
  
  // Limpando a lista
  frutas.clear();
  print('Lista após clear: $frutas');
  
  // Ordenação de listas
  List<int> desordenados = [5, 2, 8, 1, 4];
  desordenados.sort();
  print('Lista ordenada: $desordenados');
  
  // Ordenação personalizada
  List<String> nomes = ['Carlos', 'Ana', 'Zeca', 'Beatriz'];
  nomes.sort((a, b) => a.length.compareTo(b.length)); // Ordenar por tamanho
  print('Nomes ordenados por tamanho: $nomes');
  
  // Filtragem
  var numerosPares = desordenados.where((numero) => numero % 2 == 0).toList();
  print('Números pares: $numerosPares');
  
  // Lista imutável
  final listaFixa = List.unmodifiable([1, 2, 3]);
  print('Lista imutável: $listaFixa');
  // listaFixa.add(4); // Isso causaria erro em tempo de execução
}

```

### Boas Práticas com Listas:

1. **Especifique o tipo da lista** quando possível para melhorar a segurança de tipos e o desempenho.
2. **Use construtores específicos** como `List.generate()` ou `List.filled()` para casos de uso comuns.
3. **Prefira métodos funcionais** como `map()`, `where()` e `reduce()` para transformações de dados.
4. **Use listas imutáveis** (`List.unmodifiable`) quando o conteúdo não deve mudar.
5. **Verifique os limites** antes de acessar elementos por índice para evitar exceções.

## Sets

Sets são coleções de elementos únicos, sem ordem definida.

>:warning: Código de exemplo no arquivo [set.dart](../assets/code/set.dart)

### Características dos Sets:
- Não permitem elementos duplicados
- Geralmente mais rápidos para verificar se contém um elemento
- Úteis para remover duplicatas de coleções
- Não garantem ordem específica (embora na implementação atual a ordem de inserção seja preservada)

```dart
void main() {
  // Criação de sets
  
  // Set vazio
  Set<int> setVazio = {};
  print('Set vazio: $setVazio');
  
  // Set com valores iniciais
  Set<String> cores = {'vermelho', 'verde', 'azul'};
  print('Set de cores: $cores');
  
  // Set a partir de lista
  var numeros = {1, 2, 3, 4, 5};
  print('Set de números: $numeros');
  
  // Tentando adicionar duplicatas (serão ignoradas)
  cores.add('vermelho');
  print('Set após tentar adicionar duplicata: $cores'); // 'vermelho' não será duplicado
  
  // Operações com sets
  
  // Adicionar elementos
  cores.add('amarelo');
  print('Após adicionar: $cores');
  
  // Remover elementos
  cores.remove('verde');
  print('Após remover: $cores');
  
  // Verificar se contém um elemento
  bool temAzul = cores.contains('azul');
  print('Contém azul? $temAzul');
  
  // Operações matemáticas de conjuntos
  Set<int> conjunto1 = {1, 2, 3, 4, 5};
  Set<int> conjunto2 = {4, 5, 6, 7, 8};
  
  // União
  var uniao = conjunto1.union(conjunto2);
  print('União: $uniao');
  
  // Interseção
  var intersecao = conjunto1.intersection(conjunto2);
  print('Interseção: $intersecao');
  
  // Diferença
  var diferenca = conjunto1.difference(conjunto2);
  print('Diferença (conjunto1 - conjunto2): $diferenca');
  
  // Removendo duplicatas de uma lista usando set
  List<String> palavras = ['olá', 'mundo', 'olá', 'dart', 'mundo'];
  var palavrasUnicas = Set<String>.from(palavras).toList();
  print('Lista original: $palavras');
  print('Lista sem duplicatas: $palavrasUnicas');
  
  // Set imutável
  final setFixo = Set.unmodifiable({1, 2, 3});
  print('Set imutável: $setFixo');
  // setFixo.add(4); // Isso causaria erro em tempo de execução
}

```

### Boas Práticas com Sets:

1. **Use sets para armazenar valores únicos**, especialmente quando precisa verificar frequentemente se um valor existe.
2. **Aproveite as operações matemáticas de conjuntos** (união, interseção, diferença) para manipulação de dados.
3. **Use sets para remover duplicatas** de listas convertendo a lista para set e de volta para lista.
4. **Considere usar sets em vez de listas** quando a ordem dos elementos não importa e a unicidade é importante.
5. **Use sets imutáveis** (`Set.unmodifiable`) quando o conteúdo não deve mudar.

## Mapas

Mapas são coleções de pares chave-valor, onde cada chave é única.

>:warning: Código de exemplo no arquivo [map.dart](../assets/code/map.dart)

### Características dos Mapas:
- Armazenam dados como pares chave-valor
- As chaves são únicas
- Permitem acesso rápido aos valores através de suas chaves
- Úteis para representar relações ou dicionários

```dart
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

```

### Boas Práticas com Mapas:

1. **Defina os tipos de chave e valor** para melhorar a segurança do código.
2. **Use a sintaxe de acesso seguro** (`map['chave'] ?? valorPadrao`) para evitar erros com chaves inexistentes.
3. **Prefira métodos funcionais** como `map()` para transformar valores.
4. **Use `putIfAbsent()`** quando quiser adicionar um valor apenas se a chave não existir.
5. **Considere usar mapas constantes** para dados que não mudam.
6. **Utilize `entries`** para iterar sobre pares chave-valor de forma eficiente.

## Operações com Coleções

Dart oferece várias operações poderosas para manipular coleções.

>:warning: Código de exemplo no arquivo [op_collection.dart](../assets/code/op_collection.dart)

```dart
void main() {
  // Transformações com map
  List<int> numeros = [1, 2, 3, 4, 5];
  var dobrados = numeros.map((n) => n * 2).toList();
  print('Números dobrados: $dobrados');
  
  // Filtros com where
  var impares = numeros.where((n) => n % 2 != 0).toList();
  print('Números ímpares: $impares');
  
  // Redução com reduce
  var soma = numeros.reduce((valor, elemento) => valor + elemento);
  print('Soma dos números: $soma');
  
  // Redução com fold (permite especificar valor inicial)
  var somaComInicial = numeros.fold(10, (valor, elemento) => valor + elemento);
  print('Soma dos números com inicial 10: $somaComInicial');
  
  // every - verifica se todos os elementos atendem a uma condição
  bool todosMenoresQue10 = numeros.every((n) => n < 10);
  print('Todos são menores que 10? $todosMenoresQue10');
  
  // any - verifica se pelo menos um elemento atende a uma condição
  bool peloMenosUmMaiorQue4 = numeros.any((n) => n > 4);
  print('Pelo menos um maior que 4? $peloMenosUmMaiorQue4');
  
  // firstWhere - encontra o primeiro elemento que atende a uma condição
  var primeiroPar = numeros.firstWhere(
    (n) => n % 2 == 0,
    orElse: () => -1, // valor padrão se nenhum for encontrado
  );
  print('Primeiro número par: $primeiroPar');
  
  // lastWhere - encontra o último elemento que atende a uma condição
  var ultimoPar = numeros.lastWhere(
    (n) => n % 2 == 0,
    orElse: () => -1,
  );
  print('Último número par: $ultimoPar');
  
  // Combinando operações
  List<Map<String, dynamic>> produtos = [
    {'nome': 'Laptop', 'preco': 5000, 'disponivel': true},
    {'nome': 'Mouse', 'preco': 120, 'disponivel': true},
    {'nome': 'Monitor', 'preco': 1500, 'disponivel': false},
    {'nome': 'Teclado', 'preco': 200, 'disponivel': true},
  ];
  
  // Encontrar produtos disponíveis, obter seus nomes, e ordená-los
  var produtosDisponiveis = produtos
      .where((p) => p['disponivel'] == true)
      .map((p) => p['nome'] as String)
      .toList()
      ..sort();
  
  print('Produtos disponíveis: $produtosDisponiveis');
  
  // Calcular o valor total de produtos disponíveis
  var valorTotal = produtos
      .where((p) => p['disponivel'] == true)
      .map((p) => p['preco'] as num)
      .fold(0, (prev, preco) => prev + preco);
  
  print('Valor total dos produtos disponíveis: $valorTotal');
  
  // Agrupamento com group by (Dart 2.18+)
  // Esta funcionalidade requer Dart 2.18 ou superior
  Map<bool, List<Map<String, dynamic>>> produtosAgrupados = {};
  
  for (var produto in produtos) {
    bool disponivel = produto['disponivel'];
    if (!produtosAgrupados.containsKey(disponivel)) {
      produtosAgrupados[disponivel] = [];
    }
    produtosAgrupados[disponivel]!.add(produto);
  }
  
  print('Produtos agrupados por disponibilidade: ');
  produtosAgrupados.forEach((disponivel, lista) {
    print('${disponivel ? "Disponíveis" : "Indisponíveis"}: ${lista.length} produtos');
  });
}

```

### Boas Práticas com Operações em Coleções:

1. **Prefira operações funcionais** (`map`, `where`, `reduce`, etc.) em vez de loops manuais quando apropriado.
2. **Encadeie operações** para criar pipelines de transformação de dados claros e concisos.
3. **Use `fold` em vez de `reduce`** quando precisar de um valor inicial diferente.
4. **Aproveite os métodos de busca** (`firstWhere`, `lastWhere`) com a opção `orElse` para evitar exceções.
5. **Combine operações** para criar transformações complexas sem variáveis intermediárias.
6. **Considere a legibilidade** - às vezes, múltiplas operações simples são mais legíveis que uma cadeia complexa.

## Iteração em Coleções

Existem várias formas de iterar sobre coleções em Dart, cada uma com seu próprio caso de uso.

>:warning: Código de exemplo no arquivo [iter_collection.dart](../assets/code/iter_collection.dart)

```dart
void main() {
  List<String> frutas = ['maçã', 'banana', 'laranja', 'uva', 'pera'];
  Map<String, double> precos = {
    'maçã': 3.5,
    'banana': 2.0,
    'laranja': 4.0,
    'uva': 6.0,
    'pera': 5.5,
  };
  Set<int> numeros = {1, 2, 3, 4, 5};
  
  // Iteração em listas
  
  // for tradicional com índice
  print('Iteração com for tradicional:');
  for (int i = 0; i < frutas.length; i++) {
    print('Fruta $i: ${frutas[i]}');
  }
  
  // for-in loop (recomendado para a maioria dos casos)
  print('\nIteração com for-in:');
  for (var fruta in frutas) {
    print('Fruta: $fruta');
  }
  
  // forEach com função anônima
  print('\nIteração com forEach:');
  frutas.forEach((fruta) {
    print('Fruta: $fruta');
  });
  
  // forEach com arrow function
  print('\nIteração com forEach e arrow function:');
  frutas.forEach((fruta) => print('Fruta: $fruta'));
  
  // Iterando com índice usando forEach
  print('\nIteração com índice usando forEach:');
  frutas.asMap().forEach((indice, fruta) {
    print('Fruta $indice: $fruta');
  });
  
  // Iteração em mapas
  
  // Iterando sobre entradas
  print('\nIteração sobre entradas do mapa:');
  for (var entrada in precos.entries) {
    print('${entrada.key}: R\$ ${entrada.value}');
  }
  
  // Iterando sobre chaves
  print('\nIteração sobre chaves do mapa:');
  for (var fruta in precos.keys) {
    print('Fruta: $fruta, Preço: R\$ ${precos[fruta]}');
  }
  
  // Usando forEach
  print('\nIteração em mapa com forEach:');
  precos.forEach((fruta, preco) {
    print('$fruta custa R\$ $preco');
  });
  
  // Iteração em sets
  
  // usando for-in
  print('\nIteração em set com for-in:');
  for (var numero in numeros) {
    print('Número: $numero');
  }
  
  // forEach em set
  print('\nIteração em set com forEach:');
  numeros.forEach((numero) => print('Número: $numero'));
  
  // Iteração com transformação
  
  // map durante a iteração
  print('\nTransformação durante iteração:');
  frutas.map((fruta) => fruta.toUpperCase()).forEach(print);
  
  // Iteração com filtro
  print('\nIteração com filtro:');
  for (var fruta in frutas) {
    if (fruta.length > 4) {
      print('Fruta com mais de 4 letras: $fruta');
    }
  }
  
  // Iteração e adição em nova lista
  List<String> frutasGrandes = [];
  for (var fruta in frutas) {
    if (fruta.length > 4) {
      frutasGrandes.add(fruta);
    }
  }
  print('\nFrutas com mais de 4 letras: $frutasGrandes');
  
  // O mesmo usando where (mais conciso)
  var frutasGrandes2 = frutas.where((fruta) => fruta.length > 4).toList();
  print('Frutas com mais de 4 letras (com where): $frutasGrandes2');
}

```

### Boas Práticas com Iteração em Coleções:

1. **Prefira `for-in` para iteração simples** sobre elementos de uma coleção.
2. **Use o loop `for` tradicional** quando precisar do índice ou controle mais granular.
3. **Utilize `forEach` para código mais funcional** e conciso.
4. **Combine iteração com operações** como `map` e `where` para transformações durante a iteração.
5. **Para mapas, use `entries`** para acessar tanto a chave quanto o valor.
6. **Considere métodos funcionais** para operações comuns em vez de loops manuais.
7. **Evite modificar coleções** durante a iteração para evitar comportamento inesperado.

## Spread Operator

O operador spread (`...`) é uma característica poderosa do Dart que permite "espalhar" elementos de uma coleção em outra.

>:warning: Código de exemplo no arquivo [op_spread.dart](../assets/code/op_spread.dart)

```dart
void main() {
  // Uso básico do spread operator em listas
  List<int> lista1 = [1, 2, 3];
  List<int> lista2 = [4, 5, 6];
  
  // Combinando listas com spread
  List<int> combinada = [...lista1, ...lista2];
  print('Listas combinadas: $combinada');
  
  // Inserindo elementos junto com spread
  List<int> comExtras = [0, ...lista1, 10, ...lista2, 20];
  print('Lista com extras: $comExtras');
  
  // Spread condicional (null-aware spread operator ...?)
  List<int>? listaNula;
  List<int> listaSegura = [1, 2, ...?listaNula, 3];
  print('Lista com spread null-aware: $listaSegura');
  
  // Outro exemplo com lista possivelmente nula
  List<String>? nomes;
  var todosNomes = ['Ana', 'Carlos', ...?nomes];
  print('Todos os nomes: $todosNomes');
  
  nomes = ['Maria', 'João'];
  todosNomes = ['Ana', 'Carlos', ...?nomes];
  print('Todos os nomes (após atribuição): $todosNomes');
  
  // Usando spread com sets
  Set<String> set1 = {'a', 'b', 'c'};
  Set<String> set2 = {'c', 'd', 'e'};
  
  // Nota: Duplicatas são automaticamente removidas em sets
  var setsCombinados = {...set1, ...set2};
  print('Sets combinados: $setsCombinados');
  
  // Usando spread com mapas
  Map<String, int> mapa1 = {'a': 1, 'b': 2};
  Map<String, int> mapa2 = {'b': 3, 'c': 4}; // Note a chave 'b' duplicada
  
  // Quando há chaves duplicadas, o último valor prevalece
  var mapasCombinados = {...mapa1, ...mapa2};
  print('Mapas combinados: $mapasCombinados'); // 'b' terá valor 3
  
  // Usando spread para criar cópias
  var listaOriginal = [1, 2, 3];
  var copia = [...listaOriginal];
  
  // Modificar a cópia não afeta o original
  copia.add(4);
  print('Original: $listaOriginal');
  print('Cópia: $copia');
  
  // Spread em coleções aninhadas
  List<List<int>> matriz = [
    [1, 2],
    [3, 4]
  ];
  
  // Criar uma lista plana a partir de uma matriz
  var listaPlana = [
    0,
    ...matriz[0],
    ...matriz[1],
    5
  ];
  print('Lista plana: $listaPlana');
  
  // Usando spread para colunas em uma matriz
  List<List<int>> tabela = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  
  // Extrair a primeira coluna
  var coluna1 = [for (var linha in tabela) linha[0]];
  print('Primeira coluna: $coluna1');
  
  // Combinação de spread com operador de coleção if
  bool incluirAdmin = true;
  List<String> usuarios = [
    'usuario1',
    'usuario2',
    if (incluirAdmin) 'admin',
  ];
  print('Usuários: $usuarios');
  
  // Combinação de spread com operador de coleção for
  List<int> multiplicadores = [1, 2, 3];
  List<int> multiplicados = [
    for (var m in multiplicadores) m * 10,
  ];
  print('Multiplicados: $multiplicados');
  
  // Combinando spread, if e for
  List<Map<String, dynamic>> produtos = [
    {'nome': 'Laptop', 'preco': 5000, 'estoque': 10},
    {'nome': 'Mouse', 'preco': 120, 'estoque': 0},
    {'nome': 'Teclado', 'preco': 200, 'estoque': 5},
  ];
  
  bool mostrarIndisponiveis = false;
  
  List<String> produtosDisponiveis = [
    ...for (var p in produtos)
      if (p['estoque'] > 0 || mostrarIndisponiveis)
        '${p['nome']} - R\$ ${p['preco']}${p['estoque'] == 0 ? ' (Indisponível)' : ''}',
  ];
  
  print('Produtos disponíveis: $produtosDisponiveis');
}

```

### Boas Práticas com o Spread Operator:

1. **Use para combinar coleções** de forma concisa e legível.
2. **Aproveite o operador null-aware (`...?`)** para lidar com coleções potencialmente nulas.
3. **Crie cópias superficiais** de coleções usando spread para evitar modificar a coleção original.
4. **Combine com operadores de coleção** (`if` e `for`) para criar coleções dinâmicas.
5. **Lembre-se das regras específicas** de cada tipo de coleção (duplicatas em sets são removidas, chaves duplicadas em mapas são sobrescritas).
6. **Use para "achatar" (flatten)** coleções aninhadas quando apropriado.
7. **Prefira spread sobre `addAll()` e métodos similares** para criar novas coleções.

---
Vai para:
- [Sumário](https://github.com/claulis/flutter/blob/main/dart/README.md)
- [Próximo capítulo](../capitulos/funcoes.md)