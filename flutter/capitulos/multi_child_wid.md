# Widgets de Layout de Múltiplos Filhos (Multi-child Layout Widgets)

- Esses widgets aceitam vários filhos e organizam-nos de diferentes maneiras.

- Row: Organiza os filhos horizontalmente em uma linha.
- Column: Organiza os filhos verticalmente em uma coluna.
- ListView: Cria uma lista rolável de widgets, com opções como - ListView.builder para listas dinâmicas.
- GridView: Organiza os filhos em uma grade (ex.: GridView.count, GridView.builder).
- Wrap: Organiza os filhos em várias linhas ou colunas, quebrando automaticamente quando o espaço acaba.
- Stack: Empilha os filhos uns sobre os outros, com opções de alinhamento (ex.: Positioned para posicionamento preciso).
- Flow: Permite layouts personalizados com algoritmos de posicionamento dinâmico (menos comum).
- Table: Organiza os filhos em uma tabela com linhas e colunas.
- CustomMultiChildLayout: Permite layouts altamente personalizados com um delegate para posicionar os filhos.

Abaixo está um exemplo rápido de cada **widget de layout de múltiplos filhos** (multi-child layout widgets) do Flutter, conforme listado na sua primeira pergunta. Cada exemplo é minimalista, funcional e projetado para ser testado no Visual Studio Code (ou outra IDE) com o Flutter configurado. Os exemplos demonstram o uso básico de cada widget, usando `Container` ou `Text` como filhos para ilustrar o layout. Para manter a resposta concisa, sigo o mesmo formato da resposta anterior para widgets de linha única.

## Configuração Base

Todos os exemplos usam uma estrutura básica de aplicativo Flutter com um `Scaffold`. Você pode copiar cada trecho de código para o `body` de um `Scaffold` em um arquivo Dart no VS Code. Aqui está a estrutura base para todos os exemplos:

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
        appBar: AppBar(title: const Text('Multi-Child Widget Example')),
        body: // Insira o widget de exemplo aqui
      ),
    );
  }
}
```

Substitua o `body` pelo código de cada widget abaixo. Cada exemplo inclui uma breve explicação de sua funcionalidade.

---

### 1. **Row**

**Descrição**: Organiza os filhos horizontalmente em uma linha.

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Container(color: Colors.blue, width: 50, height: 50, child: const Text('1')),
    Container(color: Colors.green, width: 50, height: 50, child: const Text('2')),
    Container(color: Colors.red, width: 50, height: 50, child: const Text('3')),
  ],
)
```

---

### 2. **Column**

**Descrição**: Organiza os filhos verticalmente em uma coluna.

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Container(color: Colors.blue, width: 50, height: 50, child: const Text('1')),
    Container(color: Colors.green, width: 50, height: 50, child: const Text('2')),
    Container(color: Colors.red, width: 50, height: 50, child: const Text('3')),
  ],
)
```

---

### 3. **ListView**

**Descrição**: Cria uma lista rolável de widgets.

```dart
ListView(
  children: [
    Container(color: Colors.blue, height: 100, child: const Text('Item 1')),
    Container(color: Colors.green, height: 100, child: const Text('Item 2')),
    Container(color: Colors.red, height: 100, child: const Text('Item 3')),
  ],
)
```

---

### 4. **GridView**

**Descrição**: Organiza os filhos em uma grade.

```dart
GridView.count(
  crossAxisCount: 2,
  children: [
    Container(color: Colors.blue, child: const Text('1')),
    Container(color: Colors.green, child: const Text('2')),
    Container(color: Colors.red, child: const Text('3')),
    Container(color: Colors.yellow, child: const Text('4')),
  ],
)
```

---

### 5. **Wrap**

**Descrição**: Organiza os filhos em várias linhas ou colunas, quebrando automaticamente quando o espaço acaba.

```dart
Wrap(
  spacing: 8.0,
  runSpacing: 8.0,
  children: [
    Container(color: Colors.blue, width: 100, height: 100, child: const Text('1')),
    Container(color: Colors.green, width: 100, height: 100, child: const Text('2')),
    Container(color: Colors.red, width: 100, height: 100, child: const Text('3')),
  ],
)
```

---

### 6. **Stack**

**Descrição**: Empilha os filhos uns sobre os outros.

```dart
Stack(
  children: [
    Container(color: Colors.blue, width: 200, height: 200, child: const Text('1')),
    Positioned(
      top: 50,
      left: 50,
      child: Container(color: Colors.green, width: 100, height: 100, child: const Text('2')),
    ),
    Positioned(
      top: 100,
      left: 100,
      child: Container(color: Colors.red, width: 50, height: 50, child: const Text('3')),
    ),
  ],
)
```

---

### 7. **Flow**

**Descrição**: Permite layouts personalizados com um delegate para posicionamento dinâmico (exemplo simplificado).

```dart
Flow(
  delegate: FlowDelegateImpl(),
  children: [
    Container(color: Colors.blue, width: 50, height: 50, child: const Text('1')),
    Container(color: Colors.green, width: 50, height: 50, child: const Text('2')),
    Container(color: Colors.red, width: 50, height: 50, child: const Text('3')),
  ],
)

// Exemplo de FlowDelegate (deve ser implementado separadamente)
class FlowDelegateImpl extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    for (int i = 0; i < context.childCount; i++) {
      context.paintChild(i, transform: Matrix4.translationValues(i * 60.0, i * 60.0, 0));
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
}
```

---

### 8. **Table**

**Descrição**: Organiza os filhos em uma tabela com linhas e colunas.

```dart
Table(
  border: TableBorder.all(),
  children: [
    TableRow(children: [
      Container(color: Colors.blue, child: const Text('1')),
      Container(color: Colors.green, child: const Text('2')),
    ]),
    TableRow(children: [
      Container(color: Colors.red, child: const Text('3')),
      Container(color: Colors.yellow, child: const Text('4')),
    ]),
  ],
)
```

---

### 9. **CustomMultiChildLayout**

**Descrição**: Permite layouts altamente personalizados com um delegate.

```dart
CustomMultiChildLayout(
  delegate: CustomLayoutDelegate(),
  children: [
    LayoutId(id: 1, child: Container(color: Colors.blue, width: 50, height: 50, child: const Text('1'))),
    LayoutId(id: 2, child: Container(color: Colors.green, width: 50, height: 50, child: const Text('2'))),
  ],
)

// Exemplo de MultiChildLayoutDelegate
class CustomLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    if (hasChild(1)) {
      layoutChild(1, BoxConstraints.loose(size));
      positionChild(1, const Offset(0, 0));
    }
    if (hasChild(2)) {
      layoutChild(2, BoxConstraints.loose(size));
      positionChild(2, const Offset(60, 60));
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) => false;
}
```

---

### Instruções para Testar no VS Code

1. Crie um novo projeto Flutter no VS Code (`Ctrl+Shift+P` > `Flutter: New Project`).
2. Substitua o conteúdo de `lib/main.dart` pela estrutura base fornecida no início.
3. Para cada widget, substitua o `body` do `Scaffold` pelo código do exemplo correspondente.
4. Para `Flow` e `CustomMultiChildLayout`, inclua as classes `FlowDelegateImpl` e `CustomLayoutDelegate` no mesmo arquivo Dart, fora da classe `MyApp`.

### Notas

- **Contexto**: Alguns widgets, como `ListView` e `GridView`, podem exigir um `SingleChildScrollView` ou tamanho definido se usados diretamente no `body`. Nos exemplos, mantive a simplicidade, mas ajuste o tamanho da tela ou use `SingleChildScrollView` se houver overflow.

