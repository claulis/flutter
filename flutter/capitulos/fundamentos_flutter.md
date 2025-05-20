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

---
Vai para:
- [Sumário](../README.md)
- [Próximo capítulo](../capitulos/stateless_statefull.md)