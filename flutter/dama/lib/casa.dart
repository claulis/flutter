// casa.dart
import 'peca.dart';

class Casa {
  final int linha;
  final int coluna;
  final bool escura;
  Peca? peca;

  Casa({
    required this.linha,
    required this.coluna,
    required this.escura,
    this.peca,
  });
}
