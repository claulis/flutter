import 'package:flutter/material.dart';
import 'Contract_soma_model.dart';      
// Importa o contrato do modelo

// Implementação concreta do modelo que segue o contrato
class SomaModelImpl implements SomaModel {
  double? _result;                              
  // Armazena o resultado
  String _message = "Digite números e clique em 'Somar'";
  // Mensagem padrão

  // Implementação dos getters definidos no contrato
  @override
  double? get result => _result;                
  // Getter para resultado
  
  @override
  String get message => _message;               
  // Getter para mensagem

  // Implementação dos métodos definidos no contrato
  @override
  void add(double num1, double num2) {
    // Lógica de soma
    _result = num1 + num2;                      
    // Calcula resultado
    _message = "Resultado: $_result";           
    // Atualiza mensagem
  }

  @override
  void clear() {
    // Limpa dados
    _result = null;                             
    // Reseta resultado
    _message = "Digite números e clique em 'Somar'";
    // Mensagem inicial
  }
}