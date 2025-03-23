
class Produto {
  late String nome;
  late double preco;
  late int quantidade;
  
  String descricao() {
    return '$nome - R\$ $preco (Estoque: $quantidade)';
  }
}

class Carro {
 late String marca;
 late String modelo;
 late int ano;
 late String cor;
  
  void exibirDetalhes() {
    print('$marca $modelo $ano, cor: $cor');
  }
  
  bool ehNovo() {
    // Considerando que um carro com menos de 3 anos é novo
    return DateTime.now().year - ano < 3;
  }
}

void main() {
  // Criação básica de objetos
  print('---- Criação básica de objetos ----');
  
  // Criação usando a palavra-chave 'new' (opcional)
  Produto produto1 = new Produto();
  produto1.nome = 'Notebook';
  produto1.preco = 3500.00;
  produto1.quantidade = 10;
  print(produto1.descricao());
  
  // Criação sem a palavra-chave 'new' (forma moderna preferida)
  var produto2 = Produto();
  produto2.nome = 'Smartphone';
  produto2.preco = 1800.50;
  produto2.quantidade = 25;
  print(produto2.descricao());
  
  // Criação com inferência de tipo
  final produto3 = Produto();
  produto3.nome = 'Tablet';
  produto3.preco = 1200.00;
  produto3.quantidade = 15;
  print(produto3.descricao());
  
  // Criação de múltiplos objetos
  print('\n---- Criação de múltiplos objetos ----');
  
  var carro1 = Carro();
  carro1.marca = 'Toyota';
  carro1.modelo = 'Corolla';
  carro1.ano = 2023;
  carro1.cor = 'Prata';
  
  var carro2 = Carro();
  carro2.marca = 'Honda';
  carro2.modelo = 'Civic';
  carro2.ano = 2020;
  carro2.cor = 'Preto';
  
  // Usando métodos dos objetos
  carro1.exibirDetalhes();
  print('É novo? ${carro1.ehNovo()}');
  
  carro2.exibirDetalhes();
  print('É novo? ${carro2.ehNovo()}');
  
  // Armazenando objetos em uma lista
  print('\n---- Objetos em coleções ----');
  
  List<Produto> estoque = [];
  estoque.add(produto1);
  estoque.add(produto2);
  estoque.add(produto3);
  
  print('Itens em estoque:');
  for (var produto in estoque) {
    print('- ${produto.descricao()}');
  }
  
  // Comparação de objetos
  print('\n---- Comparação de objetos ----');
  var prod1 = Produto();
  prod1.nome = 'Mouse';
  
  var prod2 = Produto();
  prod2.nome = 'Mouse';
  
  // Isso vai retornar false pois são referências diferentes
  print('prod1 == prod2: ${prod1 == prod2}');
  
  var prod3 = prod1;
  // Isso vai retornar true pois agora ambas variáveis apontam para o mesmo objeto
  print('prod1 == prod3: ${prod1 == prod3}');
  
  // Alteração feita em prod3 afeta prod1
  prod3.preco = 50.00;
  print('Preço de prod1: ${prod1.preco}');
}