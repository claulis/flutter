import 'package:flutter/material.dart';
import '../view/Contract_soma_view.dart';
// Contrato para o Presenter
// Define como o Presenter deve se comportar e o que a View pode solicitar dele
abstract class SomaPresenter {
  // Getters que a View pode acessar
  String get message;
  TextEditingController get num1Controller;
  TextEditingController get num2Controller;
  
  // Métodos que a View pode chamar
  void onSomarPressed();
  void onClearPressed();
  
  // Método para vincular a View ao Presenter
  void setView(SomaView view);
}