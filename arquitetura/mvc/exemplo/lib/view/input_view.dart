import 'package:flutter/material.dart';          
// Pacote básico do Flutter
import 'package:provider/provider.dart';         
// Gerenciamento de estado
import '../controller/soma_controller.dart';    
 // Importa o controlador

class InputView extends StatelessWidget {
  const InputView({super.key});                  
  // Construtor

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SomaController>(); 
    // Observa o controlador
    
    return Column(                               
      // Layout em coluna
      children: [
        TextField(                               
          // Campo de texto 1
          controller: controller.num1Controller, 
          // Vincula ao controlador
          keyboardType: TextInputType.number,   
           // Teclado numérico
          decoration: const InputDecoration(labelText: 'Número 1'),
        ),
        TextField(                              
           // Campo de texto 2
          controller: controller.num2Controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Número 2'),
        ),
        const SizedBox(height: 20),              
        // Espaçamento
        ElevatedButton(                         
           // Botão de ação
          onPressed: controller.addNumbers,     
          // Chama método do controlador
          child: const Text('Somar'),
        ),
      ],
    );
  }
}