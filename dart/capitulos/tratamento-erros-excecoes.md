# Tratamento de Erros e Exceções em Dart

## 1. Try/catch/finally

O bloco `try/catch/finally` é usado para capturar e tratar exceções que podem ocorrer durante a execução de um código. O `try` contém o código que pode gerar uma exceção, o `catch` lida com a exceção capturada, e o `finally` executa código independente de uma exceção ter ocorrido ou não.

### Exemplo

```dart
void main() {
  try {
    int resultado = 10 ~/ 0; // Divisão por zero gera uma exceção
    print('Resultado: $resultado');
  } catch (e) {
    print('Erro capturado: $e');
  } finally {
    print('Bloco finally: sempre executado.');
  }
}
```

**Saída:**

``` plaintext
Erro capturado: IntegerDivisionByZeroException
Bloco finally: sempre executado.
```

No exemplo acima, a divisão por zero lança uma exceção, que é capturada pelo `catch`. O bloco `finally` é executado independentemente do erro.

[Aqui](../assets/code/try_catch.dart) o exemplo completo.

## 2. Throw e rethrow

A palavra-chave `throw` é usada para lançar (gerar) uma exceção explicitamente. Já o `rethrow` permite relançar uma exceção capturada, propagando-a para um nível superior na pilha de chamadas, geralmente após algum tratamento parcial.

### Exemplo

```dart
void verificarIdade(int idade) {
  if (idade < 0) {
    throw Exception('Idade não pode ser negativa');
  }
  print('Idade válida: $idade');
}

void main() {
  try {
    try {
      verificarIdade(-5);
    } catch (e) {
      print('Erro interno: $e');
      rethrow; // Relança a exceção
    }
  } catch (e) {
    print('Erro capturado no nível superior: $e');
  }
}
```

**Saída:**

```plaintext
Erro interno: Exception: Idade não pode ser negativa
Erro capturado no nível superior: Exception: Idade não pode ser negativa
```

Aqui, a função `verificarIdade` lança uma exceção com `throw`. O bloco `catch` interno captura e imprime o erro, mas usa `rethrow` para propagar a exceção ao `catch` externo.

[Aqui](../assets/code/throw.dart) o exemplo completo.

## 3. Tipos de Exceções

Em Dart, exceções podem ser de diferentes tipos. As mais comuns incluem:

- **`Exception`**: Uma classe genérica para erros personalizados.
- **`Error`**: Representa erros graves, como problemas de lógica ou memória.
- **Exceções específicas**: Como `FormatException`, `IntegerDivisionByZeroException`, `IOException`, entre outras.

Você pode capturar exceções específicas no `catch` para tratamentos diferenciados.

### Exemplo

```dart
void main() {
  try {
    var valor = int.parse('abc'); // Gera FormatException
    print(valor);
  } on FormatException {
    print('Erro: o valor não é um número válido.');
  } on Exception {
    print('Outra exceção genérica.');
  } catch (e) {
    print('Erro inesperado: $e');
  }
}
```

**Saída:**

```plaintext
Erro: o valor não é um número válido.
```

No exemplo, o `on FormatException` captura especificamente um erro de formatação, enquanto `catch (e)` lida com qualquer outro erro.

## 4. Criação de Exceções Personalizadas

Você pode criar suas próprias exceções personalizadas ao estender a classe `Exception` ou implementar a interface `Exception`. Isso é útil para cenários específicos do seu aplicativo.

### Exemplo

```dart
class SaldoInsuficienteException implements Exception {
  final String mensagem;
  SaldoInsuficienteException(this.mensagem);
  
  @override
  String toString() => 'SaldoInsuficienteException: $mensagem';
}

class ContaBancaria {
  double saldo;
  ContaBancaria(this.saldo);
  
  void sacar(double valor) {
    if (valor > saldo) {
      throw SaldoInsuficienteException('Saldo insuficiente para sacar $valor');
    }
    saldo -= valor;
    print('Saque de $valor realizado. Novo saldo: $saldo');
  }
}

void main() {
  var conta = ContaBancaria(100.0);
  try {
    conta.sacar(150.0);
  } catch (e) {
    print('Erro: $e');
  }
}
```

**Saída:**

```plaintext
Erro: SaldoInsuficienteException: Saldo insuficiente para sacar 150.0
```

Aqui, criamos uma exceção personalizada `SaldoInsuficienteException` para lidar com tentativas de saque com saldo insuficiente.

[Aqui](../assets/code/class_exception.dart) o exemplo completo.

## 5. Estratégias de Tratamento de Erros

Existem várias estratégias para gerenciar erros em Dart, dependendo do contexto:

- **Captura local**: Use `try/catch` para tratar erros imediatamente onde eles ocorrem.
- **Propagação de erros**: Permita que exceções subam na pilha de chamadas usando `rethrow` ou evitando capturá-las.
- **Logs e monitoramento**: Registre erros em logs para depuração, usando pacotes como `logging`.
- **Validação prévia**: Verifique condições antes de executar operações arriscadas para evitar exceções.
- **Fallbacks**: Forneça valores padrão ou comportamentos alternativos quando um erro ocorre.

### Exemplo com Validação Prévia

```dart
double dividir(double a, double b) {
  if (b == 0) {
    print('Erro: Divisão por zero não permitida.');
    return double.nan; // Valor padrão para erro
  }
  return a / b;
}

void main() {
  var resultado = dividir(10, 0);
  print('Resultado: $resultado');
  
  resultado = dividir(10, 2);
  print('Resultado: $resultado');
}
```

**Saída:**

```plaintext
Erro: Divisão por zero não permitida.
Resultado: NaN
Resultado: 5.0
```

Neste exemplo, a função `dividir` valida o divisor antes da operação, evitando uma exceção e retornando um valor padrão (`NaN`).

---
Vai para:
- [Sumário](https://github.com/claulis/flutter/blob/main/dart/README.md)
- [Próximo capítulo](../capitulos/programacao-assincrona.md)
