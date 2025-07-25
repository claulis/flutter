# Provider: Lista de compras

## Visão geral do aplicativo

- **Tela 1 (Adicionar Itens)**: Contém um campo de texto e um botão para adicionar itens à lista de compras.
- **Tela 2 (Visualizar Lista)**: Exibe a lista de compras com botões para remover itens.
- **Gerenciamento de estado**: O pacote **Provider** gerencia a lista como estado global, permitindo que ambas as telas acessem e modifiquem os dados.

[exemplo completo aqui](../assets/code/gerenciador_estado/provider/)

## Código do aplicativo

```dart
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
```

### Explicação do código

O aplicativo é estruturado para ser simples e funcional, com duas telas e gerenciamento de estado global via **Provider**.

#### 1. **Gerenciamento de estado com Provider**

- **Classe `ShoppingList`**:
  - É definida uma classe `ShoppingList` que herda de `ChangeNotifier`, permitindo gerenciar a lista de compras como estado global.
  - Uma lista privada `_items` armazena os itens (strings).
  - O método `addItem` adiciona um item à lista, verificando se não está vazio, e chama `notifyListeners()` para atualizar a interface.
  - O método `removeItem` remove um item pelo índice, garantindo que o índice seja válido, e notifica mudanças.
  - O getter `items` permite acesso à lista de forma segura.

- **Provider**:
  - O `ChangeNotifierProvider` é usado em `MyApp` para fornecer a instância de `ShoppingList` a toda a árvore de widgets.
  - Widgets podem acessar o estado com `context.read<ShoppingList>()` (para modificar) ou `Consumer<ShoppingList>` (para ler e reagir a mudanças).

#### 2. **Estrutura do aplicativo**

- **Classe `MyApp`**:
  - É configurado um `MaterialApp` com duas rotas: `'/'` para `AddItemScreen` e `'/list'` para `ViewListScreen`.
  - O `ChangeNotifierProvider` envolve o `MaterialApp`, garantindo que o estado seja acessível em ambas as telas.

#### 3. **Tela 1: `AddItemScreen`**

- **Função**: Permite adicionar itens à lista.
- **Componentes**:
  - Um `TextField` com um controlador (`_controller`) captura o texto digitado.
  - Um botão `ElevatedButton` adiciona o item à lista usando `context.read<ShoppingList>().addItem`.
  - O campo é limpo após adicionar o item (`_controller.clear()`).
  - Um `IconButton` no `AppBar` navega para a tela de visualização (`ViewListScreen`).
- **Comportamento**:
  - Itens podem ser adicionados ao pressionar "Enter" (via `onSubmitted`) ou clicar no botão.
  - A interface é simples, com padding para melhor apresentação.

#### 4. **Tela 2: `ViewListScreen`**

- **Função**: Exibe a lista de compras e permite remover itens.
- **Componentes**:
  - Um `Consumer<ShoppingList>` observa o estado e atualiza a interface quando a lista muda.
  - Se a lista estiver vazia, é exibida a mensagem "Nenhum item na lista".
  - Um `ListView.builder` cria uma lista de `ListTile`, cada um com o nome do item e um botão de lixeira (`IconButton`) para remoção.
  - Um botão de voltar no `AppBar` retorna à tela de adicionar itens.
- **Comportamento**:
  - Cada item pode ser removido ao clicar na lixeira, chamando `context.read<ShoppingList>().removeItem(index)`.
  - A lista é atualizada automaticamente graças ao `Consumer`.

#### 5. **Navegação**

- É utilizada a navegação por rotas (`Navigator.pushNamed` e `Navigator.pop`) para alternar entre as telas.
- A rota inicial (`'/'`) é a tela de adicionar itens, e a rota `'/list'` acessa a tela de visualização.

  **Analogia**: A navegação é como andar entre o balcão (adicionar itens) e o estoque (visualizar lista) da loja.

### Como rodar o aplicativo

1. **Adicionar o pacote Provider**:
   - É executado o comando no terminal, na pasta raiz do projeto:

     ```bash
     flutter pub add provider
     ```

   - Isso adiciona a dependência `provider` ao `pubspec.yaml` e instala a versão mais recente.

2. **Criar o arquivo `main.dart`**:
   - O código acima é copiado para o arquivo `lib/main.dart` do projeto.

3. **Executar o aplicativo**:
   - É rodado o comando:

     ```bash
     flutter run
     ```

   - O Hot Reload (tecla `r` no terminal) pode ser usado para testar mudanças em tempo real.

