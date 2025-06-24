import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'shoppinglist.dart';

class AddItemScreen extends StatelessWidget {
  // Controlador para o campo de texto
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Item'),
        // Botão de voltar para a tela inicial
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Campo de texto para inserir o item
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Digite o item',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(width: 8),
            // Botão para adicionar o item
            ElevatedButton(
              onPressed: () {
                // Adiciona o item e volta para a tela inicial
                context.read<ShoppingList>().addItem(_controller.text);
                _controller.clear(); // Limpa o campo
                Navigator.pop(context); // Retorna à tela inicial
              },
              child: Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }
}