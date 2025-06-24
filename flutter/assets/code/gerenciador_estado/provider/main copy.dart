import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'shoppinglist.dart';
import 'add_item.dart';

// Classe que gerencia a lista de compras com ChangeNotifier

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
          '/': (context) => HomeScreen(),
          '/add': (context) => AddItemScreen(),
        },
      ),
    );
  }
}

// Tela inicial que exibe a lista de compras
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
      ),
      body: Consumer<ShoppingList>(
        builder: (context, shoppingList, child) {
          // Verifica se a lista está vazia
          if (shoppingList.items.isEmpty) {
            return Center(child: Text('Nenhum item na lista'));
          }
          // Exibe a lista de itens com botão de remover
          return ListView.builder(
            itemCount: shoppingList.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(shoppingList.items[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Remove o item ao clicar no ícone de lixeira
                    context.read<ShoppingList>().removeItem(index);
                  },
                ),
              );
            },
          );
        },
      ),
      // Botão flutuante para navegar para a tela de adicionar itens
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}



void main() {
  // Inicia o aplicativo
  runApp(MyApp());
}