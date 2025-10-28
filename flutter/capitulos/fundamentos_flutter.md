# O que é Flutter?

- **Definição**: Flutter é um framework de código aberto desenvolvido pelo Google para criar aplicativos multiplataforma (iOS, Android, web e desktop) a partir de uma única base de código. Ele permite construir interfaces de usuário (UI) nativas, performáticas e visualmente atraentes.
- **Características principais**:
  - **Multiplataforma**: Um único código roda em várias plataformas, reduzindo tempo e custo de desenvolvimento.
  - **Hot Reload**: Permite visualizar alterações no código em tempo real, acelerando o desenvolvimento.
  - **Desempenho nativo**: Compila para código nativo, garantindo alta performance.
  - **Dart como linguagem**: Usa Dart, uma linguagem otimizada para UI, com sintaxe simples e suporte a programação reativa.

## Arquitetura do Flutter

A arquitetura do Flutter é composta por três pilares principais: o framework, os widgets e o rendering engine. Esses componentes trabalham juntos para criar aplicativos fluidos e personalizáveis.

### Framework

- **O que é**: O framework Flutter é um conjunto de bibliotecas e ferramentas escritas em Dart que facilita a construção de interfaces e a lógica do aplicativo.
- **Camadas principais**:
  - **Widgets Layer**: Oferece widgets prontos para criar UIs (botões, textos, layouts, etc.).
  - **Material e Cupertino**: Bibliotecas para design systems (Material Design para Android, Cupertino para iOS).
  - **Foundation**: Classes utilitárias (ex.: gerenciamento de estado, navegação).
  - **Integração com Dart**: O framework usa Dart para lógica, manipulação de eventos e construção de widgets.
- **Função**: O framework fornece APIs e componentes reutilizáveis para que o desenvolvedor foque na criação do app, sem lidar diretamente com detalhes de baixo nível.

### Widgets

- **O que são**: Widgets são os blocos de construção do Flutter. Tudo na UI (botões, textos, layouts, animações) é um widget.
- **Tipos de widgets**:
  - **StatelessWidget**: Para elementos estáticos que não mudam (ex.: um texto fixo).
  - **StatefulWidget**: Para elementos dinâmicos que podem mudar com base em interações ou dados (ex.: um contador).
  - **Widgets de layout**: Como `Row`, `Column`, `Stack`, usados para organizar outros widgets.
  - **Widgets visuais**: Como `Text`, `Image`, `Button`, para exibir conteúdo.
- **Conceito chave**: No Flutter, "tudo é um widget". A UI é construída como uma árvore de widgets, onde cada widget pode conter outros widgets.
- **Exemplo prático**:

  ```dart
  import 'package:flutter/material.dart';

  void main() {
    runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Meu App')),
          body: Center(child: Text('Hello, Flutter!')),
        ),
      ),
    );
  }
  ```

  Nesse código, `MaterialApp`, `Scaffold`, `AppBar`, `Center` e `Text` são widgets organizados em uma árvore.

### Rendering Engine

- **O que é**: O rendering engine é o mecanismo interno do Flutter responsável por desenhar a interface na tela, compilando widgets para código nativo.
- **Como funciona**:
  - **Skia**: Flutter usa o Skia, uma engine gráfica 2D de código aberto, para renderizar os widgets diretamente na tela, sem depender dos componentes nativos da plataforma (como UIKit no iOS ou Views no Android).
  - **Árvore de renderização**: Os widgets são convertidos em uma árvore de objetos renderizáveis, que o Skia usa para desenhar pixels na tela.
  - **Independência de plataforma**: Por não usar componentes nativos, o Flutter garante consistência visual em todas as plataformas, mas ainda suporta estilos específicos (Material/Cupertino).
- **Vantagem**: Alta performance (próxima ao nativo) e controle total sobre a renderização, permitindo animações suaves e UIs personalizadas.
- **Exemplo**: Um botão animado (como `AnimatedContainer`) é renderizado pelo Skia, que lida com transições de cor, tamanho ou posição diretamente no hardware.

## Estrutura de um Projeto Flutter

Quando você cria um novo projeto Flutter (usando, por exemplo, o comando `flutter create nome_do_projeto`), o Flutter gera uma estrutura de pastas e arquivos padrão. Essa organização é essencial para manter o código modular, facilitar a manutenção e configurar dependências. Abaixo, detalho os principais componentes, incluindo a organização de pastas, os arquivos-chave (`pubspec.yaml` e `main.dart`) e as configurações básicas.

### Organização de Pastas

