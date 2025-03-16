import 'package:flutter/material.dart';
import 'tabuleiro.dart';

class SelecionarCoresPag extends StatefulWidget
{
  const SelecionarCoresPag({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _SelecionarCoresPagState createState()=> _SelecionarCoresPagState();
  
}
class _SelecionarCoresPagState extends State<SelecionarCoresPag>
{
  Color corJogadorUm = Colors.red;
  Color corJogadorDois = Colors.green;

  final List<Color> listaCoresDisponiveis = [Colors.red,Colors.green,Colors.blue];
   @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolha as Cores da Peças'),
      ),
      body: Padding(padding: const EdgeInsets.all(20.0),
      child: Center(widthFactor: 500,heightFactor: 500,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const Text('Escolha a cor da peça do jogador 1:',
            style: TextStyle(fontSize: 20,)),
          const  SizedBox(height: 20,),
            Wrap(
              spacing:10,
              children: listaCoresDisponiveis.map(
                (color)=> GestureDetector(
                  onTap:()
                  {
                    setState(() {
                      corJogadorUm = color;
                    });
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: color,
                    child: corJogadorUm == color ?
                     const Icon(Icons.check, color: Colors.white)
                     : null,
                  )
                )
              ).toList(),
            ),
          const Text('Escolha a cor da peça do jogador 2:',
            style: TextStyle(fontSize: 20,)),
          const  SizedBox(height: 20,),
          Wrap(
            spacing: 10,
            children: listaCoresDisponiveis.where(
              (color) => color != corJogadorUm   ).map(
                (color) => GestureDetector(
                  onTap: ()
                  {
                    setState(() {
                      corJogadorDois=color;
                    });
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: color,
                    child: corJogadorDois == color ?
                     const Icon(Icons.check, color: Colors.white)
                     : null,
                  ),
                ),
                ).toList(),
          ),
          const SizedBox(height: 40),
          ElevatedButton(onPressed: ()
          {
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=> Tabuleiro(
              corJogadorUm:corJogadorUm,
              corJogadorDois:corJogadorDois
            )            
            )
            );
          }, 
          child: const Text('Iniciar Jogo'))
          ],
        )
      ),
    ));
  }  
}