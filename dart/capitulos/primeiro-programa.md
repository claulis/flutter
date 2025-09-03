# Primeiro Projeto em Dart

Existem várias maneiras para criar e executar programa em Dart, aqui serão demonstradas duas maneiras: Dart CLI e Projeto Dart

## Estrutura básica de um programa Dart

Um programa Dart típico possui a seguinte estrutura:

1. Importações de bibliotecas
2. Declarações de variáveis globais ou constantes (opcional)
3. Declarações de funções ou classes
4. Função principal `main()`

A função `main()` é o ponto de entrada obrigatório para qualquer aplicação Dart executável. É por ela que a execução do programa sempre começa.

### Olá Mundo

Vamos criar nosso primeiro programa Dart, o clássico "Olá mundo":

```dart
void main() {
  print('Olá mundo!');
}
```

Explicação:

- `void`: indica que a função não retorna nenhum valor
- `main()`: a função principal que será executada quando o programa iniciar
- `print()`: função que exibe texto no console
- `'Olá mundo!'`: uma string (texto) entre aspas simples

## Execução com Dart CLI

### Passo 1: Crie um arquivo com extensão .dart

Salve o código acima em um arquivo chamado `ola_mundo.dart` e em uma pasta (ex: dart_projects).


https://github.com/user-attachments/assets/60ae6493-06dc-4237-8cfc-ee87dfaddbad



O código encontra-se aqui [ola_mundo.dart](../assets/code/ola_mundo.dart)

### Passo 2: Execute usando o comando dart

Abra o terminal `Terminal -> New Terminal` na pasta onde está o arquivo e execute:

```bash
dart hello_world.dart
```

Você verá a saída:

```text
Olá mundo!
```

https://github.com/user-attachments/assets/5550677d-b569-4bf8-94bf-b03c86378674

## Execução de um projeto Dart

### Criação do projeto

1. Abra o Vs Code e digite `ctrl+shift+p`.
2. No menu vão aparecer vários tipos de projetos, por facilidade escolha um *Console Application* template.
3. Escolha a pasta onde será criado o projeto (ex: dart_projects).
4. Escolha um nome para o projeto (O nome do projeto será o nome da pasta).
5. Espere o script dart.create crair e organizar a estrutura da pastas.

https://github.com/user-attachments/assets/e78a60bc-cd2f-4ab1-a370-ea4fd2076c01

### Estrutura do projeto

Na imagem abaixo tem a estrutura das pastas do projeto Dart

![Estrutura projeto Dart](/dart/assets/images/estruturaprojetodart.png)

