# Widgets de Layout de Posicionamento

Usados para posicionar widgets em locais específicos.

- Positioned: Usado dentro de um Stack para posicionar um widget filho em coordenadas específicas.
- LayoutBuilder: Constrói o layout com base nas restrições do pai, útil para layouts responsivos.
- MediaQuery: Acessa informações do dispositivo (tamanho da tela, orientação) para ajustes de layout.
- SafeArea: Garante que o conteúdo não seja obscurecido por notches ou barras do sistema.
- OrientationBuilder: Ajusta o layout com base na orientação do dispositivo (retrato/paisagem).

Abaixo está um exemplo rápido de cada **widget de layout de posicionamento** do Flutter, conforme listado na sua primeira pergunta. Esses widgets são usados para posicionar elementos em locais específicos na tela ou ajustar o layout com base em condições como tamanho da tela ou orientação. Cada exemplo é minimalista, funcional e projetado para ser testado no Visual Studio Code (ou outra IDE) com o Flutter configurado, seguindo o mesmo formato dos exemplos anteriores para outros tipos de widgets. Cada exemplo inclui uma breve explicação de sua funcionalidade.

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
        appBar: AppBar(title: const Text('Positioning Widget Example')),
        body: // Insira o widget de exemplo aqui
      ),
    );
  }
}

```

---

### 1. **Positioned**

**Descrição**: Usado dentro de um `Stack` para posicionar um widget filho em coordenadas específicas.

```dart
Stack(
  children: [
    Container(
      color: Colors.blue,
      width: 200,
      height: 200,
      child: const Text('Background'),
    ),
    Positioned(
      top: 50,
      left: 50,
      child: Container(
        color: Colors.red,
        width: 100,
        height: 100,
        child: const Text('Positioned'),
      ),
    ),
  ],
)
```

---

### 2. **LayoutBuilder**

**Descrição**: Constrói o layout com base nas restrições do pai, útil para layouts responsivos.

```dart
LayoutBuilder(
  builder: (context, constraints) {
    return Container(
      color: Colors.green,
      width: constraints.maxWidth * 0.5, // 50% da largura do pai
      height: constraints.maxHeight * 0.5, // 50% da altura do pai
      child: const Center(child: Text('LayoutBuilder')),
    );
  },
)
```

---

### 3. **MediaQuery**

**Descrição**: Acessa informações do dispositivo (tamanho da tela, orientação) para ajustes de layout.

```dart
Builder(
  builder: (context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.orange,
      width: size.width * 0.8, // 80% da largura da tela
      height: size.height * 0.3, // 30% da altura da tela
      child: const Center(child: Text('MediaQuery')),
    );
  },
)
```

---

### 4. **SafeArea**

**Descrição**: Garante que o conteúdo não seja obscurecido por notches ou barras do sistema.

```dart
SafeArea(
  child: Container(
    color: Colors.purple,
    child: const Center(child: Text('SafeArea')),
  ),
)
```

---

### 5. **OrientationBuilder**

**Descrição**: Ajusta o layout com base na orientação do dispositivo (retrato/paisagem).

```dart
OrientationBuilder(
  builder: (context, orientation) {
    return Container(
      color: orientation == Orientation.portrait ? Colors.blue : Colors.green,
      child: Center(
        child: Text(
          orientation == Orientation.portrait ? 'Portrait' : 'Landscape',
        ),
      ),
    );
  },
)
```

---

### Instruções para Testar no VS Code

1. Crie um novo projeto Flutter no VS Code (`Ctrl+Shift+P` > `Flutter: New Project`).
2. Substitua o conteúdo de `lib/main.dart` pela estrutura base fornecida no artefato acima.
3. Para cada widget, substitua o `body` do `Scaffold` pelo código do exemplo correspondente.
4. Use o **Flutter Outline** (no VS Code, à direita) para visualizar a hierarquia de widgets.
5. Ative o **Hot Reload** (`Ctrl+S`) para ver as alterações em tempo real no emulador.
6. Use o **Flutter Inspector** (`Ctrl+Shift+P` > `Flutter: Open DevTools`) para inspecionar o layout, especialmente útil para verificar o posicionamento em `Positioned` ou ajustes responsivos em `LayoutBuilder` e `MediaQuery`.
7. Para testar `OrientationBuilder`, gire o emulador (no VS Code, clique no ícone de rotação no dispositivo) para alternar entre retrato e paisagem.
8. Para `SafeArea`, teste em um emulador com notch (ex.: iPhone) para ver o efeito.

### Notas

- **Contexto**: `Positioned` requer um `Stack` como pai. Os outros widgets podem ser usados diretamente no `body` do `Scaffold`. `MediaQuery` usa um `Builder` para garantir acesso ao contexto.
