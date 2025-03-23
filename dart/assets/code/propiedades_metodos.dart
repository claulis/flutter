// propriedades_metodos.dart

// Classe demonstrando propriedades e métodos
class ContaBancaria {
  // Propriedades públicas
  String titular;
  String numeroConta;
  
  // Propriedade privada (acessível apenas dentro desta biblioteca)
  double _saldo;
  
  // Propriedade final (não pode ser alterada após a inicialização)
  final String banco;
  
  // Propriedade nullable (pode ser null)
  String? endereco;
  
  // Construtor
  ContaBancaria(this.titular, this.numeroConta, this._saldo, this.banco);
  
  // Método para depositar
  void depositar(double valor) {
    if (valor <= 0) {
      throw ArgumentError('O valor de depósito deve ser positivo');
    }
    
    _saldo += valor;
    print('Depósito de R\$ $valor realizado. Novo saldo: R\$ $_saldo');
  }
  
  // Método para sacar com retorno de valor
  bool sacar(double valor) {
    if (valor <= 0) {
      throw ArgumentError('O valor de saque deve ser positivo');
    }
    
    if (_saldo >= valor) {
      _saldo -= valor;
      print('Saque de R\$ $valor realizado. Novo saldo: R\$ $_saldo');
      return true;
    } else {
      print('Saldo insuficiente para saque de R\$ $valor. Saldo atual: R\$ $_saldo');
      return false;
    }
  }
  
  // Método para transferir (usa outros métodos)
  bool transferir(double valor, ContaBancaria destino) {
    if (sacar(valor)) {
      destino.depositar(valor);
      print('Transferência de R\$ $valor para ${destino.titular} realizada com sucesso');
      return true;
    }
    return false;
  }
  
  // Método para consultar saldo
  double consultarSaldo() {
    return _saldo;
  }
  
  // Método privado (implementação interna)
  void _registrarTransacao(String tipo, double valor) {
    final data = DateTime.now();
    print('$data - $tipo: R\$ $valor - Conta: $numeroConta');
  }
  
  // Método que retorna uma representação string do objeto
  @override
  String toString() {
    return 'ContaBancaria(titular: $titular, conta: $numeroConta, banco: $banco, saldo: $_saldo)';
  }
}

// Exemplo de classe com diferentes tipos de propriedades
class Produto {
  // Propriedade obrigatória e imutável
  final String id;
  
  // Propriedade obrigatória
  String nome;
  
  // Propriedade com valor padrão
  double preco = 0.0;
  
  // Propriedades nullable
  String? descricao;
  String? categoria;
  
  // Propriedade privada com valor padrão
  int _estoque = 0;
  
  // Propriedade computed (calculada a partir de outras)
  bool get disponivel => _estoque > 0;
  
  // Lista de propriedades
  List<String> tags = [];
  
  // Mapa de propriedades
  Map<String, dynamic> atributos = {};
  
  // Construtor
  Produto(this.id, this.nome);
  
  // Método para adicionar estoque
  void adicionarEstoque(int quantidade) {
    if (quantidade > 0) {
      _estoque += quantidade;
    }
  }
  
  // Método para remover estoque
  bool removerEstoque(int quantidade) {
    if (quantidade > 0 && _estoque >= quantidade) {
      _estoque -= quantidade;
      return true;
    }
    return false;
  }
  
  // Método para consultar estoque
  int consultarEstoque() {
    return _estoque;
  }
  
  // Método para adicionar tag
  void adicionarTag(String tag) {
    if (!tags.contains(tag)) {
      tags.add(tag);
    }
  }
  
  // Método para definir atributo
  void definirAtributo(String chave, dynamic valor) {
    atributos[chave] = valor;
  }
  
  // Método para obter atributo
  dynamic obterAtributo(String chave) {
    return atributos[chave];
  }
  
  // Exemplo de método que usa parâmetros opcionais
  String obterDescricaoCompleta({bool incluirEstoque = false, bool incluirCategoria = false}) {
    String resultado = '$nome - R\$ $preco';
    
    if (descricao != null) {
      resultado += '\n$descricao';
    }
    
    if (incluirCategoria && categoria != null) {
      resultado += '\nCategoria: $categoria';
    }
    
    if (incluirEstoque) {
      resultado += '\nEstoque: $_estoque unidades';
    }
    
    return resultado;
  }
}

void main() {
  print('---- Conta Bancária - Propriedades e Métodos ----');
  
  var contaJoao = ContaBancaria('João Silva', '1234-5', 1000.0, 'Banco Exemplo');
  var contaMaria = ContaBancaria('Maria Souza', '6789-0', 2000.0, 'Banco Exemplo');
  
  print(contaJoao);
  print(contaMaria);
  
  contaJoao.depositar(500.0);
  contaMaria.sacar(300.0);
  
  contaJoao.transferir(200.0, contaMaria);
  
  print('Saldo de ${contaJoao.titular}: R\$ ${contaJoao.consultarSaldo()}');
  print('Saldo de ${contaMaria.titular}: R\$ ${contaMaria.consultarSaldo()}');
  
  // Definindo propriedade opcional
  contaJoao.endereco = 'Rua Principal, 123';
  print('Endereço de ${contaJoao.titular}: ${contaJoao.endereco}');
  print('Endereço de ${contaMaria.titular}: ${contaMaria.endereco ?? "Não informado"}');
  
  print('\n---- Produto - Diferentes tipos de propriedades ----');
  
  var notebook = Produto('P001', 'Notebook Profissional');
  notebook.preco = 4500.0;
  notebook.descricao = 'Notebook com processador de última geração';
  notebook.categoria = 'Eletrônicos';
  
  notebook.adicionarEstoque(10);
  
  notebook.adicionarTag('promoção');
  notebook.adicionarTag('informática');
  
  notebook.definirAtributo('marca', 'TechBrand');
  notebook.definirAtributo('garantia', 12); // meses
  notebook.definirAtributo('cor', 'prata');
  
  print('Produto: ${notebook.nome}');
  print('Preço: R\$ ${notebook.preco}');
  print('Disponível: ${notebook.disponivel ? "Sim" : "Não"}');
  print('Estoque: ${notebook.consultarEstoque()}');
  print('Tags: ${notebook.tags.join(", ")}');
  print('Marca: ${notebook.obterAtributo("marca")}');
  
  print('\nDescrição completa:');
  print(notebook.obterDescricaoCompleta(incluirEstoque: true, incluirCategoria: true));
  
  // Testando a remoção de estoque
  if (notebook.removerEstoque(3)) {
    print('\nVenda realizada. Novo estoque: ${notebook.consultarEstoque()}');
  }
}