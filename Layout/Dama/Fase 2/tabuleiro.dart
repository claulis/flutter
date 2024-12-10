import 'package:flutter/material.dart';

class Tabuleiro extends StatelessWidget {
  final Color corJogadorUm;
  final Color corJogadorDois;

  const Tabuleiro({
    super.key,
    required this.corJogadorUm,
    required this.corJogadorDois,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabuleiro de Dama'),
      ),
      body: Center(
        child: Container(
          width: 330,
          height: 330,
          margin: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black54,
              width: 2.0,
              style: BorderStyle.solid,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(8, (rowIndex) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(8, (colIndex) {
                  final bool preto = (rowIndex + colIndex) % 2 == 0;
                  final bool pecaJogUm = preto && rowIndex !=0 && rowIndex !=1 && rowIndex !=2 && rowIndex !=3 && rowIndex !=4;
                  final bool pegaJogDois = preto && rowIndex !=3 && rowIndex !=4 && rowIndex !=5 && rowIndex !=6 && rowIndex !=7;

                  return Container(
                    width: 40,
                    height: 40,
                    color: preto ? Colors.black : Colors.white,
                    child: Stack(
                      children: [
                        if (pecaJogUm)
                          Center(
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: corJogadorUm,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        if (pegaJogDois)
                          Center(
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: corJogadorDois,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                }),
              );
            }),
          ),
        ),
      ),
    );
  }
}