Um projeto Flutter tem uma estrutura de diretórios bem definida. As pastas e arquivos principais são:

- **`android/`**: Contém os arquivos específicos para a plataforma Android (ex.: `build.gradle`, AndroidManifest.xml). Usado para configurações nativas e builds para Android.
- **`ios/`**: Contém arquivos para a plataforma iOS (ex.: `Info.plist`, arquivos Xcode). Usado para configurações nativas e builds para iOS.
- **`lib/`**: O diretório principal onde você escreve o código Dart/Flutter do aplicativo.
  - **Padrão inicial**: Contém o arquivo `main.dart`, que é o ponto de entrada do app.
  - **Organização recomendada**: À medida que o projeto cresce, você pode criar subpastas como:
    - `screens/`: Para telas ou páginas do app.
    - `widgets/`: Para widgets reutilizáveis.
    - `models/`: Para classes de modelo (ex.: objetos para dados de API).
    - `services/`: Para lógica de negócios (ex.: chamadas de API).
    - `utils/`: Para utilitários e funções auxiliares.
- **`test/`**: Contém arquivos de testes unitários, de widgets e de integração.
- **`assets/`**: (Não incluída por padrão, criada manualmente) Armazena recursos estáticos como imagens, fontes ou arquivos JSON.
- **`web/`**: Contém arquivos para suporte à plataforma web (ex.: `index.html`), usado se o app for compilado para web.
- **`.dart_tool/`**: (Gerado automaticamente) Armazena arquivos temporários e de configuração do Dart/Flutter.
- **`.idea/` ou `.vscode/`**: Configurações específicas para IDEs (Android Studio ou VS Code).
- **`build/`**: (Gerado automaticamente) Contém os arquivos compilados do aplicativo.

### Arquivos Principais

Os dois arquivos mais importantes para entender inicialmente são o `pubspec.yaml` e o `main.dart`.

#### pubspec.yaml

- **O que é**: O arquivo `pubspec.yaml` é o arquivo de configuração principal do projeto Flutter. Ele define metadados, dependências e recursos do aplicativo.
- **Localização**: Fica na raiz do projeto.
- **Estrutura e conteúdo**:

  ```yaml
  name: nome_do_projeto
  description: Um aplicativo Flutter de exemplo.
  version: 1.0.0+1
  environment:
    sdk: '>=3.0.0 <4.0.0'

  dependencies:
    flutter:
      sdk: flutter
    http: ^1.2.0  # Exemplo de dependência externa

  dev_dependencies:
    flutter_test:
      sdk: flutter

  flutter:
    uses-material-design: true
    assets:
      - assets/images/logo.png  # Declaração de recursos
    fonts:
      - family: CustomFont
        fonts:
          - asset: assets/fonts/CustomFont.ttf
  ```

- **Componentes principais**:
  - **name**: Nome do projeto (usado no build e na identificação do app).
  - **description**: Breve descrição do aplicativo.
  - **version**: Versão do app (formato: `major.minor.patch+build`).
  - **environment**: Define a versão do SDK Dart/Flutter compatível.
  - **dependencies**: Lista bibliotecas externas (ex.: `http` para chamadas de API).
  - **dev_dependencies**: Dependências para desenvolvimento/testes (ex.: `flutter_test`).
  - **flutter**: Configurações específicas do Flutter, como:
    - `uses-material-design`: Habilita o Material Design.
    - `assets`: Declara arquivos estáticos (imagens, JSON, etc.).
    - `fonts`: Declara fontes personalizadas.
- **Função**: Gerencia dependências e recursos. Após alterar o `pubspec.yaml`, execute `flutter pub get` para baixar dependências.

#### main.dart

- **O que é**: O arquivo `main.dart` é o ponto de entrada do aplicativo Flutter. Ele contém a função `main()` que inicializa o app.
- **Localização**: Geralmente em `lib/main.dart`.
- **Exemplo básico**:

  ```dart
  import 'package:flutter/material.dart';

  void main() {
    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Meu App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      );
    }
  }

  class MyHomePage extends StatelessWidget {
    const MyHomePage({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Bem-vindo ao Flutter'),
        ),
        body: const Center(
          child: Text('Hello, World!'),
        ),
      );
    }
  }
  ```

- **Componentes principais**:
  - **main()**: Função que inicia o app com `runApp()`, passando o widget raiz.
  - **MaterialApp**: Widget que configura o app (tema, navegação, título).
  - **Scaffold**: Widget que fornece a estrutura básica de uma tela (app bar, body, etc.).
- **Função**: Define a estrutura inicial do app e a primeira tela exibida.