| **Pasta/Arquivo** | **Descrição** | **Conteúdo Típico** | **Relevância** |
|--------------------|---------------|---------------------|----------------|
| **bin/** | Diretório com o arquivo executável principal. | Contém `bin/nome_do_projeto.dart`, ponto de entrada do app. | Inicia a execução do programa com `dart run` ou `dart compile exe`. |
| **bin/nome_do_projeto.dart** | Arquivo com a função `main()`. | ```dart
| **lib/** | Diretório para bibliotecas reutilizáveis. | Contém `lib/nome_do_projeto.dart` e outros arquivos Dart. | Organiza código modular e reutilizável. |
| **lib/nome_do_projeto.dart** | Arquivo com lógica reutilizável. | ```dart<br>int calculate() {<br>  return 6 * 7;<br>}<br>``` | Contém funções ou classes importadas pelo arquivo principal. |
| **pubspec.yaml** | Arquivo de configuração do projeto. | ```yaml<br>name: nome_do_projeto<br>description: A simple command-line application.<br>version: 1.0.0<br>environment:<br>  sdk: '>=2.19.0 <3.0.0'<br>dependencies:<br>dev_dependencies:<br>  lints: ^2.0.0<br>  test: ^1.21.0<br>``` | Define metadados e dependências do projeto. |
| **pubspec.lock** | Registra versões exatas das dependências. | ```yaml<br>packages:<br>  args:<br>    version: 2.4.2<br>``` | Garante consistência nas dependências. |
| **README.md** | Documentação do projeto em Markdown. | ```markdown<br># nome_do_projeto<br>A simple command-line application.<br>``` | Orienta usuários e desenvolvedores sobre o projeto. |
| **analysis_options.yaml** | Configuração para análise estática. | ```yaml<br>include: package:lints/recommended.yaml<br>analyzer:<br>  exclude: [build/**]<br>``` | Define regras de lint para `dart analyze`. |
| **.gitignore** | Especifica arquivos a ignorar no Git. | ```gitignore<br>.dart_tool/<br>.packages<br>build/<br>``` | Evita versionamento de arquivos temporários. |
| **CHANGELOG.md** | Registro de alterações do projeto. | ```markdown<br># Changelog<br>## 1.0.0<br>- Initial version.<br>``` | Rastreia mudanças e versões do projeto. |
| **test/** (opcional) | Diretório para testes. | ```dart<br>import 'package:test/test.dart';<br>void main() {<br>  test('Teste exemplo', () {<br>    expect(1 + 1, equals(2));<br>  });<br>}<br>``` | Usado com `dart test` para validar o código. |

### Como executar

Abra um novo terminal `Terminal -> New Terminal`, vá até a pasta `/bin` e execute o comando no terminal `dart run nome_arquivo.dart`


https://github.com/user-attachments/assets/01554f97-5643-4341-b0f3-815ee26a5280


### Como compilar e executar

Com essa técnica além de executar pode gerar um executavel `.exe` que pode ser distribuido. Esse exemplo é apenas para Windows.

Modifique o código para que o .exe não feche abruptamente logo após da execução (a titulo de demonstração).

```dart
import 'package:exemplo/exemplo.dart' as exemplo;
import 'dart:io';

void main(List<String> arguments) {
  print('Hello world: ${exemplo.calculate()}!');
   stdin.readLineSync();
}
```

Depois no terminal, na pasta /bin, digite ``dart compile exe nome_arquivo.dart`
Após isso, dart vai gerar um executável nome_arquivo.exe. Vá até a pasta do arquivo gerado e clique no .exe para executar


https://github.com/user-attachments/assets/9b4a6195-1219-42ea-aa11-a86949b5317c


## Comentários em Dart

Dart suporta três tipos de comentários:

### Comentários de linha única

Começam com `//` e vão até o final da linha.

```dart
// Este é um comentário de linha única
void main() {
  print('Olá mundo!'); // Este é outro comentário
}
```

### Comentários de múltiplas linhas

Começam com `/*` e terminam com `*/`.

```dart
/* Este é um comentário
   de múltiplas linhas
   que pode ocupar várias linhas */
void main() {
  print('Olá mundo!');
}
```

### Comentários de documentação

Começam com `///` ou `/**` e são usados para gerar documentação automática.

```dart
/// Esta função exibe uma saudação personalizada.
/// 
/// O parâmetro [nome] especifica quem será saudado.
void saudar(String nome) {
  print('Olá, $nome!');
}

void main() {
  saudar('Mundo');
}
```

## Padrões de formatação de código

O Dart tem um guia de estilo oficial que estabelece boas práticas para formatação de código:

### Indentação

- Use 2 espaços para indentação (não use tabs)
- Alinhe blocos com chaves
  
```dart
if (condicao) {
  print('Verdadeiro!');
} else {
  print('Falso!');
}
```

### Nomenclatura

- Use `camelCase` para variáveis e funções: `minhaVariavel`, `calcularTotal()`
- Use `PascalCase` para classes: `MinhaClasse`, `ContaBancaria`
- Use `snake_case` para arquivos: `meu_arquivo.dart`

### Chaves

- Sempre use chaves para blocos de código, mesmo que sejam de uma linha

```dart
// Correto
if (condicao) {
  print('Verdadeiro!');
}

// Evite
if (condicao) print('Verdadeiro!');
```

### Linha de comprimento

- Limite as linhas para no máximo 80 caracteres

### Formatação automática

Dart possui uma ferramenta de formatação automática:

```bash
dart format arquivo.dart
```

No VS Code, com a extensão Dart instalada, você pode formatar o código automaticamente pressionando:

- Windows/Linux: `Ctrl+Shift+F`
- Mac: `Cmd+Shift+F`

Ou habilitar formatação automática ao salvar nas configurações do VS Code.

---
Vai para:

- [Sumário](/dart/README.md)
- [Próximo capítulo](/dart/capitulos/variaveis-constantes.md)
