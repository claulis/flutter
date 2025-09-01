# Curso de Desenvolvimento Dart/Flutter

![Dart & Flutter Banner](https://img.shields.io/badge/Dart%20%26%20Flutter-Mobile%20Development-02569B?style=for-the-badge&logo=flutter&logoColor=white)  

[![Flutter Version](https://img.shields.io/badge/Flutter-3.35.0-02569B?style=flat&logo=flutter&logoColor=white)](https://flutter.dev)  
[![Dart Version](https://img.shields.io/badge/Dart-3.9.0-0175C2?style=flat&logo=dart&logoColor=white)](https://dart.dev)  
[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey?style=flat)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

## Introdução

Bem-vindo ao **Curso de Desenvolvimento Dart/Flutter**! Este repositório oferece um conjunto completo de materiais didáticos, abrangendo teoria, exemplos práticos e códigos para o desenvolvimento de aplicativos mobile multiplataforma com Flutter. Projetado para iniciantes e desenvolvedores intermediários, o curso enfatiza um aprendizado progressivo e prático.

> **Nota Essencial:**  
>
> - **Dart** é a linguagem de programação subjacente.  
> - **Flutter** é o framework para criar interfaces nativas e performáticas.

Explore os módulos abaixo para mergulhar no conteúdo.

---

## Instalação

Para configurar seu ambiente de desenvolvimento, siga as instruções abaixo. Focaremos na instalação para **Windows** utilizando **Visual Studio Code (VS Code)** como editor principal, que é leve e eficiente para Flutter. No entanto, o **Android Studio** é essencial para configurar o Android toolchain, emuladores e SDKs necessários para testar apps mobile. Essas etapas são baseadas na documentação oficial do Flutter e garantem uma configuração robusta.

### Passo a Passo para Instalação no Windows com VS Code e Android Studio

1. **Instale o Git para Windows:**  
   Baixe e instale do site oficial: [git-scm.com](https://git-scm.com/download/win). Escolha as opções padrão durante a instalação. Isso é essencial para clonar repositórios e instalar o Flutter.

2. **Instale o Visual Studio Code (VS Code):**  
   Baixe do site oficial: [code.visualstudio.com](https://code.visualstudio.com/download). Instale com as configurações padrão. VS Code é o editor recomendado para sua leveza e integração com extensões Flutter.

3. **Instale o Android Studio (Essencial para Android Toolchain):**  
   Baixe e instale do site oficial: [developer.android.com/studio](https://developer.android.com/studio).  
   - Durante a instalação, selecione as opções padrão.  
   - Abra o Android Studio após a instalação e complete o Setup Wizard para baixar componentes iniciais.  
   - Isso fornece o Android SDK, emuladores e ferramentas necessárias para rodar apps Flutter em dispositivos Android.
   - Após a instalação

4. **Instale o Flutter SDK via VS Code (Método Recomendado):**  
   - Abra o VS Code.  
   - Pressione `Ctrl + Shift + P` para abrir o Command Palette.  
   - Digite "Flutter: New Project" e selecione a opção.  
   - O VS Code irá pedir para localizar ou baixar o SDK: Clique em `Download SDK` (requer Git instalado).  
   - Escolha uma pasta para instalar (ex.: `C:\dev\flutter`).
   > Escolha a pasta C: por motivos de privilégios
   - Clique em `Clone Flutter` para baixar (~600 MB; pode levar alguns minutos).  
   - Após o download, adicione o SDK ao PATH quando solicitado. Clicar em `Add SDK to PATH`
   - Feche e reabra o VS Code e todas as janelas do PowerShell para aplicar as mudanças.

   **Alternativa Manual:**  
   - Baixe o SDK do [site oficial](https://flutter.dev/docs/get-started/install/windows) (versão estável).  
   - Extraia o arquivo ZIP para uma pasta (ex.: `C:\dev\flutter`).  
   - Adicione `C:\dev\flutter\bin` ao PATH do sistema:  
     - Pesquise por "Variáveis de Ambiente" no menu Iniciar.  
     - Edite a variável "Path" em "Variáveis do Usuário" e adicione o caminho.  
     - Salve e reinicie o PowerShell.

5. **Configure o Android Toolchain no Android Studio:**  
   - Abra o Android Studio.
   ![Android Studio](/assets/img/android.png)
   - Vá para o SDK Manager (`Tools > SDK Manager`):  
     - Na aba "SDK Platforms", selecione Android API 35 (ou mais recente) e aplique.  
     - Na aba "SDK Tools", marque:  
       - Android SDK Command-line Tools (latest).
       - CMake.
       - NDK.
       - Android Emulator.
       - Android Emulator Hypervisor driver.
       - Android SDK Platform-Tools.  
       - Android SDK Build-Tools.
       ![SDK Tools](/assets/img/sdktools.png)  
     - Clique em "Apply" para instalar.  
   - Aceite as licenças do Android: Abra o PowerShell e execute `flutter doctor --android-licenses`. Aceite todos os termos (pressione 'y' e Enter).

6. **Instale as Extensões no VS Code:**  
   - Abra o VS Code.  
   - Vá para a aba Extensions (ícone de blocos no lado esquerdo).  
   - Pesquise por "Flutter" e instale a extensão oficial (Dart-Code.flutter). Isso também instala a extensão Dart automaticamente.

7. **Valide a Instalação:**  
   - No VS Code, pressione `Ctrl + Shift + P`.  
   - Digite "Flutter: Run Flutter Doctor" e execute.  
   - Verifique o Output: Deve mostrar que o Flutter, Dart, Android toolchain (incluindo Android Studio), e VS Code estão configurados corretamente. Resolva qualquer erro reportado (ex.: se faltar algo, instale via SDK Manager).  
8. **Crie um projeto de teste:**

- No VS Code, pressione `Ctrl + Shift + P`.  
- Digite "Flutter: New Project" e execute.
- Escolha Application
 ![app](/assets/img/app.png)
- Selecione a sua pasta de projetos flutter (C:/flutter_projects) 
- Coloque um nome no projeto
- Espere o script *flutter.create* gerar a estrutura (pode demorar um pouco)
- Para executar o projeto abra um Novo Terminal de na pasta do projeto digite `flutter run`
- Escolha um emulador ou navegador web

**Dicas Adicionais:**  

- Para emuladores: No Android Studio, vá para `Tools > AVD Manager` e crie um dispositivo virtual.  
- Conecte um dispositivo físico via USB e ative o modo desenvolvedor (Configurações > Sobre o telefone > Toque 7x no número da build).  
- Atualize o Flutter regularmente: `flutter upgrade`.  

---

## Escolha um Módulo

<div align="center">
  <a href="https://github.com/claulis/flutter/blob/main/dart/README.md">
    <img src="https://dart.dev/assets/img/logo/dart-logo-for-shares.png" alt="Módulo Dart" width="200" style="margin: 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
  </a>
  <a href="https://github.com/claulis/flutter/blob/main/flutter/README.md">
    <img src="https://storage.googleapis.com/cms-storage-bucket/c823e53b3a1a7b0d36a9.png" alt="Módulo Flutter" width="200" style="margin: 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
  </a>
</div>

- **[Dart: Fundamentos da Linguagem](https://github.com/claulis/flutter/blob/main/dart/README.md)**  
  Domine a sintaxe, variáveis, funções e conceitos de programação orientada a objetos.

- **[Flutter: Construindo Apps Mobile](https://github.com/claulis/flutter/blob/main/flutter/README.md)**  
  Aprenda widgets, gerenciamento de estado, navegação e integrações com APIs.



