# Primeiro Programa em Dart

## Estrutura básica de um programa Dart

Um programa Dart típico possui a seguinte estrutura:

1. Importações de bibliotecas
2. Declarações de variáveis globais ou constantes (opcional)
3. Declarações de funções ou classes
4. Função principal `main()`

A função `main()` é o ponto de entrada obrigatório para qualquer aplicação Dart executável. É por ela que a execução do programa sempre começa.

## Olá Mundo

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

## Execução do programa

### Passo 1: Crie um arquivo com extensão .dart
Salve o código acima em um arquivo chamado `ola_mundo.dart`.
O código encontra-se aqui [ola_mundo.dart](../assets/code/ola_mundo.dart)

### Passo 2: Execute usando o comando dart
Abra o terminal na pasta onde está o arquivo e execute:

```bash
dart hello_world.dart
```

Você verá a saída:
```
Olá mundo!
```

### Execução no VS Code
Se estiver usando o VS Code com a extensão Dart instalada:

1. Abra o arquivo `.dart`
2. Clique no botão "Run" acima da função `main()`
3. Ou use o atalho F5 para executar o programa em modo de debug

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
- [Sumário](https://github.com/claulis/flutter/blob/main/dart/README.md)
- [Próximo capítulo](../capitulos/variaveis-constantes.md)