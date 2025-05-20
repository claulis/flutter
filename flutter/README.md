# Curso completo de Flutter

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

Material didático completo para aprendizado de Flutter.

[<img src="https://softwareengineeringdaily.com/wp-content/uploads/2018/10/flutter.jpg" width="180">](https://flutter.dev/)

## Sumário

### [Fundamentos do Flutter](../flutter/capitulos/fundamentos_flutter.md)

- Introdução ao Flutter: O que é, arquitetura (framework, widgets, rendering engine).

- Estrutura de um projeto Flutter: Organização de pastas, arquivos (pubspec.yaml, main.dart) e configurações.

- Primeiro aplicativo: Criando um app "Hello World" com Flutter.

### [Conceito de Widgets: StatelessWidget vs StatefulWidget, ciclo de vida](../flutter/capitulos/stateless_statefull.md)

- StatelessWidget

- StatefulWidget

2. Construção de Interfaces de Usuário

Widgets básicos: Text, Image, Icon, Button (ElevatedButton, TextButton, OutlinedButton).
Layouts: Row, Column, Stack, Container, Padding, Expanded, Flexible.
Navegação: Navigator, rotas nomeadas, passagem de dados entre telas.
Estilização: Temas, cores, fontes, personalização de widgets com ThemeData.
Responsividade: MediaQuery, LayoutBuilder e design adaptável.

3. Interatividade e Gerenciamento de Estado

Gerenciamento de estado: Introdução com setState, conceitos de Provider e Riverpod (nível básico).
Formulários: TextField, validação, controle de formulários com Form e GlobalKey.
Listas dinâmicas: ListView, GridView, ListTile e manipulação de dados dinâmicos.
Interatividade avançada: GestureDetector, InkWell e eventos de toque.

4. Integração de Dados

Consumo de APIs: Uso do pacote http para requisições GET e POST.
Parsing de JSON: Conversão de dados JSON para modelos Dart.
Persistência de dados: SharedPreferences para armazenamento simples e introdução a sqflite para bancos locais.
Gerenciamento de erros: Tratamento de falhas em chamadas de API e estados de carregamento.

5. Recursos Avançados

Animações: Animações implícitas (AnimatedContainer, AnimatedOpacity) e Hero animations.
Widgets personalizados: Criação de widgets reutilizáveis e modularização.
Integração com plataforma: Acessando recursos nativos (câmera, localização) com pacotes básicos.
Testes: Introdução a testes unitários e de widgets com o pacote test.

6. Publicação e Boas Práticas

Preparação para publicação: Configuração de ícones, splash screen, build para Android e iOS.
Boas práticas: Estruturação de código, separação de camadas (UI, lógica, dados).
Otimização: Performance, redução de rebuilds desnecessários e debugging.
Publicação na loja: Visão geral do processo para Google Play e App Store.
