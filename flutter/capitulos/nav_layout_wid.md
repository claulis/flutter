# Widgets de Layout de Navegação

Usados para estruturar a navegação e o layout entre telas.

- Navigator: Gerencia uma pilha de telas (rotas).
- BottomNavigationBar: Barra de navegação inferior para alternar entre telas.
- TabBar: Barra de guias para navegação por abas.
- TabBarView: Exibe o conteúdo correspondente às abas do TabBar.
- Drawer: Menu lateral deslizante, geralmente usado com Scaffold.

## Configuração Base

Os exemplos são completos e substituem o conteúdo de `lib/main.dart`, pois a navegação geralmente envolve a estrutura completa do aplicativo. Você pode copiar cada trecho de código diretamente para um arquivo Dart no VS Code. Para manter a resposta concisa, cada exemplo foca no widget em questão, usando `Container` ou `Text` como conteúdo para ilustrar a navegação.

---

### 1. **Navigator**

**Descrição**: Gerencia uma pilha de telas (rotas) para navegação entre páginas.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigator Example - First')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
          },
          child: const Text('Go to Second Screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Back to First Screen'),
        ),
      ),
    );
  }
}
```

---

### 2. **BottomNavigationBar**

**Descrição**: Barra de navegação inferior para alternar entre telas.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    Center(child: Text('Home Screen')),
    Center(child: Text('Search Screen')),
    Center(child: Text('Profile Screen')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BottomNavigationBar Example')),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
```

---

### 3. **TabBar**

**Descrição**: Barra de guias para navegação por abas, usada com `TabBarView`.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('TabBar Example'),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Home'),
                Tab(icon: Icon(Icons.search), text: 'Search'),
                Tab(icon: Icon(Icons.person), text: 'Profile'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Center(child: Text('Home Tab')),
              Center(child: Text('Search Tab')),
              Center(child: Text('Profile Tab')),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

### 4. **TabBarView**

**Descrição**: Exibe o conteúdo correspondente às abas do `TabBar`. (Nota: Já incluído no exemplo do `TabBar` acima, mas pode ser usado separadamente com um `TabController`.)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTabBarView(),
    );
  }
}

class MyTabBarView extends StatefulWidget {
  @override
  _MyTabBarViewState createState() => _MyTabBarViewState();
}

class _MyTabBarViewState extends State<MyTabBarView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBarView Example'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.star), text: 'Tab 1'),
            Tab(icon: Icon(Icons.favorite), text: 'Tab 2'),
            Tab(icon: Icon(Icons.settings), text: 'Tab 3'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text('Tab 1 Content')),
          Center(child: Text('Tab 2 Content')),
          Center(child: Text('Tab 3 Content')),
        ],
      ),
    );
  }
}
```

---

### 5. **Drawer**

**Descrição**: Menu lateral deslizante, geralmente usado com `Scaffold`.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Drawer Example')),
        body: const Center(child: Text('Drawer Content')),
        drawer: Drawer(
          child: ListView(
            children: const [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text('Drawer Header', style: TextStyle(color: Colors.white)),
              ),
              ListTile(title: Text('Item 1'), leading: Icon(Icons.home)),
              ListTile(title: Text('Item 2'), leading: Icon(Icons.settings)),
            ],
          ),
        ),
      ),
    );
  }
}
```
---

### Instruções para Testar no VS Code

1. Crie um novo projeto Flutter no VS Code (`Ctrl+Shift+P` > `Flutter: New Project`).
2. Substitua o conteúdo de `lib/main.dart` pelo código de cada exemplo fornecido nos artefatos acima.
3. Para testar a navegação:
   - Em `Navigator`, clique no botão para alternar entre telas.
   - Em `BottomNavigationBar`, toque nos ícones da barra inferior.
   - Em `TabBar` e `TabBarView`, toque nas guias.
   - Em `Drawer`, deslize da borda esquerda ou clique no ícone do menu na `AppBar`.

### Notas

- **Contexto**: Cada exemplo é um aplicativo completo, pois os widgets de navegação geralmente definem a estrutura da tela. `TabBarView` foi mostrado com um `TabController` personalizado para ilustrar seu uso independente.
- **Estilização**: Usei ícones e cores simples para destacar a funcionalidade de navegação. Você pode personalizar com mais estilos (ex.: cores, ícones personalizados).
