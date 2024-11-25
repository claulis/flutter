
# Layout: Column, Row, Stack e Container



Flutter oferece estruturas de layout que permitem organizar widgets em colunas, linhas e camadas sobrepostas, além de contêineres para ajustar margens e estilizar componentes. Vamos explorar cada uma das estruturas e ver como usá-las para criar layouts flexíveis e responsivos.


## 1. `Column`: Organização Vertical

O `Column` é uma estrutura que organiza widgets verticalmente (em uma coluna). Isso é útil para layouts que precisam alinhar itens um sobre o outro, como listas ou formulários.

### Propriedades principais
- `mainAxisAlignment`: Define o alinhamento ao longo do eixo principal (no caso de `Column`, o eixo vertical).
- `crossAxisAlignment`: Define o alinhamento ao longo do eixo cruzado (horizontal).

### Exemplo de uso de `Column`

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title:const Text('Exemplo de Column')),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Primeiro Item', style: TextStyle(fontSize: 24)),
            Text('Segundo Item', style: TextStyle(fontSize: 24)),
            Text('Terceiro Item', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
```

> **Explicação**: Neste exemplo, os widgets `Text` são organizados verticalmente em uma coluna, centralizados no eixo principal (`mainAxisAlignment: center`) e alinhados à esquerda (`crossAxisAlignment: start`).

---

## 2. `Row`: Organização Horizontal

O `Row` organiza widgets horizontalmente (em uma linha). É ideal para layouts em que precisamos dispor itens lado a lado.

### Propriedades principais
- `mainAxisAlignment`: Alinhamento ao longo do eixo principal (horizontal).
- `crossAxisAlignment`: Alinhamento ao longo do eixo cruzado (vertical).

### Exemplo de uso de `Row`

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Exemplo de Row')),
        body: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.star, size: 50, color: Colors.blue),
            Icon(Icons.favorite, size: 50, color: Colors.red),
            Icon(Icons.thumb_up, size: 50, color: Colors.green),
          ],
        ),
      ),
    );
  }
}
```

> **Explicação**: Neste exemplo, três ícones são exibidos em uma linha e espaçados uniformemente (`mainAxisAlignment: spaceAround`). O `Row` permite flexibilidade para organizar widgets horizontalmente.


## 3. `Stack` e `Container`: Layout em Camadas

O `Stack` permite sobrepor widgets, ou seja, exibir elementos um sobre o outro. É muito útil para criar interfaces visuais complexas, como cartões de perfil ou imagens com legendas sobrepostas.

### Propriedades principais
- `alignment`: Define o alinhamento padrão dos widgets empilhados.
- `fit`: Ajusta o tamanho do `Stack`.

O `Container` é um widget versátil que permite estilizar outros widgets com margens, padding, bordas, cores e transformações. Ele é frequentemente usado para aplicar estilos a widgets específicos.

### Propriedades principais
- `width` e `height`: Definem a largura e altura.
- `padding` e `margin`: Adicionam espaço interno e externo ao widget.
- `decoration`: Permite personalizar o contêiner com bordas e sombra.

### Exemplo de uso de `Stack` e `Container`

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Exemplo de Stack')),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.red,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

>  No exemplo, três contêineres são sobrepostos usando um `Stack`. Cada contêiner tem uma cor diferente e tamanhos variados, criando um efeito de sobreposição.


>  Aqui, um `Container` estilizado envolve um texto centralizado. A propriedade `decoration` permite adicionar uma cor de fundo, bordas arredondadas e sombra.

---

### Referências

- [Documentação Flutter para layouts](https://docs.flutter.dev/development/ui/layout)
