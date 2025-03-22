Vou explicar como configurar o VS Code para desenvolvimento em Dart:

# Instalação do VS Code

## Para Windows:
1. Acesse o site oficial: https://code.visualstudio.com/
2. Baixe o instalador para Windows
3. Execute o arquivo .exe e siga o assistente de instalação

## Para macOS:
1. Baixe o VS Code do site oficial
2. Abra o arquivo .dmg baixado
3. Arraste o ícone do VS Code para a pasta Applications
4. Opcionalmente, adicione o VS Code ao Dock

## Para Linux:
### Via package manager (Ubuntu/Debian):
```bash
sudo apt update
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code
```

### Via Snap:
```bash
sudo snap install code --classic
```

# Extensões recomendadas para Dart

Após instalar o VS Code, você deve adicionar algumas extensões essenciais para desenvolvimento em Dart:

1. **Dart**: Oferece suporte básico para a linguagem Dart (syntax highlighting, formatação, etc.)
2. **Flutter**: Se você planeja desenvolver com Flutter, esta extensão é essencial
3. **Dart Data Class Generator**: Facilita a criação de classes de dados
4. **Dart Import**: Organiza automaticamente seus imports
5. **Pubspec Assist**: Facilita a adição de dependências ao arquivo pubspec.yaml

Para instalar estas extensões:
1. Abra o VS Code
2. Clique no ícone de extensões na barra lateral (ou pressione Ctrl+Shift+X)
3. Pesquise por cada extensão e clique em "Install"

# Configuração do ambiente

Para configurar o VS Code para desenvolvimento em Dart:

1. **Configurações específicas para Dart**:
   Abra as configurações (File > Preferences > Settings ou Ctrl+,) e adicione:

   ```json
   {
     "dart.lineLength": 80,
     "dart.previewFlutterUiGuides": true,
     "dart.previewFlutterUiGuidesCustomTracking": true,
     "dart.debugExternalPackageLibraries": false,
     "dart.debugSdkLibraries": false,
     "editor.formatOnSave": true,
     "editor.codeActionsOnSave": {
       "source.fixAll": true,
       "source.organizeImports": true
     },
     "[dart]": {
       "editor.formatOnSave": true,
       "editor.formatOnType": true,
       "editor.rulers": [80],
       "editor.selectionHighlight": false,
       "editor.suggest.snippetsPreventQuickSuggestions": false,
       "editor.suggestSelection": "first",
       "editor.tabCompletion": "onlySnippets",
       "editor.wordBasedSuggestions": false
     }
   }
   ```

2. **Configuração de snippets personalizados**:
   Crie snippets úteis para Dart:
   - Acesse File > Preferences > User Snippets
   - Selecione "dart.json"
   - Adicione snippets como:

   ```json
   {
     "Dart Class": {
       "prefix": "class",
       "body": [
         "class ${1:ClassName} {",
         "  $0",
         "}"
       ],
       "description": "Create a new Dart class"
     }
   }
   ```

# Temas e personalização para desenvolvimento Dart

1. **Temas recomendados**:
   - **Dracula**: Um tema escuro popular entre desenvolvedores
   - **Material Theme**: Oferece várias opções de cores baseadas no Material Design
   - **One Dark Pro**: Um tema escuro inspirado no Atom
   - **Night Owl**: Excelente para programação noturna, com bom contraste
   - **GitHub Theme**: Versões clara e escura inspiradas no GitHub

2. **Personalizações adicionais**:
   - **Fonte**: Considere usar fontes específicas para programação como:
     - Fira Code (com ligaduras)
     - JetBrains Mono
     - Cascadia Code
   
   - **Configuração de fonte com ligaduras**:
   ```json
   {
     "editor.fontFamily": "Fira Code",
     "editor.fontLigatures": true,
     "editor.fontSize": 14
   }
   ```

3. **Ícones personalizados**:
   - Material Icon Theme
   - VSCode Icons
   - Fluent Icons

4. **Layout personalizado**:
   - Habilite a miniatura do código: `"editor.minimap.enabled": true`
   - Ajuste o tamanho da indentação: `"editor.tabSize": 2`
   - Ative a indentação com espaços: `"editor.insertSpaces": true`

---
Vai para:
- [Sumário](https://github.com/claulis/flutter/blob/main/dart/README.md)
- [Próximo capítulo](../capitulos/primeiro-programa.md)