import 'package:flutter/material.dart';
import 'package:soma_mvp/view/Contract_soma_view.dart';
// Pacote básico do Flutter
import '../model/Contract_soma_model.dart';
import '../presenter/Contract_soma_presenter.dart';
// Importa o contrato da view e presenter

// Implementação concreta da view que segue o contrato
class SomaViewImpl extends StatefulWidget {
  // Recebe o presenter via construtor (injeção de dependência)
  final SomaPresenter presenter;
  
  const SomaViewImpl({Key? key, required this.presenter}) : super(key: key);

  @override
  State<SomaViewImpl> createState() => _SomaViewImplViewState();
}

class _SomaViewImplViewState extends State<SomaViewImpl> implements SomaView {
  // Referência ao presenter para facilitar o acesso
  SomaPresenter get _presenter => widget.presenter;
  
  @override
  void initState() {
    super.initState();
    // Vincula esta view ao presenter
    _presenter.setView(this);
  }

  @override
  void dispose() {
    // Limpar recursos quando o widget for destruído
    _presenter.num1Controller.dispose();
    _presenter.num2Controller.dispose();
    super.dispose();
  }

  // Implementação dos métodos definidos no contrato da View
  @override
  void updateUI() {
    // Força a reconstrução do widget
    setState(() {});
  }

  @override
  void showError(String message) {
    // Exibe um snackbar com a mensagem de erro
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void clearInputs() {
    // Limpa os controladores de texto
    _presenter.num1Controller.clear();
    _presenter.num2Controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora MVP com Contratos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Seção de entrada de dados
            TextField(
              controller: _presenter.num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Número 1'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _presenter.num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Número 2'),
            ),
            const SizedBox(height: 20),
            
            // Botão de soma
            ElevatedButton(
              onPressed: _presenter.onSomarPressed,
              child: const Text('Somar'),
            ),
            
            // Espaçamento
            const SizedBox(height: 40),
            
            // Seção de resultado
            Center(
              child: Text(
                _presenter.message,
                style: const TextStyle(fontSize: 24),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Botão de limpar
            ElevatedButton(
              onPressed: _presenter.onClearPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
              ),
              child: const Text('Limpar'),
            ),
          ],
        ),
      ),
    );
  }
}