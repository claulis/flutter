# Conceito de Widgets

No Flutter, **widgets** são os blocos de construção fundamentais para criar interfaces de usuário (UI). Tudo na UI, como botões, textos, layouts e até animações, é um widget. Widgets são organizados em uma **árvore de widgets**, onde cada widget pode conter outros widgets filhos. Eles descrevem como a interface deve ser exibida com base em sua configuração e estado atual.

Widgets no Flutter são divididos em dois tipos principais: **StatelessWidget** e **StatefulWidget**, cada um com propósitos distintos dependendo de como os dados mudam na interface.

## StatelessWidget

- **O que é**: Um `StatelessWidget` é um widget que não possui estado interno mutável. Ele é imutável, ou seja, uma vez construído, sua aparência e comportamento não mudam a menos que o widget pai seja reconstruído com novos dados.
- **Quando usar**: Use para elementos estáticos da UI, como textos fixos, ícones, botões sem interatividade complexa ou layouts que não mudam com base em ações do usuário.
- **Características**:
  - Não armazena estado (variáveis que mudam com o tempo).
  - O método `build` é chamado apenas quando o widget é criado ou quando o pai é atualizado.
  - Exemplo: Um texto fixo como "Bem-vindo" ou uma imagem estática.
- **Exemplo de código**:

  ```dart
  import 'package:flutter/material.dart';

  class MyStatelessWidget extends StatelessWidget {
    const MyStatelessWidget({super.key});

    @override
    Widget build(BuildContext context) {
      return const Center(
        child: Text(
          'Hello, World!',
          style: TextStyle(fontSize: 24),
        ),
      );
    }
  }
  ```

  - **Explicação**: O `Text` exibe um conteúdo fixo. Se o texto nunca mudar, `StatelessWidget` é suficiente.

### StatefulWidget

- **O que é**: Um `StatefulWidget` é um widget que pode mudar de estado ao longo do tempo, permitindo que a UI seja atualizada dinamicamente em resposta a eventos, como cliques do usuário, entrada de dados ou mudanças externas.
- **Quando usar**: Use para elementos dinâmicos, como contadores, formulários, listas que mudam ou qualquer UI que responde a interações ou atualizações de dados.
- **Características**:
  - Possui um objeto `State` associado, que armazena dados mutáveis.
  - O método `setState()` é usado para notificar o Flutter que o estado mudou, desencadeando uma reconstrução do widget.
  - Exemplo: Um contador que incrementa quando um botão é pressionado.
- **Exemplo de código**:

  ```dart
  import 'package:flutter/material.dart';

  class MyStatefulWidget extends StatefulWidget {
    const MyStatefulWidget({super.key});

    @override
    State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
  }

  class _MyStatefulWidgetState extends State<MyStatefulWidget> {
    int _counter = 0;

    void _incrementCounter() {
      setState(() {
        _counter++;
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Text('Contador: $_counter'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          child: const Icon(Icons.add),
        ),
      );
    }
  }
  ```

  - **Explicação**: O `_counter` é armazenado no objeto `State`. O `setState()` atualiza o valor e reconstrói a UI para refletir a mudança.

### Diferenças entre StatelessWidget e StatefulWidget

| Característica         | StatelessWidget                     | StatefulWidget                     |
|------------------------|-------------------------------------|------------------------------------|
| **Estado**             | Imutável, sem estado interno.       | Mutável, com estado dinâmico.      |
| **Reconstrução**       | Só reconstrói se o pai mudar.       | Reconstrói quando `setState()` é chamado. |
| **Uso**                | UI estática (ex.: texto fixo).      | UI dinâmica (ex.: contador, formulário). |
| **Complexidade**       | Simples, apenas `build`.            | Mais complexo, com objeto `State`. |
| **Exemplo**            | `Text`, `Icon`, layouts fixos.      | Contadores, formulários, listas dinâmicas. |

### Ciclo de Vida de um StatefulWidget

O ciclo de vida de um `StatefulWidget` é gerenciado pelo objeto `State` associado. Ele descreve as etapas pelas quais o widget passa, desde sua criação até sua remoção. Abaixo estão os principais métodos do ciclo de vida:

1. **createState()**:
   - **Quando**: Chamado quando o `StatefulWidget` é criado.
   - **Função**: Cria o objeto `State` associado ao widget.
   - **Exemplo**: No código acima, `createState()` retorna `_MyStatefulWidgetState`.

2. **initState()**:
   - **Quando**: Chamado uma única vez, logo após a criação do objeto `State`.
   - **Função**: Inicializa variáveis, controladores ou faz configurações iniciais.
   - **Exemplo**:

     ```dart
     @override
     void initState() {
       super.initState();
       // Inicializar algo, como um controlador ou fetch de dados
     }
     ```

3. **didChangeDependencies()**:
   - **Quando**: Chamado após `initState` e quando dependências herdadas (ex.: `Theme`, `MediaQuery`) mudam.
   - **Função**: Usado para reagir a mudanças em dependências externas.
   - **Exemplo**: Atualizar a UI com base no tema atual.

4. **build()**:
   - **Quando**: Chamado sempre que o widget precisa ser redesenhado (ex.: após `setState()`).
   - **Função**: Retorna a árvore de widgets que compõe a UI.
   - **Exemplo**: No código acima, `build` retorna um `Scaffold` com um `Text` e um botão.

5. **didUpdateWidget()**:
   - **Quando**: Chamado quando o widget pai é reconstruído com uma nova configuração.
   - **Função**: Permite atualizar o estado com base em mudanças no widget pai.
   - **Exemplo**: Atualizar variáveis se as propriedades do `StatefulWidget` mudarem.

6. **dispose()**:
   - **Quando**: Chamado quando o widget é removido permanentemente da árvore.
   - **Função**: Libera recursos, como controladores ou assinaturas.
   - **Exemplo**:

     ```dart
     @override
     void dispose() {
       // Liberar recursos, como controladores
       super.dispose();
     }
     ```

### Ciclo de Vida de um StatelessWidget

- **Mais simples**: Um `StatelessWidget` não tem estado, então seu ciclo de vida é basicamente:
  - Criação do widget.
  - Chamada do método `build()` para renderizar a UI.
  - Remoção quando o widget pai é reconstruído ou removido.
- Não possui métodos como `initState` ou `dispose`, pois não gerencia estado.

---
Vai para:

- [Sumário](../README.md)