import 'package:flutter/material.dart';
// Pacote básico do Flutter
import 'Contract_soma_presenter.dart';
import '../model/Contract_soma_model.dart';
import '../view/Contract_soma_view.dart';
// Importa todos os contratos

// Implementação concreta do presenter que segue o contrato
class SomaPresenterImpl implements SomaPresenter {
  // Referência ao modelo (via contrato, não implementação concreta)
  final SomaModel _model;
  
  // Referência à view (será definida posteriormente)
  SomaView? _view;
  
  // Controladores para os campos de texto
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  
  // Construtor que recebe a implementação do modelo
  SomaPresenterImpl(this._model);

  // Implementação dos getters definidos no contrato
  @override
  String get message => _model.message;
  
  @override
  TextEditingController get num1Controller => _num1Controller;
  
  @override
  TextEditingController get num2Controller => _num2Controller;

  // Método para vincular a view ao presenter
  @override
  void setView(SomaView view) {
    _view = view;
  }

  // Implementação dos métodos definidos no contrato
  @override
  void onSomarPressed() {
    // Validação de entrada
    final num1Text = _num1Controller.text;
    final num2Text = _num2Controller.text;
    
    // Verificar se os campos estão vazios
    if (num1Text.isEmpty || num2Text.isEmpty) {
      _view?.showError("Por favor, preencha ambos os campos");
      return;
    }
    
    // Tentativa de conversão
    final num1 = double.tryParse(num1Text);
    final num2 = double.tryParse(num2Text);
    
    // Verificar se a conversão foi bem sucedida
    if (num1 == null || num2 == null) {
      _view?.showError("Por favor, insira números válidos");
      return;
    }
    
    // Chamar o modelo para realizar a operação
    _model.add(num1, num2);
    
    // Atualizar a UI
    _view?.updateUI();
  }

  @override
  void onClearPressed() {
    // Chamar o modelo para limpar os dados
    _model.clear();
    
    // Limpar os campos de texto através da view
    _view?.clearInputs();
    
    // Atualizar a UI
    _view?.updateUI();
  }
}