# Exemplo Flutter Layout Passo a Passo Completo

> App de exemplo: formulário com **nome** e **idade** (Slider) → navegação para tela de resultado.

## 1. Estrutura do projeto

```
flutter_demo/
├── lib/
│   ├── main.dart              ← ponto de entrada do app
│   ├── tela_formulario.dart   ← Tela 1: formulário
│   └── tela_resultado.dart    ← Tela 2: resultado
├── test/
│   └── widget_test.dart       ← testes automatizados
└── pubspec.yaml               ← dependências e configurações
```

---

## 2. Criar o projeto

```powershell
# Navegue até onde quer criar o projeto
cd C:\projetos

# Cria o projeto base
flutter create flutter_demo

# Entra na pasta
cd flutter_demo
```

Depois substitua o conteúdo de `lib/main.dart` e crie os demais arquivos conforme as seções **Código** abaixo.

---

## 3. Código completo

Crie o arquivo `pubspec.yaml` na pasta raiz do projeto, copie e cole o código abaixo
### `pubspec.yaml`
```yaml
name: flutter_demo
description: "App de exemplo com formulário e navegação entre telas."
publish_to: 'none'

version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^4.0.0

flutter:
  uses-material-design: true
```

---

Na pasta /lib crie os arquivos com os nome indicados e copie-cole o código a seguir
### `lib/main.dart`
```dart
import 'package:flutter/material.dart';
import 'tela_formulario.dart';

void main() {
  // runApp inicializa o framework e monta o widget na tela
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4),
        ),
        useMaterial3: true,
      ),
      home: const TelaFormulario(),
    );
  }
}
```

---

### `lib/tela_formulario.dart`
```dart
import 'package:flutter/material.dart';
import 'tela_resultado.dart';

// StatefulWidget — esta tela tem estado (campos mudam)
class TelaFormulario extends StatefulWidget {
  const TelaFormulario({super.key});

  @override
  State<TelaFormulario> createState() => _TelaFormularioState();
}

class _TelaFormularioState extends State<TelaFormulario> {
  final _formKey = GlobalKey<FormState>(); // chave para validar o Form
  final _nomeController = TextEditingController(); // captura texto do campo
  double _idade = 25; // valor atual do Slider

  @override
  void dispose() {
    _nomeController.dispose(); // libera memória
    super.dispose();
  }

  void _enviar() {
    // validate() dispara todos os validator() definidos nos campos
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => TelaResultado(
            nome: _nomeController.text.trim(),
            idade: _idade.round(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quem é você?'),
        backgroundColor: cores.primaryContainer,
        foregroundColor: cores.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Icon(Icons.person_outline, size: 72, color: cores.primary),
              const SizedBox(height: 24),

              // ── Campo Nome ──────────────────────────────────
              TextFormField(
                controller: _nomeController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Seu nome',
                  hintText: 'Ex: Maria Silva',
                  prefixIcon: Icon(Icons.badge_outlined),
                  border: OutlineInputBorder(),
                ),
                validator: (valor) {
                  if (valor == null || valor.trim().isEmpty) {
                    return 'Por favor, informe seu nome.';
                  }
                  if (valor.trim().length < 2) return 'Nome muito curto.';
                  return null; // null = sem erro
                },
              ),

              const SizedBox(height: 32),

              // ── Slider Idade ────────────────────────────────
              Text(
                'Sua idade: ${_idade.round()} anos',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  child: Column(
                    children: [
                      Slider(
                        value: _idade,
                        min: 1,
                        max: 120,
                        divisions: 119,
                        label: '${_idade.round()} anos',
                        onChanged: (v) => setState(() => _idade = v),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('1', style: TextStyle(fontSize: 12)),
                            Text('120', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // ── Botão Enviar ────────────────────────────────
              FilledButton.icon(
                onPressed: _enviar,
                icon: const Icon(Icons.send),
                label: const Text('Enviar', style: TextStyle(fontSize: 16)),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

### `lib/tela_resultado.dart`
```dart
import 'package:flutter/material.dart';

// StatelessWidget — apenas exibe dados, sem estado mutável
class TelaResultado extends StatelessWidget {
  final String nome;
  final int idade;

  const TelaResultado({super.key, required this.nome, required this.idade});

  String _emojiIdade() {
    if (idade < 13) return '🧒';
    if (idade < 18) return '👦';
    if (idade < 60) return '🧑';
    return '🧓';
  }

