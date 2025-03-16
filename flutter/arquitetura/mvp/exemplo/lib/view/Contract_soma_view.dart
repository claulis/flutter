import 'package:flutter/material.dart';
// Contrato para a View
// Define como a View deve se comportar e o que o Presenter pode solicitar dela
abstract class SomaView {
  // Métodos que a View deve implementar
  void updateUI();
  void showError(String message);
  void clearInputs();
}