#### Configurações Básicas

Além da organização de pastas e arquivos, algumas configurações são essenciais para o projeto funcionar:

- **Configuração de plataformas**:
  - **Android**: No arquivo `android/app/build.gradle`, configure o `minSdkVersion` (mínimo 21 para Flutter) e outras opções, como permissões no `AndroidManifest.xml`.
  - **iOS**: No arquivo `ios/Runner/Info.plist`, configure permissões (ex.: acesso à câmera) e metadados do app.
- **Ícones e splash screen**:
  - Use o pacote `flutter_launcher_icons` para configurar ícones do app.
  - Configure a splash screen nativa no `android/` e `ios/` ou use pacotes como `flutter_native_splash`.
- **Dependências**: Adicione pacotes no `pubspec.yaml` (ex.: `http`, `provider`) e execute `flutter pub get` para instalá-los.
- **Ambiente de desenvolvimento**:
  - Certifique-se de que o Flutter SDK está configurado (comando `flutter doctor` para verificar).
  - Configure um emulador (Android/iOS) ou dispositivo físico para testes.

## Criando um App "Hello World" com Flutter

### Criar um Novo Projeto Flutter

- **Passo**: Use o comando abaixo no terminal para criar um novo projeto Flutter:

  ```bash
  flutter create hello_world
  cd hello_world
  ```

- **Explicação**: O comando `flutter create` gera a estrutura padrão de um projeto Flutter, incluindo pastas (`lib/`, `android/`, `ios/`) e arquivos como `pubspec.yaml` e `main.dart`.
- **Resultado**: Uma pasta `hello_world` é criada com todos os arquivos necessários.

### Estrutura do Código

O arquivo principal do projeto é `lib/main.dart`. Substitua o conteúdo padrão por um código simples para exibir "Hello, World!".

