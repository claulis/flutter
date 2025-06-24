import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingList with ChangeNotifier {
  // Lista privada para armazenar os itens
  final List<String> _items = [];

  // Getter para acessar a lista
  List<String> get items => _items;

  // Adiciona um item à lista e notifica mudanças
  void addItem(String item) {
    if (item.isNotEmpty) { // Evita adicionar itens vazios
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
