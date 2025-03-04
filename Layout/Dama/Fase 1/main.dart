import 'package:flutter/material.dart';

void main() {
  runApp(const XadrezApp());
}

class XadrezApp extends StatelessWidget {
  const XadrezApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tabuleiro de Dama'),
        ),
        body: const Tabuleiro(),
      ),
    );
  }
}

class Tabuleiro extends StatelessWidget {
  const Tabuleiro({super.key});

  @override
  Widget build(BuildContext context) {
   return Center(
    child:  Container(
    width:330,
    height: 330,
    margin:const EdgeInsets.all(250.0),
    decoration: BoxDecoration(
    border: Border.all(
      color: Colors.black54,
      width: 2.0,
      style: BorderStyle.solid
    )
   ),
   child:  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(8, (rowIndex) {
        // Cada linha é uma Row
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(8, (colIndex) {
            // Determina se a casa é preta ou branca
            final bool preto = (rowIndex + colIndex) % 2 == 0;
            return Container(
              width: 40, // Largura de cada casa
              height: 40, // Altura de cada casa
              color: preto ? Colors.black : Colors.white,
              child: Stack(
                children: [
                  // Exemplo de elemento opcional (um círculo no centro)
                  if (preto && rowIndex !=0 && rowIndex !=1 && rowIndex !=2 && rowIndex !=3 && rowIndex !=4 ) 
                    Center(
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  if(preto && rowIndex !=3 && rowIndex !=4 && rowIndex !=5 && rowIndex !=6 && rowIndex !=7)
                  Center(
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: Colors.green,
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
    ) 
   )
   );
   
    
  }
}
