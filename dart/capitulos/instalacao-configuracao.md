
# Instalação  e configuração do SDK Dart

## Opção 1: Instalação direta

### Para Windows:
1. Acesse o site oficial do Dart: [https://dart.dev/get-dart](https://dart.dev/get-dart)
2. Baixe o instalador para Windows
3. Execute o arquivo .exe e siga as instruções do assistente de instalação

### Para macOS:
```bash
brew tap dart-lang/dart
brew install dart
```

### Para Linux (Ubuntu/Debian):
```bash
sudo apt-get update
sudo apt-get install apt-transport-https
sudo wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/dart.gpg
sudo echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | sudo tee /etc/apt/sources.list.d/dart_stable.list
sudo apt-get update
sudo apt-get install dart
```

## Opção 2: Via Flutter 
Se você instalar o Flutter SDK, ele já inclui o Dart SDK. Nesse caso, a configuração das variáveis de ambiente será feita automaticamente para ambos.

# Configuração de variáveis de ambiente

### Para Windows:
1. Busque por "Variáveis de ambiente" no menu Iniciar
2. Clique em "Editar as variáveis de ambiente do sistema"
3. Clique no botão "Variáveis de ambiente"
4. Em "Variáveis do sistema", selecione a variável PATH e clique em "Editar"
5. Adicione o caminho para o diretório bin do Dart SDK:
   - Normalmente: `C:\Program Files\dart-sdk\bin`
6. Clique em "OK" para salvar as alterações

### Para macOS/Linux:
Adicione as seguintes linhas ao seu arquivo ~/.bashrc, ~/.zshrc ou equivalente:
```bash
export PATH="$PATH:/usr/lib/dart/bin"
# Se você instalou via Flutter, o caminho seria:
# export PATH="$PATH:[caminho-flutter]/bin/cache/dart-sdk/bin"
```

Depois execute:
```bash
source ~/.bashrc  # ou source ~/.zshrc
```

# Verificação da instalação

Para verificar se o Dart foi instalado corretamente:
```bash
dart --version
```

Isso deve exibir a versão do Dart SDK instalada no seu sistema.

# Dart CLI básico

Alguns comandos básicos do Dart CLI:

- `dart [arquivo.dart]` - Executa um script Dart
- `dart compile exe [arquivo.dart]` - Compila um script Dart para um executável nativo
- `dart create [nome-projeto]` - Cria um novo projeto Dart com estrutura básica
- `dart pub get` - Baixa as dependências listadas no pubspec.yaml
- `dart pub add [pacote]` - Adiciona uma nova dependência ao projeto
- `dart analyze` - Executa o analisador estático para encontrar erros no código
- `dart format [diretório/arquivo]` - Formata o código seguindo as convenções do Dart

---
Vai para:
- [Sumário](https://github.com/claulis/flutter/blob/main/dart/README.md)
- [Próximo capítulo](../capitulos/configurando-vscode.md)