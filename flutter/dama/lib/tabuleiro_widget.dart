// tabuleiro_widget.dart
import 'package:flutter/material.dart';
import 'tabuleiro.dart';

class TabuleiroWidget extends StatelessWidget {
  const TabuleiroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tabuleiro = Tabuleiro();

    return AspectRatio(
      aspectRatio: 1,
      child: GridView.builder(
        itemCount: Tabuleiro.tamanho * Tabuleiro.tamanho,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Tabuleiro.tamanho,
        ),
        itemBuilder: (context, index) {
          int linha = index ~/ Tabuleiro.tamanho;
          int coluna = index % Tabuleiro.tamanho;
          final casa = tabuleiro.casas[linha][coluna];

          return Container(
            decoration: BoxDecoration(
              color: casa.escura ? Colors.brown : Colors.white70,
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                casa.peca?.simbolo ?? "",
                style: const TextStyle(fontSize: 28),
              ),
            ),
          );
        },
      ),
    );
  }
}