#### Código do `main.dart`

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
      ),
      body: const Center(
        child: Text(
          'Hello, World!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
```

#### Explicação do Código

- **`import 'package:flutter/material.dart'`**: Importa a biblioteca Material do Flutter, que fornece widgets baseados no Material Design (ex.: `Scaffold`, `AppBar`, `Text`).
- **`void main()`**: Função principal que inicializa o app. A função `runApp()` renderiza o widget raiz (`MyApp`).
- **`MyApp` (StatelessWidget)**:
  - Um widget sem estado que configura o aplicativo.
  - `MaterialApp`: Widget que define a estrutura do app, incluindo:
    - `title`: Nome do app, exibido em sistemas operacionais.
    - `theme`: Define o tema visual (ex.: cor primária azul).
    - `home`: Define a tela inicial (`MyHomePage`).
- **`MyHomePage` (StatelessWidget)**:
  - Representa a tela principal.
  - `Scaffold`: Fornece a estrutura básica de uma tela, com:
    - `appBar`: Barra superior com o título "Hello World".
    - `body`: Corpo da tela, contendo um widget `Center` que centraliza o conteúdo.
  - `Text`: Exibe "Hello, World!" com tamanho de fonte 24.
- **Widgets**: A UI é construída como uma árvore de widgets (`MaterialApp` > `Scaffold` > `AppBar` e `Center` > `Text`).

#### Configurações no `pubspec.yaml`

O arquivo `pubspec.yaml` já inclui a dependência do Flutter por padrão. Verifique se ele contém:

```yaml
name: hello_world
description: A new Flutter project.
version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter

flutter:
  uses-material-design: true
```

- **Explicação**: A linha `uses-material-design: true` habilita os widgets do Material Design. Não é necessário adicionar outras dependências para este app simples.

#### Executando o Aplicativo

- **Passo 1**: Conecte um dispositivo físico ou inicie um emulador (Android/iOS).
- **Passo 2**: No terminal, dentro da pasta `hello_world`, execute:

  ```bash
  flutter run
  ```

- **Resultado**: O app será compilado e exibirá uma tela com uma barra superior ("Hello World") e o texto "Hello, World!" centralizado.

#### O que o App Faz?

- **Interface**: Uma tela simples com:
  - Uma `AppBar` azul na parte superior com o título "Hello World".
  - O texto "Hello, World!" centralizado no corpo da tela, com fonte tamanho 24.
- **Comportamento**: Como é um app estático (usando apenas `StatelessWidget`), não há interatividade, apenas exibição de conteúdo.

Este é um ótimo ponto de partida para aprender Flutter\! Vamos quebrar tudo em partes fáceis de entender.

## Entendendo Widgets e seu Ciclo de Vida

Pense em Widgets como **blocos de LEGO** para construir a interface do seu aplicativo. Em Flutter, a regra de ouro é: **"Tudo é um Widget"**.

  * Um botão? É um `Widget`.
  * Um texto? É um `Widget`.
  * O espaçamento entre eles? É um `Widget`.
  * A tela inteira? É um `Widget` que contém outros `Widgets`.

Um Widget, em sua essência, não é a coisa que você *vê* na tela, mas sim uma **descrição** ou **configuração** imutável (que não muda) de um pedaço da interface. O Flutter lê essa descrição e desenha a UI de fato na tela.
  

Para entender o ciclo de vida, você precisa primeiro entender que existem dois tipos principais de widgets:

### `StatelessWidget` (Widget Sem Estado)

  * **O que é:** Um widget simples, sem interação. Ele não armazena nenhuma informação que possa mudar ao longo do tempo.
  * **Quando usar:** Para qualquer parte da UI que só depende da configuração inicial e não muda. Exemplos: um ícone, um rótulo de texto fixo, um botão com um design estático.
  * **Ciclo de Vida:** O mais simples possível.
    1.  É criado (construtor).
    2.  O Flutter chama seu método `build()` para desenhar.
    3.  É isso. Ele só é "re-construído" (o `build()` é chamado de novo) se a configuração vinda do widget "pai" mudar.

**Exemplo de Código (StatelessWidget):**

```dart
import 'package:flutter/material.dart';

// Este widget é "Stateless". Ele apenas exibe um texto.
// Ele nunca mudará por conta própria.
class GreetingWidget extends StatelessWidget {
  final String message;

  // 1. O widget é criado com uma configuração (message)
  const GreetingWidget({Key? key, required this.message}) : super(key: key);

  // 2. O Flutter chama o 'build' para desenhar a UI
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.blue[100],
      child: Text(
        message,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
```

### `StatefulWidget` (Widget Com Estado)

  * **O que é:** Um widget "inteligente". Ele é associado a um objeto **`State`** (Estado), que pode armazenar informações (variáveis) que **mudam ao longo do tempo**.
  * **Quando usar:** Sempre que a UI precisar mudar dinamicamente. Exemplo: um contador, um formulário, uma animação, uma caixa de seleção (`Checkbox`).
  * **Ciclo de Vida:** Este é o widget que tem um ciclo de vida complexo e interessante. O widget em si é imutável, mas seu objeto `State` associado vive e gerencia as mudanças.

**Exemplo de Código (StatefulWidget):**

```dart
import 'package:flutter/material.dart';

// 1. A classe do WIDGET (a configuração)
class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  // O Flutter chama este método para criar o objeto de estado
  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

// 2. A classe do ESTADO (onde a mágica e o ciclo de vida acontecem)
class _CounterWidgetState extends State<CounterWidget> {
  // A variável de "estado"
  int _counter = 0;

  // Um método para mudar o estado
  void _incrementCounter() {
    // 3. setState() é CRUCIAL!
    // Ele diz ao Flutter: "Ei, mudei o estado. Por favor,
    // chame o método 'build()' novamente para redesenhar a UI."
    setState(() {
      _counter++;
    });
  }

  // 4. O 'build' usa o estado atual para desenhar a UI
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Você apertou o botão este número de vezes:',
        ),
        Text(
          '$_counter', // Usa a variável de estado!
          style: Theme.of(context).textTheme.headline4,
        ),
        ElevatedButton(
          onPressed: _incrementCounter, // Chama o método que muda o estado
          child: Text('Incrementar'),
        )
      ],
    );
  }
}
```



### A "Árvore" de Widgets

Antes do ciclo de vida, entenda isso: seu app é uma **árvore de widgets**. O Flutter na verdade gerencia 3 árvores, mas você só precisa se preocupar com a primeira:

> **[Gráfico Conceitual: As 3 Árvores]**
>
> 1.  **Widget Tree (Árvore de Widgets):**
>
>       * É o que você escreve no seu código.
>       * É a **configuração**.
>       * Ex: `Scaffold` -\> `Column` -\> (`Text` e `Button`)
>
> 2.  **Element Tree (Árvore de Elementos):**
>
>       * O Flutter cria isso automaticamente.
>       * É a **instância** do seu widget na tela. É o "local" do widget.
>       * É o que gerencia o ciclo de vida e sabe onde o widget está.
>
> 3.  **RenderObject Tree (Árvore de Renderização):**
>
>       * O "trabalho sujo" de desenhar pixels na tela.
>       * O Flutter cuida disso para você.

**Por que isso importa?** O "ciclo de vida" não é do *Widget* (que é só uma descrição), mas sim do **`Element`** e, no caso de `StatefulWidgets`, do seu objeto **`State`**.

### O Ciclo de Vida do `StatefulWidget`

Este é o fluxo de vida do objeto `State` de um `StatefulWidget`.

> **[Gráfico de Fluxo: Ciclo de Vida do `State`]**
>
> ```
> [Widget é inserido na árvore]
>     |
>     v
> 1. createState()
>    * O Flutter chama isso IMEDIATAMENTE.
>    * Cria o seu objeto `_MyWidgetState`.
>     |
>     v
> 2. initState()
>    * Chamado UMA ÚNICA VEZ quando o objeto State é criado.
>    * **Use para:** Inicializar dados, assinar "listeners",
>      configurar `AnimationControllers`.
>     |
>     v
> 3. build()
>    * Chamado logo após `initState()`.
>    * **Use para:** Construir e retornar a UI do seu widget.
>    * Será chamado MUITAS VEZES (a cada `setState`).
> ```

> ```
> ...
> ```

> [Evento acontece (ex: clique) -\> você chama setState()]
> |
> v
> 4\. setState()
>
>   * Você chama isso para dizer "O estado mudou\!".
>   * O Flutter então agenda um `build()`.
>     |
>     v
>     (Volta para o passo 3. build())

> ```
> ...
> ```

> [Widget é removido da árvore permanentemente]
> |
> v
> 5\. dispose()
>
>   * Chamado UMA ÚNICA VEZ quando o widget vai ser destruído.
>   * **Use para:** Limpar a "sujeira". Desinscrever "listeners",
>     dar `dispose` em `Controllers` (ex: `TextEditingController`).
>     Isso evita vazamento de memória\!
>     |
>     v
>     [Objeto State é destruído]
>
> <!-- end list -->
>
> ```
> ```

**Outros métodos importantes (para usuários avançados):**

  * `didChangeDependencies()`: Chamado após `initState` e sempre que um `InheritedWidget` do qual este widget depende mudar.
  * `didUpdateWidget(OldWidget oldWidget)`: Chamado se o widget "pai" for reconstruído e passar uma *nova configuração* para este widget.

### Exemplo Prático: O Ciclo de Vida em Ação

Vamos adicionar `print()` ao nosso contador para *ver* o ciclo de vida acontecendo.

```dart
import 'package:flutter/material.dart';

