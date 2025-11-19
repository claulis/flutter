// tabuleiro.dart
import 'casa.dart';
import 'peca.dart';

class Tabuleiro {
  static const int tamanho = 8;
  final List<List<Casa>> casas = [];

  Tabuleiro() {
    for (int linha = 0; linha < tamanho; linha++) {
      List<Casa> linhaCasas = [];
      for (int coluna = 0; coluna < tamanho; coluna++) {
        bool escura = (linha + coluna) % 2 == 1;
        Peca? peca;

        // Colocar peças iniciais
        if (escura && linha < 3) {
          peca = Peca(TipoPeca.preta);
        } else if (escura && linha > 4) {
          peca = Peca(TipoPeca.branca);
        }

        linhaCasas.add(Casa(
          linha: linha,
          coluna: coluna,
          escura: escura,
          peca: peca,
        ));
      }
      casas.add(linhaCasas);
    }
  }
}
