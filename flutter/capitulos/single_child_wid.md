# Widgets de Layout de Linha Única (Single-child Layout Widgets)

Esses widgets aceitam um único filho e controlam sua disposição.

- Container: Um dos widgets mais versáteis, permite definir margens, preenchimento (padding), cor, tamanho, bordas, e muito mais.
- Padding: Adiciona preenchimento ao redor do widget filho.
- Center: Centraliza o widget filho no espaço disponível.
- Align: Alinha o widget filho em uma posição específica (ex.: topLeft, bottomRight) dentro do espaço disponível.
- SizedBox: Define um tamanho fixo (largura e/ou altura) para o widget filho ou cria um espaço vazio.
- AspectRatio: Força o widget filho a ter uma proporção específica (aspect ratio).
- ConstrainedBox: Impõe restrições de tamanho (mínimo/máximo) ao widget filho.
- UnconstrainedBox: Remove restrições de tamanho do widget pai, permitindo que o filho tenha seu tamanho natural.
- FractionallySizedBox: Define o tamanho do widget filho como uma fração do espaço disponível.
- Expanded: Expande o widget filho para preencher o espaço disponível em um Flex (como Row ou Column).
- Flexible: Similar ao Expanded, mas permite controle mais fino sobre como o espaço é ocupado (flex factor).
- FittedBox: Ajusta o widget filho para caber no espaço disponível, com opções de escalonamento (ex.: fit: BoxFit.contain).
- Baseline: Alinha o widget filho com base em uma linha de base (útil para textos).
- IntrinsicHeight: Força o widget filho a ter a altura intrínseca (baseada no conteúdo).
- IntrinsicWidth: Similar ao IntrinsicHeight, mas para largura.
- Offstage: Esconde o widget filho (não o renderiza) sem remover da árvore de widgets.
- OverflowBox: Permite que o widget filho ultrapasse as restrições do pai.
- Transform: Aplica transformações (como rotação, escala) ao widget filho.

Abaixo está um exemplo rápido de cada **widget de layout de linha única** (single-child layout widgets) do Flutter, conforme listado na sua primeira pergunta. Cada exemplo é minimalista, mas funcional, mostrando o uso básico do widget em um aplicativo Flutter. Os exemplos são projetados para serem testados no Visual Studio Code (ou outra IDE) com o Flutter configurado. Cada widget é apresentado com um código comentado e uma breve explicação de sua funcionalidade.

## Configuração Base

