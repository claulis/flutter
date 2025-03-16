import 'package:flutter/material.dart';          
// Pacote básico do Flutter
import 'package:provider/provider.dart';         
// Gerenciamento de estado
import '../controller/soma_controller.dart';    
 // Importa o controlador

class ResultadoView extends StatelessWidget {
  const ResultadoView({super.key});              
  // Construtor

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SomaController>();
     // Observa o controlador
    
    return Column(                              
       // Layout em coluna
      children: [
        Text(                                   
           // Exibe mensagem
          controller.message,                    
          // Mensagem do modelo
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 20),             
         // Espaçamento
        ElevatedButton(                          
          // Botão de limpar
          onPressed: controller.clear,          
           // Chama método do controlador
          child: const Text('Limpar'),
        ),
      ],
    );
  }
}