import 'package:flutter/material.dart';
// As peças da dama serão widgets, componentes visuais
class Peca extends StatelessWidget {//vão herdar da classe StatelessWidget
  final Color cor;
  final double tamanho;
  const Peca({super.key, required this.cor, this.tamanho = 20.0});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: tamanho,//mesma altura e largura
      height: tamanho,
      decoration: BoxDecoration(
        color: cor,//definindo a cor dependendo se for jogador 1 ou 2
        shape: BoxShape.circle,
      ),
    );
  }
}