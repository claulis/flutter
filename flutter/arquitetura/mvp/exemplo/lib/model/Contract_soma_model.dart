import 'package:flutter/material.dart';

// Contrato para o Model
// Define quais operações o modelo deve oferecer
abstract class SomaModel {
  // Getters
  double? get result;
  String get message;
  
  // Métodos
  void add(double num1, double num2);
  void clear();
}