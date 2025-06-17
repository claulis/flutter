import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Classe que gerencia a lista de compras com ChangeNotifier
class ShoppingList with ChangeNotifier {
  // Lista privada que armazena os itens
  final List<String> _items = [];

  // Getter para acessar a lista
  List<String> get items => _items;

  // Adiciona um item à lista e notifica mudanças
  void addItem(String item) {
    if (item.isNotEmpty) { // Garante que o item não seja vazio
      _items.add(item);
      notifyListeners(); // Atualiza os widgets que dependem do estado
    }
  }

  // Remove um item pelo índice e notifica mudanças
  void removeItem(int index) {
    if (index >= 0 && index < _items.length) { // Verifica índice válido
      _items.removeAt(index);
      notifyListeners(); // Atualiza os widgets que dependem do estado
    }
  }
}

// Widget principal do aplicativo
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Fornece o estado global com ChangeNotifierProvider
    return ChangeNotifierProvider(
      create: (context) => ShoppingList(),
      child: MaterialApp(
        title: 'Lista de Compras',
        theme: ThemeData(primarySwatch: Colors.blue),
        // Define as rotas para as duas telas
        initialRoute: '/',
        routes: {
          '/': (context) => AddItemScreen(),
          '/list': (context) => ViewListScreen(),
        },
      ),
    );
  }
}

// Tela para adicionar itens
class AddItemScreen extends StatelessWidget {
  // Controlador para o campo de texto
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Item'),
        actions: [
          // Botão para navegar para a tela de visualização
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              Navigator.pushNamed(context, '/list');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo de texto para inserir itens
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Digite o item',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                // Adiciona o item ao pressionar Enter
                context.read<ShoppingList>().addItem(value);
                _controller.clear(); // Limpa o campo
              },
            ),
            SizedBox(height: 16),
            // Botão para adicionar o item
            ElevatedButton(
              onPressed: () {
                context.read<ShoppingList>().addItem(_controller.text);
                _controller.clear(); // Limpa o campo
              },
              child: Text('Adicionar à Lista'),
            ),
          ],
        ),
      ),
    );
  }
}

// Tela para visualizar e remover itens
class ViewListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
        // Botão para voltar à tela de adicionar itens
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Consumer<ShoppingList>(
        builder: (context, shoppingList, child) {
          // Verifica se a lista está vazia
          if (shoppingList.items.isEmpty) {
            return Center(child: Text('Nenhum item na lista'));
          }
          // Exibe a lista de itens
          return ListView.builder(
            itemCount: shoppingList.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(shoppingList.items[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Remove o item ao clicar na lixeira
                    context.read<ShoppingList>().removeItem(index);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

void main() {
  // Inicia o aplicativo
  runApp(MyApp());
}