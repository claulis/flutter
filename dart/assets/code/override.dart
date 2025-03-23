// override.dart
// Demonstração de sobrescrita de métodos em Dart

// Classe base com métodos que serão sobrescritos
class Animal {
  String nome;
  
  Animal(this.nome);
  
  void fazerSom() {
    print('Som genérico de animal');
  }
  
  void mover() {
    print('$nome está se movendo de alguma forma');
  }
  
  void dormir() {
    print('$nome está dormindo');
  }
  
  // Método com parâmetros para demonstrar sobrescrita com mesma assinatura
  void comer(String alimento) {
    print('$nome está comendo $alimento');
  }
  
  // Método com valor de retorno para demonstrar sobrescrita com tipo de retorno
  String getDescricao() {
    return 'Este é um animal chamado $nome';
  }
}

// Subclasse que sobrescreve métodos da classe base
class Gato extends Animal {
  String cor;
  
  Gato(String nome, this.cor) : super(nome);
  
  // Sobrescrita básica de método
  @override
  void fazerSom() {
    print('$nome mia: Miau!');
  }
  
  // Sobrescrita com implementação completamente diferente
  @override
  void mover() {
    print('$nome está andando silenciosamente');
  }
  
  // Sobrescrita com chamada ao método da superclasse
  @override
  void dormir() {
    super.dormir(); // Chama o método da classe pai
    print('... e está ronronando enquanto dorme');
  }
  
  // Sobrescrita de método com parâmetros
  @override
  void comer(String alimento) {
    if (alimento == 'ração' || alimento == 'peixe') {
      print('$nome está comendo $alimento com satisfação');
    } else {
      print('$nome fareja $alimento e ignora');
    }
  }
  
  // Sobrescrita de método com valor de retorno
  @override
  String getDescricao() {
    return 'Este é um gato $cor chamado $nome';
  }
}

// Outra subclasse para demonstrar diferentes implementações
class Cachorro extends Animal {
  String raca;
  
  Cachorro(String nome, this.raca) : super(nome);
  
  @override
  void fazerSom() {
    print('$nome late: Au au!');
  }
  
  @override
  void mover() {
    print('$nome está correndo alegremente');
  }
  
  @override
  void comer(String alimento) {
    print('$nome devora $alimento rapidamente');
  }
  
  @override
  String getDescricao() {
    return 'Este é um cachorro da raça $raca chamado $nome';
  }
  
  // Método adicional específico desta subclasse
  void abanarRabo() {
    print('$nome está abanando o rabo');
  }
}

// Exemplo de sobrescrita de getters e setters
class Produto {
  double _preco;
  
  Produto(this._preco);
  
  // Getter que será sobrescrito
  double get preco => _preco;
  
  // Setter que será sobrescrito
  set preco(double valor) {
    if (valor >= 0) {
      _preco = valor;
    } else {
      print('Preço não pode ser negativo');
    }
  }
  
  String descricao() {
    return 'Produto com preço: R\$ $_preco';
  }
}

class ProdutoImportado extends Produto {
  double taxaImportacao;
  
  ProdutoImportado(double preco, this.taxaImportacao) : super(preco);
  
  // Sobrescrita de getter
  @override
  double get preco => super.preco * (1 + taxaImportacao);
  
  // Sobrescrita do método descricao
  @override
  String descricao() {
    return 'Produto importado com preço: R\$ ${preco.toStringAsFixed(2)} (inclui taxa de importação de ${(taxaImportacao * 100).toStringAsFixed(0)}%)';
  }
}

void main() {
  print('--- Demonstração de Sobrescrita de Métodos ---');
  
  Animal animalGenerico = Animal('Criatura');
  Gato meuGato = Gato('Mimi', 'cinza');
  Cachorro meuCachorro = Cachorro('Rex', 'Golden Retriever');
  
  print('\n--- Animal Genérico ---');
  animalGenerico.fazerSom();
  animalGenerico.mover();
  animalGenerico.comer('comida');
  print(animalGenerico.getDescricao());
  
  print('\n--- Gato ---');
  meuGato.fazerSom();
  meuGato.mover();
  meuGato.dormir();  // Demonstra chamada ao método da superclasse
  meuGato.comer('ração');
  meuGato.comer('brócolis');
  print(meuGato.getDescricao());
  
  print('\n--- Cachorro ---');
  meuCachorro.fazerSom();
  meuCachorro.mover();
  meuCachorro.comer('carne');
  print(meuCachorro.getDescricao());
  meuCachorro.abanarRabo();
  
  print('\n--- Demonstração de Sobrescrita de Getters e Setters ---');
  Produto produto = Produto(100.0);
  ProdutoImportado produtoImportado = ProdutoImportado(100.0, 0.6);
  
  print('Preço do produto normal: R\$ ${produto.preco}');
  print('Preço do produto importado: R\$ ${produtoImportado.preco}');
  
  print(produto.descricao());
  print(produtoImportado.descricao());
  
  // Demonstração de polimorfismo com sobrescrita
  print('\n--- Demonstração de Polimorfismo com Sobrescrita ---');
  List<Animal> animais = [animalGenerico, meuGato, meuCachorro];
  
  for (var animal in animais) {
    animal.fazerSom();  // Chamará a implementação específica de cada classe
  }
}