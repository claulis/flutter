// Classe imutável
class Pessoa {
  final String nome;
  final int idade;

  const Pessoa(this.nome, this.idade);

  // Método que retorna nova instância (não modifica o original)
  Pessoa comNovaIdade(int novaIdade) {
    return Pessoa(nome, novaIdade);
  }

  @override
  String toString() {
    return 'Pessoa(nome: $nome, idade: $idade)';
  }
}

class ExemploImutabilidade {
  static void demonstrar() {
    // Criando objeto imutável
    final pessoa = Pessoa('João', 30);
    print('Pessoa original: $pessoa');

    // Criando nova instância sem modificar a original
    final pessoaMaisVelha = pessoa.comNovaIdade(31);
    print('Pessoa com nova idade: $pessoaMaisVelha');
    print('Pessoa original permanece inalterada: $pessoa');

    // Demonstrando imutabilidade com listas
    final listaOriginal = [1, 2, 3];
    final novaLista = [...listaOriginal, 4];

    print('\nLista original: $listaOriginal');
    print('Nova lista: $novaLista');
  }
}

void main() {
  ExemploImutabilidade.demonstrar();
}