  String _faixaEtaria() {
    if (idade < 13) return 'Criança';
    if (idade < 18) return 'Adolescente';
    if (idade < 60) return 'Adulto';
    return 'Idoso';
  }

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
        backgroundColor: cores.primaryContainer,
        foregroundColor: cores.onPrimaryContainer,
        // Botão "←" adicionado automaticamente pelo Navigator
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_emojiIdade(), style: const TextStyle(fontSize: 80)),
              const SizedBox(height: 24),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                  child: Column(
                    children: [
                      Text(
                        'Olá! 👋',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: cores.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _InfoRow(icone: Icons.badge, rotulo: 'Nome', valor: nome, cor: cores.primary),
                      const Divider(height: 24),
                      _InfoRow(icone: Icons.cake, rotulo: 'Idade', valor: '$idade anos', cor: cores.secondary),
                      const Divider(height: 24),
                      _InfoRow(icone: Icons.group, rotulo: 'Faixa', valor: _faixaEtaria(), cor: cores.tertiary),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              OutlinedButton.icon(
                onPressed: () => Navigator.pop(context), // volta para Tela 1
                icon: const Icon(Icons.arrow_back),
                label: const Text('Voltar'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget auxiliar — evita repetição de código (DRY)
class _InfoRow extends StatelessWidget {
  final IconData icone;
  final String rotulo;
  final String valor;
  final Color cor;

  const _InfoRow({required this.icone, required this.rotulo, required this.valor, required this.cor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icone, color: cor, size: 28),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(rotulo, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
            Text(valor, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
```

---

## 4. Instalar dependências

No terminal dentro da pasta do projeto:
```powershell
flutter pub get
```

---

## 5. Rodar o app

### Escolher o dispositivo no VS Code

1. Abra a pasta `flutter_demo` no VS Code: **File → Open Folder**
2. Olhe na **barra inferior direita** — clique no seletor de dispositivo
3. Escolha uma opção:
   - **Chrome** (web) — mais rápido para testar
   - **Windows (desktop)** — app nativo Windows
   - **Emulador Android** — se tiver Android Studio instalado

### Via terminal (PowerShell):

```powershell
# Rodar no Chrome (web)
flutter run -d chrome

# Rodar como app Windows
flutter run -d windows

# Listar todos os dispositivos disponíveis
flutter devices
```

### Via VS Code (tecla F5):

1. Abra `lib/main.dart`
2. Pressione **F5** (ou `Run → Start Debugging`)
3. O app abre automaticamente no dispositivo selecionado

---

## 6. Hot Reload e Hot Restart

| Ação | Tecla (VS Code) | Terminal | O que faz |
|---|---|---|---|
| **Hot Reload** | `Ctrl+F5` ou salvar arquivo | `r` | Reflete mudanças de UI instantaneamente |
| **Hot Restart** | `Shift+F5` | `R` | Reinicia o app preservando o código |
| **Parar** | `Shift+F5` (quando pausado) | `q` | Encerra o app |

> 💡 **Hot Reload** é a maior vantagem do Flutter: você vê mudanças em menos de 1 segundo sem perder o estado da tela.

---

## 7. Rodar os testes

```powershell
# Rodar todos os testes
flutter test

# Rodar com saída detalhada
flutter test --reporter=expanded

# Rodar um arquivo específico
flutter test test/widget_test.dart
```

Saída esperada:
```
00:05 +3: All tests passed!
```

---

## 8. Gerar o build

```powershell
# Build para Windows (gera .exe)
flutter build windows

# Build para Web (gera pasta /build/web)
flutter build web

# Build para Android (gera .apk)
flutter build apk
```

O executável Windows fica em:
```
build\windows\x64\runner\Release\flutter_demo.exe
```

---

## 9. Conceitos Flutter usados neste projeto

| Conceito | Onde aparece | Para que serve |
|---|---|---|
| `StatelessWidget` | `MeuApp`, `TelaResultado` | Widget sem estado mutável |
| `StatefulWidget` | `TelaFormulario` | Widget com estado (campos, slider) |
| `setState()` | Slider | Notifica o Flutter para reconstruir a UI |
| `GlobalKey<FormState>` | `_formKey` | Permite chamar `validate()` no Form |
| `TextEditingController` | Campo nome | Lê e controla o valor do campo de texto |
| `validator` | `TextFormField` | Validação com mensagem de erro |
| `Slider` | Idade | Componente visual para selecionar um número |
| `Navigator.push()` | Botão Enviar | Navega para a próxima tela |
| `Navigator.pop()` | Botão Voltar | Volta para a tela anterior |
| `MaterialPageRoute` | Navegação | Define a animação de transição |
| `Theme.of(context)` | Cores | Lê o tema atual para usar as cores corretas |

---

## 10. Problemas comuns

| Erro | Solução |
|---|---|
| `flutter: command not found` | Verifique se `C:\src\flutter\bin` está no PATH e abra um novo terminal |
| `Unable to find git in your PATH` | Instale o Git e reinicie |
| `No supported devices connected` | Selecione Chrome ou habilite o emulador Android |
| Hot Reload não funciona | Verifique se o app está em modo Debug (não Release) |
| Erro de `pub get` (rede) | Execute `flutter pub get` novamente ou verifique o proxy corporativo |

---

## 11. Estrutura de arquivos gerada pelo `flutter create`

```
flutter_demo/
├── android/           ← código nativo Android (gerado automaticamente)
├── ios/               ← código nativo iOS (macOS necessário)
├── linux/             ← desktop Linux
├── macos/             ← desktop macOS
├── web/               ← target web
├── windows/           ← desktop Windows
├── lib/               ← 👈 TODO SEU CÓDIGO DART FICA AQUI
│   ├── main.dart
│   ├── tela_formulario.dart
│   └── tela_resultado.dart
├── test/
│   └── widget_test.dart
├── pubspec.yaml       ← dependências (como package.json no Node)
└── pubspec.lock       ← versões exatas travadas (não editar manualmente)
```

---

*Gerado com Flutter 3.x · Material Design 3 · Dart 3.x*
