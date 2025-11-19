// principal.dart
import 'package:flutter/material.dart';
import 'tabuleiro_widget.dart';

void main() {
  runApp(const AplicativoDamas());
}

class AplicativoDamas extends StatelessWidget {
  const AplicativoDamas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo de Damas',
      home: Scaffold(
        appBar: AppBar(title: const Text('Tabuleiro de Damas')),
        body: const Center(child: TabuleiroWidget()),
      ),
    );
  }
}
