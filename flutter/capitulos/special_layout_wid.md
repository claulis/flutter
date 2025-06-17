# Widgets de Layout Especiais

Esses widgets oferecem funcionalidades específicas para layouts complexos.

- Scaffold: Fornece a estrutura básica de uma tela de aplicativo (com AppBar, Body, FloatingActionButton, Drawer, etc.).
- AppBar: Barra superior de navegação, geralmente usada dentro do Scaffold.
- SliverAppBar: Versão flexível do AppBar para listas roláveis (usado com CustomScrollView).
- CustomScrollView: Permite criar layouts roláveis complexos com slivers (ex.: SliverList, SliverGrid).
- NestedScrollView: Suporta layouts aninhados com barras de aplicativos roláveis.
- SingleChildScrollView: Permite rolagem para um único widget filho.
- Expanded: Usado em Row/Column para expandir o widget filho e ocupar o espaço disponível.
- Spacer: Cria um espaço flexível entre widgets em Row ou Column.
- Divider: Adiciona uma linha horizontal para separar conteúdos.
- VerticalDivider: Adiciona uma linha vertical (menos comum, requer ajustes).
- Card: Cria um cartão com bordas arredondadas e sombra, usado para agrupar conteúdos.
- ListTile: Widget pré-formatado para itens de lista, com suporte a ícones, títulos e subtítulos.

Abaixo está um exemplo rápido de cada **widget de layout especial** do Flutter, conforme listado na sua primeira pergunta. Esses widgets oferecem funcionalidades específicas para layouts complexos, como estruturas de aplicativos, listas roláveis, ou navegação. Cada exemplo é minimalista, funcional e projetado para ser testado no Visual Studio Code (ou outra IDE) com o Flutter configurado, seguindo o mesmo formato dos exemplos anteriores para widgets de linha única e múltiplos filhos. Cada exemplo inclui uma breve explicação de sua funcionalidade.

### Configuração Base

Todos os exemplos usam uma estrutura básica de aplicativo Flutter. Para widgets como `Scaffold`, o exemplo já inclui a estrutura completa. Para outros, você pode copiar o trecho de código para o `body` de um `Scaffold` em um arquivo Dart no VS Code. Aqui está a estrutura base para os exemplos que requerem apenas o `body`:

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
        appBar: AppBar(title: const Text('Special Layout Widget Example')),
        body: // Insira o widget de exemplo aqui
      ),
    );
  }
}
```

Substitua o `body` pelo código de cada widget abaixo, exceto para `Scaffold`, `AppBar`, e `SliverAppBar`, que têm exemplos completos com `MaterialApp`. Para manter a resposta concisa, cada exemplo foca no widget em questão, usando `Container` ou `Text` como filhos para ilustrar o layout.

---

### 1. **Scaffold**

**Descrição**: Fornece a estrutura básica de uma tela de aplicativo, com suporte para `AppBar`, `body`, `FloatingActionButton`, `Drawer`, etc.

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
        appBar: AppBar(title: const Text('Scaffold Example')),
        body: const Center(child: Text('Scaffold Body')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        drawer: const Drawer(child: ListTile(title: Text('Drawer Item'))),
      ),
    );
  }
}
```

---

### 2. **AppBar**