class LifecycleCounter extends StatefulWidget {
  const LifecycleCounter({Key? key}) : super(key: key);

  @override
  State<LifecycleCounter> createState() {
    print("1. createState() foi chamado!");
    return _LifecycleCounterState();
  }
}

class _LifecycleCounterState extends State<LifecycleCounter> {
  int _counter = 0;

  // ---- MÉTODOS DO CICLO DE VIDA ----

  @override
  void initState() {
    super.initState();
    // 2. Chamado uma vez
    print("2. initState() foi chamado!");
    // Perfeito para inicializar o contador vindo de um banco de dados, por ex.
    _counter = 0;
  }

  @override
  void dispose() {
    // 5. Chamado quando o widget é removido
    print("5. dispose() foi chamado! Limpando...");
    super.dispose();
  }

  // ---- LÓGICA DE ESTADO ----

  void _incrementCounter() {
    print("4. setState() foi chamado!");
    setState(() {
      // O 'build()' será chamado logo após este bloco
      _counter++;
    });
  }

  // ---- MÉTODO DE CONSTRUÇÃO ----

  @override
  Widget build(BuildContext context) {
    // 3. Chamado após o initState e a cada setState
    print("3. build() foi chamado! Desenhando UI com contador = $_counter");

    return Scaffold(
      appBar: AppBar(
        title: Text("Tutorial de Ciclo de Vida"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Contador atual:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, // Dispara o setState
        tooltip: 'Incrementar',
        child: Icon(Icons.add),
      ),
    );
  }
}
```

**Resultado do codigo:**

1.  `1. createState() foi chamado!`
2.  `2. initState() foi chamado!`
3.  `3. build() foi chamado! Desenhando UI com contador = 0`

**Quando você clicar no botão `+`:**
4.  `4. setState() foi chamado!`
5.  `3. build() foi chamado! Desenhando UI com contador = 1`

**Quando você sair da tela:**
6.  `5. dispose() foi chamado! Limpando...`


---
Vai para:
- [Sumário](../README.md)
- [Próximo capítulo](../capitulos/stateless_statefull.md)