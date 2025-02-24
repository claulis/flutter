import 'package:flutter/material.dart';          
// Pacote básico do Flutter
import 'package:provider/provider.dart';         
// Gerenciamento de estado
import 'controller/soma_controller.dart';        
// Controlador MVC
import 'view/input_view.dart';                  
 // View de entrada
import 'view/resultado_view.dart';               
// View de resultado

void main() {
  runApp(
    ChangeNotifierProvider(                      
      // Provedor de estado global
      create: (context) => SomaController(),     
      // Instancia o controlador
      child: const MyApp(),                      
      // Widget raiz
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora MVC',                  
      // Título do app
      home: Scaffold(                           
         // Estrutura básica da tela
        appBar: AppBar(title: const Text('Calculadora MVC Simplificada')),
        body: const Padding(
          padding: EdgeInsets.all(16.0),         
          // Espaçamento interno
          child: Column(                         
            // Layout em coluna
            children: [
              InputView(),                       
              // Widget de entrada (View 1)
              SizedBox(height: 40),              
              // Espaço entre componentes
              ResultadoView(),                  
              // Widget de resultado (View 2)
            ],
          ),
        ),
      ),
    );
  }
}