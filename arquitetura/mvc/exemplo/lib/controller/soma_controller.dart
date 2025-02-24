import 'package:flutter/material.dart';          
// Pacote básico do Flutter
import '../model/soma_model.dart';               
// Importa o modelo

class SomaController extends ChangeNotifier {    
  // Controlador com ChangeNotifier
  final SomaModel _model = SomaModel();         
   // Instancia o modelo
  final TextEditingController num1Controller = TextEditingController(); 
  // Controlador do campo 1
  final TextEditingController num2Controller = TextEditingController(); 
  // Controlador do campo 2

  String get message => _model.message;          
  // Expoe mensagem do modelo

  void addNumbers() {                            
    // Método para adicionar
    final num1 = double.tryParse(num1Controller.text) ?? 0;
     // Converte entrada 1
    final num2 = double.tryParse(num2Controller.text) ?? 0;
     // Converte entrada 2
    _model.add(num1, num2);                      
    // Chama método do modelo
    notifyListeners();                           
    // Notifica views para atualizar
  }

  void clear() {                                 
    // Método para limpar
    _model.clear();                              
    // Chama método do modelo
    num1Controller.clear();                      
    // Limpa campo 1
    num2Controller.clear();                      
    // Limpa campo 2
    notifyListeners();                           
    // Notifica views para atualizar
  }
}