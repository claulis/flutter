import 'package:flutter/material.dart';
import 'tabuleiro_estado.dart';
import 'peca.dart';
class Tabuleiro extends StatefulWidget { //classe tabuleiro
  final Color corJogadorUm;
  final Color corJogadorDois;
  const Tabuleiro({//construtor da classe
    super.key,
    required this.corJogadorUm,
    required this.corJogadorDois,
  });
  @override
  _TabuleiroState createState() => _TabuleiroState();//inicializa o estado do tabuleiro
}
class _TabuleiroState extends State<Tabuleiro> {//classe para manter o estado do tabuleiro
  final TabuleiroEstado estado = TabuleiroEstado();//aqui criamos a classe responsável as posições no tabuleiro
  @override
  void initState() {
    super.initState();
    estado.inicializar();
  }
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
            children: List.generate(8, (indiceLinha) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(8, (indiceColuna) {
                  final bool preto = (indiceLinha + indiceColuna) % 2 == 0;
                  final int? peca = estado.tabuleiro[indiceLinha][indiceColuna];//nova funcionalidade
                  return DragTarget<Map<String, int>>(//deixa os elementos visuais arrastaveis, requer um mapeamento
                    onWillAccept: (data) {//verifica quais posições são possiveis de movimento
                      return estado.podeMover(indiceLinha, indiceColuna) && preto;
                    },
                    onAccept: (data) {
                      setState(() {//atualiza as posições
                        estado.tabuleiro[data["daLinha"]!][data["daColuna"]!] = null;//apaga a posição antiga
                        estado.tabuleiro[indiceLinha][indiceColuna] = data["jogador"];//atualiza a posição nova
                      });
                    },
                    builder: (context, candidateData, rejectedData) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 40, height: 40,
                          color: preto ? Colors.black : Colors.white,
                          child: peca != null //se a peça tem jogador, permite arrastar
                              ? Draggable<Map<String, int>>(
                                  data: {
                                    "daLinha": indiceLinha,"daColuna": indiceColuna,"jogador": peca
                                  },
                                  feedback: Peca(// nesse momento é configurada a peça que está sendo arrastada
                                    cor: peca == 1? widget.corJogadorUm: widget.corJogadorDois,
                                    tamanho: 30.0,//aumenta de pouco o tamanho, perspectiva visual
                                  ),
                                  childWhenDragging: Container(),//lugar onde vai ser solta a peça
                                  child: Center(
                                    child: Peca(
                                      cor: peca == 1 ? widget.corJogadorUm : widget.corJogadorDois,
                                    ),
                                  ),
                                ): null,//fim Draggable, null se a peça for em cima de posição null
                        ),//fim container
                      );//fim GestureDetector
                    },//fim builder
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
