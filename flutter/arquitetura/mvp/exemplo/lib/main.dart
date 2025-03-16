import 'package:flutter/material.dart';
// Pacote básico do Flutter
import 'package:provider/provider.dart';
// Gerenciamento de estado
import 'package:soma_mvp/model/Implement_soma_model.dart' ;          
// Implementação concreta do modelo
import 'package:soma_mvp/presenter/Implement_soma_presenter.dart';     
// Implementação concreta do presenter
import 'package:soma_mvp/view/Implements_soma_view.dart';             
// View principal que implementa o contrato

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora MVP',                 
      // Título do app
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const SomaPage(),            
      // Página principal
    );
  }
}

// Página que configura as dependências e inicia a estrutura MVP
class SomaPage extends StatelessWidget {
  const SomaPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Criamos o modelo e o presenter aqui, injetando as dependências manualmente
    final modelImpl = SomaModelImpl();
    final presenterImpl = SomaPresenterImpl(modelImpl);
    
    // Retornamos a view principal, injetando o presenter
    return SomaViewImpl(presenter: presenterImpl);
  }
}