**Descrição**: Barra superior de navegação, geralmente usada dentro de um `Scaffold`.

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
        appBar: AppBar(
          title: const Text('AppBar Example'),
          actions: [
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          ],
        ),
        body: const Center(child: Text('AppBar Body')),
      ),
    );
  }
}
```

---

### 3. **SliverAppBar**

**Descrição**: Versão flexível do `AppBar` para listas roláveis, usada com `CustomScrollView`.

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
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text('SliverAppBar Example'),
              floating: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: ColoredBox(color: Colors.blue),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(color: Colors.green, height: 100, child: const Text('Item 1')),
                Container(color: Colors.red, height: 100, child: const Text('Item 2')),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

### 4. **CustomScrollView**

**Descrição**: Permite layouts roláveis complexos com slivers.

```dart
CustomScrollView(
  slivers: [
    SliverList(
      delegate: SliverChildListDelegate([
        Container(color: Colors.blue, height: 100, child: const Text('Item 1')),
        Container(color: Colors.green, height: 100, child: const Text('Item 2')),
        Container(color: Colors.red, height: 100, child: const Text('Item 3')),
      ]),
    ),
  ],
)
```

---

### 5. **NestedScrollView**

**Descrição**: Suporta layouts aninhados com barras de aplicativos roláveis.

```dart
NestedScrollView(
  headerSliverBuilder: (context, innerBoxIsScrolled) => [
    const SliverAppBar(
      title: Text('NestedScrollView Example'),
      floating: true,
    ),
  ],
  body: ListView(
    children: [
      Container(color: Colors.blue, height: 100, child: const Text('Item 1')),
      Container(color: Colors.green, height: 100, child: const Text('Item 2')),
    ],
  ),
)
```

---

### 6. **SingleChildScrollView**

**Descrição**: Permite rolagem para um único widget filho, como uma `Column`.

```dart
SingleChildScrollView(
  child: Column(
    children: [
      Container(color: Colors.blue, height: 200, child: const Text('Item 1')),
      Container(color: Colors.green, height: 200, child: const Text('Item 2')),
      Container(color: Colors.red, height: 200, child: const Text('Item 3')),
    ],
  ),
)
```

---

### 7. **Expanded**

**Descrição**: Expande o filho para preencher o espaço disponível em um `Row` ou `Column`.

```dart
Column(
  children: [
    Expanded(
      child: Container(
        color: Colors.blue,
        child: const Text('Expanded Example'),
      ),
    ),
    Container(
      color: Colors.green,
      height: 100,
      child: const Text('Fixed Height'),
    ),
  ],
)
```

---

### 8. **Spacer**

**Descrição**: Cria um espaço flexível entre widgets em `Row` ou `Column`.

```dart
Column(
  children: [
    Container(color: Colors.blue, height: 100, child: const Text('Item 1')),
    const Spacer(),
    Container(color: Colors.green, height: 100, child: const Text('Item 2')),
  ],
)
```

---

### 9. **Divider**

**Descrição**: Adiciona uma linha horizontal para separar conteúdos.

```dart
Column(
  children: [
    Container(color: Colors.blue, height: 100, child: const Text('Item 1')),
    const Divider(color: Colors.black, thickness: 2),
    Container(color: Colors.green, height: 100, child: const Text('Item 2')),
  ],
)
```

---

### 10. **VerticalDivider**

**Descrição**: Adiciona uma linha vertical (requer um `Row` com ajustes).

```dart
Row(
  children: [
    Container(color: Colors.blue, width: 100, height: 100, child: const Text('Item 1')),
    const VerticalDivider(color: Colors.black, thickness: 2, width: 20),
    Container(color: Colors.green, width: 100, height: 100, child: const Text('Item 2')),
  ],
)
```

---

### 11. **Card**

**Descrição**: Cria um cartão com bordas arredondadas e sombra.

```dart
Card(
  elevation: 4,
  child: Column(
    children: [
      Container(color: Colors.blue, height: 100, child: const Text('Card Item 1')),
      Container(color: Colors.green, height: 100, child: const Text('Card Item 2')),
    ],
  ),
)
```

---

### 12. **ListTile**

**Descrição**: Widget pré-formatado para itens de lista, com suporte a ícones, títulos e subtítulos.

```dart
Column(
  children: const [
    ListTile(
      leading: Icon(Icons.star),
      title: Text('ListTile 1'),
      subtitle: Text('Subtitle 1'),
    ),
    ListTile(
      leading: Icon(Icons.favorite),
      title: Text('ListTile 2'),
      subtitle: Text('Subtitle 2'),
    ),
  ],
)
```

---

### Instruções para Testar no VS Code

1. Crie um novo projeto Flutter no VS Code (`Ctrl+Shift+P` > `Flutter: New Project`).
2. Substitua o conteúdo de `lib/main.dart` pela estrutura base fornecida ou pelo exemplo completo (para `Scaffold`, `AppBar`, `SliverAppBar`).
3. Para os outros widgets, substitua o `body` do `Scaffold` pelo código do exemplo correspondente.
4. Use o **Flutter Outline** (no VS Code, à direita) para visualizar a hierarquia de widgets.
5. Ative o **Hot Reload** (`Ctrl+S`) para ver as alterações em tempo real no emulador.
6. Use o **Flutter Inspector** (`Ctrl+Shift+P` > `Flutter: Open DevTools`) para inspecionar o layout, especialmente útil para `Scaffold`, `CustomScrollView`, e `NestedScrollView`.

## Notas

- **Contexto**: Alguns widgets, como `Expanded` e `Spacer`, exigem um pai `Flex` (como `Row` ou `Column`). `SliverAppBar` e `CustomScrollView` usam slivers, então incluí o contexto necessário.
- **Ajustes de Tela**: Para widgets como `SingleChildScrollView` ou `ListView`, se houver overflow, o VS Code mostrará avisos no emulador. Ajuste o tamanho ou use `SingleChildScrollView` se necessário.