Todos os exemplos usam uma estrutura básica de aplicativo Flutter com um `Scaffold`. 
Copie cada trecho de código para o `body` de um `Scaffold` em um arquivo Dart no VS Code. 

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
        appBar: AppBar(title: const Text('Single-Child Widget Example')),
        body: // Insira o widget de exemplo aqui
      ),
    );
  }
}
```

Substitua o `body` pelo código de cada widget abaixo. Para manter a resposta concisa, cada exemplo foca no widget em questão, usando um `Text` ou `Container` como filho para demonstrar o layout.

---

### 1. **Container**

**Descrição**: Widget versátil para estilizar e posicionar um filho com propriedades como cor, margem, padding e tamanho.

```dart
Container(
  margin: const EdgeInsets.all(16.0),
  padding: const EdgeInsets.all(8.0),
  color: Colors.blue,
  width: 100,
  height: 100,
  child: const Text('Container', style: TextStyle(color: Colors.white)),
)
```

---

### 2. **Padding**

**Descrição**: Adiciona espaço interno (padding) ao redor do widget filho.

```dart
Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    color: Colors.green,
    child: const Text('Padding'),
  ),
)
```

---

### 3. **Center**

**Descrição**: Centraliza o widget filho no espaço disponível.

```dart
Center(
  child: Container(
    color: Colors.orange,
    width: 100,
    height: 100,
    child: const Text('Center'),
  ),
)
```

---

### 4. **Align**

**Descrição**: Alinha o widget filho em uma posição específica (ex.: topRight).

```dart
Align(
  alignment: Alignment.topRight,
  child: Container(
    color: Colors.purple,
    width: 100,
    height: 100,
    child: const Text('Align'),
  ),
)
```

---

### 5. **SizedBox**

**Descrição**: Define um tamanho fixo ou cria espaço vazio.

```dart
SizedBox(
  width: 150,
  height: 150,
  child: Container(
    color: Colors.red,
    child: const Text('SizedBox'),
  ),
)
```

---

### 6. **AspectRatio**

**Descrição**: Força o widget filho a ter uma proporção específica.

```dart
AspectRatio(
  aspectRatio: 16 / 9,
  child: Container(
    color: Colors.teal,
    child: const Text('AspectRatio'),
  ),
)
```

---

### 7. **ConstrainedBox**

**Descrição**: Impõe restrições de tamanho mínimo/máximo ao filho.

```dart
ConstrainedBox(
  constraints: const BoxConstraints(
    minWidth: 100,
    maxWidth: 200,
    minHeight: 100,
    maxHeight: 200,
  ),
  child: Container(
    color: Colors.cyan,
    child: const Text('ConstrainedBox'),
  ),
)
```

---

### 8. **UnconstrainedBox**

**Descrição**: Remove restrições de tamanho do pai, permitindo que o filho use seu tamanho natural.

```dart
UnconstrainedBox(
  child: Container(
    color: Colors.yellow,
    width: 300, // Ignora restrições do pai
    height: 100,
    child: const Text('UnconstrainedBox'),
  ),
)
```

---

### 9. **FractionallySizedBox**

**Descrição**: Define o tamanho do filho como uma fração do espaço disponível.

```dart
FractionallySizedBox(
  widthFactor: 0.5, // 50% da largura do pai
  heightFactor: 0.5, // 50% da altura do pai
  child: Container(
    color: Colors.blueAccent,
    child: const Text('FractionallySizedBox'),
  ),
)
```

---

### 10. **Expanded**

**Descrição**: Expande o filho para preencher o espaço disponível em um `Row` ou `Column`.

```dart
Column(
  children: [
    Expanded(
      child: Container(
        color: Colors.pink,
        child: const Text('Expanded'),
      ),
    ),
  ],
)
```

---

### 11. **Flexible**

**Descrição**: Similar ao `Expanded`, mas com controle mais fino via `flex`.

```dart
Column(
  children: [
    Flexible(
      flex: 2,
      child: Container(
        color: Colors.lightGreen,
        child: const Text('Flexible'),
      ),
    ),
    Flexible(
      flex: 1,
      child: Container(
        color: Colors.lightBlue,
        child: const Text('Other'),
      ),
    ),
  ],
)
```

---

### 12. **FittedBox**

**Descrição**: Ajusta o filho para caber no espaço, com opções de escalonamento.

```dart
FittedBox(
  fit: BoxFit.scaleDown,
  child: Container(
    width: 300,
    height: 300,
    color: Colors.indigo,
    child: const Text('FittedBox', style: TextStyle(color: Colors.white)),
  ),
)
```

---

### 13. **Baseline**

**Descrição**: Alinha o filho com base em uma linha de base (comum para textos).

```dart
Baseline(
  baseline: 50.0,
  baselineType: TextBaseline.alphabetic,
  child: Container(
    color: Colors.amber,
    width: 100,
    height: 100,
    child: const Text('Baseline'),
  ),
)
```

---

### 14. **IntrinsicHeight**

**Descrição**: Força o filho a ter a altura intrínseca.

```dart
IntrinsicHeight(
  child: Row(
    children: [
      Container(
        color: Colors.blue,
        width: 100,
        child: const Text('IntrinsicHeight'),
      ),
      Container(
        color: Colors.red,
        width: 100,
        height: 200,
      ),
    ],
  ),
)
```

---

### 15. **IntrinsicWidth**

**Descrição**: Força o filho a ter a largura intrínseca.

```dart
IntrinsicWidth(
  child: Column(
    children: [
      Container(
        color: Colors.green,
        height: 100,
        child: const Text('IntrinsicWidth'),
      ),
      Container(
        color: Colors.yellow,
        height: 100,
        width: 200,
      ),
    ],
  ),
)
```

---

### 16. **Offstage**

**Descrição**: Esconde o filho sem removê-lo da árvore de widgets.

```dart
Offstage(
  offstage: true, // Mude para false para mostrar
  child: Container(
    color: Colors.purple,
    width: 100,
    height: 100,
    child: const Text('Offstage'),
  ),
)
```

---

### 17. **OverflowBox**

**Descrição**: Permite que o filho ultrapasse as restrições do pai.

```dart
OverflowBox(
  minWidth: 0.0,
  maxWidth: 200.0,
  minHeight: 0.0,
  maxHeight: 200.0,
  child: Container(
    color: Colors.orange,
    width: 300, // Ultrapassa o pai
    height: 300,
    child: const Text('OverflowBox'),
  ),
)
```

---

### 18. **Transform**

**Descrição**: Aplica transformações (ex.: rotação) ao filho.

```dart
Transform.rotate(
  angle: 0.5, // Rotação em radianos
  child: Container(
    color: Colors.teal,
    width: 100,
    height: 100,
    child: const Text('Transform'),
  ),
)
```

---

### Instruções para Testar no VS Code

1. Crie um novo projeto Flutter no VS Code (`Ctrl+Shift+P` > `Flutter: New Project`).
2. Substitua o conteúdo de `lib/main.dart` pela estrutura base fornecida no início.
3. **Para cada widget, substitua o `body` do `Scaffold` pelo código do exemplo correspondente.**


### Notas

- **Contexto**: Alguns widgets, como `Expanded` e `Flexible`, exigem um pai `Flex` (como `Row` ou `Column`). Nos exemplos, incluí o contexto necessário.
