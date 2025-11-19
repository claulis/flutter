// peca.dart
enum TipoPeca { branca, preta }

class Peca {
  final TipoPeca tipo;

  Peca(this.tipo);

  String get simbolo {
    return tipo == TipoPeca.branca ? "⚪" : "⚫";
  }
}
