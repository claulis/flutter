# Gerenciamento de Estado

## Conceitos Fundamentais

### Widgets

Widgets são os blocos de construção do Flutter.  Existem dois tipos principais:

- **StatelessWidget**: Para interfaces estáticas, que não mudam (ex.: texto fixo, ícones). É como um cartaz impresso, fixo e imutável.
- **StatefulWidget**: Para interfaces dinâmicas, que mudam com base em interações ou dados (ex.: um contador que aumenta ao clicar). É como uma tela de TV, que muda o conteúdo conforme o usuário interage.

### Estado

O **estado** é a informação que um widget mantém e que pode mudar ao longo do tempo, como o valor de um contador ou o texto digitado em um campo. Quando muda algum valor na aplicação a tela precisa ser atualizada para mostrar o novo valor.

**Gerenciamento de estado** é como o Flutter controla e atualiza essas informações para refletir mudanças na interface.

### Árvores de Widgets

No Flutter, a interface é uma árvore de widgets. Um widget pai contém widgets filhos, que podem conter outros widgets, formando uma hierarquia.

**Exemplo**: Um aplicativo pode ter um widget `Scaffold` (pai) que contém um `AppBar` (cabeçalho), um `Body` (corpo com uma `Column` de widgets) e um `FloatingActionButton`.

## Gerenciamento de Estado no Flutter

Gerenciar o estado significa controlar como os dados mudam e como a interface reflete essas mudanças. Existem várias abordagens, desde as mais simples até as mais avançadas. Existem tres maneira de gerenciar o estado: **setState**, **Provider** e **Riverpod**.

### setState (Gerenciamento Local)

O `setState` é a forma mais simples de gerenciar estado em um **StatefulWidget**. Ele atualiza o estado de um widget e redesenha a interface.

**Exemplo prático**: Um contador que aumenta ao clicar em um botão.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contador com setState')),
      body: Center(
        child: Text('Contador: $_counter', style: TextStyle(fontSize: 24)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}
```

**Explicação**:

- `_counter` é a variável de estado.
- `setState` notifica o Flutter que o estado mudou, e a interface é reconstruída com o novo valor.
- **Limitação**: Não é ideal para estados complexos ou compartilhados entre várias telas.

### Provider (Gerenciamento Global Simples)

O **Provider** é um pacote que facilita o gerenciamento de estado compartilhado entre widgets. Ele permite que você "proveja" dados para várias partes do aplicativo, por múltiplos widgets ou telas.

**Exemplo prático**: Um contador compartilhado entre duas telas usando Provider.

**Passos**:

1. Adicione a dependência `provider`:

```bash
flutter pub add provider
```

2. Crie um modelo para o estado (ex.: `Counter`).

3. Use `ChangeNotifierProvider` para fornecer o estado e `Consumer` para consumi-lo.

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Counter(),
      child: MyApp(),
    ),
  );
}

class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contador com Provider')),
      body: Center(
        child: Consumer<Counter>(
          builder: (context, counter, child) {
            return Text('Contador: ${counter.count}', style: TextStyle(fontSize: 24));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<Counter>().increment(),
        child: Icon(Icons.add),
      ),
    );
  }
}
```

**Explicação**:

- `Counter` é uma classe que gerencia o estado e notifica mudanças com `notifyListeners`.
- `ChangeNotifierProvider` disponibiliza o estado para toda a árvore de widgets.
- `Consumer` atualiza apenas a parte da interface que depende do estado.
- **Vantagem**: Simples e eficiente para estados compartilhados.
- **Limitação**: Pode ser complicado para apps muito grandes.

### Riverpod (Gerenciamento Avançado)

O **Riverpod** é uma evolução do Provider, mais moderno e flexível. Ele não depende do contexto do Flutter, permitindo maior modularidade.

**Exemplo prático**: Um contador com Riverpod.

**Passos**:

1. Adicione a dependência `flutter_riverpod`:

```bash
flutter pub add flutter_riverpod
```

2. Crie um `Provider` para o estado.

3. Use `ConsumerWidget` ou `Consumer` para acessar o estado.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define o provider para o contador
final counterProvider = StateProvider<int>((ref) => 0);

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Contador com Riverpod')),
      body: Center(
        child: Text('Contador: $counter', style: TextStyle(fontSize: 24)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterProvider.notifier).state++,
        child: Icon(Icons.add),
      ),
    );
  }
}
```

**Explicação**:

- `StateProvider` cria um estado simples (um inteiro).
- `ref.watch` observa o estado e atualiza a interface quando ele muda.
- `ref.read` modifica o estado.
- **Vantagem**: Mais modular, testável e não depende de `BuildContext`.
- **Limitação**: Curva de aprendizado um pouco maior.

## Comparação das Abordagens

| Abordagem      | Simplicidade | Escalabilidade | Casos de Uso                     |
|----------------|--------------|---------------|----------------------------------|
| **setState**   | Alta         | Baixa         | Apps simples, estados locais     |
| **Provider**   | Média        | Média         | Apps médios, estados compartilhados |
| **Riverpod**   | Média        | Alta          | Apps complexos, testes unitários |

