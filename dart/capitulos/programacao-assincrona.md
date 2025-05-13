# Programação Assíncrona em Dart

## 1. Futures

Um `Future` representa um valor que estará disponível em algum momento no futuro. É usado para operações assíncronas, como buscar dados de uma API. Um `Future` pode estar em três estados: incompleto, concluído com um valor ou concluído com um erro.

### Exemplo

```dart
Future<String> buscarMensagem() {
  return Future.delayed(Duration(seconds: 2), () => 'Olá, mundo!');
}

void main() {
  print('Iniciando...');
  buscarMensagem().then((mensagem) {
    print('Mensagem recebida: $mensagem');
  }).catchError((erro) {
    print('Erro: $erro');
  });
  print('Continuando...');
}
```

**Saída:**

```plaintext
Iniciando...
Continuando...
Mensagem recebida: Olá, mundo!
```

No exemplo, `buscarMensagem` simula uma operação que leva 2 segundos. O método `then` lida com o valor retornado, enquanto `catchError` captura possíveis erros. Note que o código após o `Future` continua executando, demonstrando a natureza assíncrona.

[Aqui](../assets/code/future.dart) o exemplo completo.

## 2. Async/await

As palavras-chave `async` e `await` simplificam o trabalho com `Futures`, permitindo escrever código assíncrono de forma que se assemelha ao síncrono. Funções marcadas com `async` retornam um `Future`, e `await` pausa a execução até que o `Future` seja concluído.

### Exemplo

```dart
Future<String> buscarMensagem() {
  return Future.delayed(Duration(seconds: 2), () => 'Olá, mundo!');
}

Future<void> main() async {
  print('Iniciando...');
  try {
    String mensagem = await buscarMensagem();
    print('Mensagem recebida: $mensagem');
  } catch (erro) {
    print('Erro: $erro');
  }
  print('Finalizando...');
}
```

**Saída:**

```plaintext
Iniciando...
Mensagem recebida: Olá, mundo!
Finalizando...
```

Aqui, `await` espera a conclusão de `buscarMensagem` antes de prosseguir. O `try/catch` lida com erros, e a função `main` é marcada como `async` porque usa `await`.

[Aqui](../assets/code/async.dart) o exemplo completo.

## 3. Paralelismo com Isolates

Dart é single-threaded, mas suporta paralelismo com `Isolates`. Cada `Isolate` tem sua própria memória e executa código de forma independente, permitindo tarefas paralelas, como cálculos intensivos, sem bloquear a thread principal.

### Exemplo

```dart
import 'dart:isolate';

void tarefaPesada(SendPort sendPort) {
  // Simula uma tarefa intensiva: soma de números de 1 a n
  int soma(int n) {
    int total = 0;
    for (int i = 1; i <= n; i++) {
      total += i;
    }
    return total;
  }
  sendPort.send(soma(1000000)); // Calcula soma de 1 a 1 milhão
}

void tarefaPesada2(SendPort sendPort) {
  // Simula outra tarefa intensiva: cálculo de quadrados
  int somaQuadrados(int n) {
    int total = 0;
    for (int i = 1; i <= n; i++) {
      total += i * i;
    }
    return total;
  }
  sendPort.send(somaQuadrados(1000)); // Calcula soma de quadrados de 1 a 1000
}

void main() async {
  ReceivePort receivePort1 = ReceivePort();
  ReceivePort receivePort2 = ReceivePort();

  print('Iniciando Isolates...');
  await Isolate.spawn(tarefaPesada, receivePort1.sendPort);
  await Isolate.spawn(tarefaPesada2, receivePort2.sendPort);

  // Coleta resultados de ambos os Isolates
  var resultado1 = await receivePort1.first;
  var resultado2 = await receivePort2.first;

  print('Resultado da tarefa 1 (soma): $resultado1');
  print('Resultado da tarefa 2 (soma de quadrados): $resultado2');
}
```

**Saída:**

```plaintext
Iniciando Isolates...
Resultado da tarefa 1 (soma): 500000500000
Resultado da tarefa 2 (soma de quadrados): 333833500
```

Neste exemplo, dois `Isolates` executam tarefas intensivas em paralelo: um calcula a soma de números de 1 a 1 milhão, e outro calcula a soma dos quadrados de 1 a 1000. Cada `Isolate` usa seu próprio `ReceivePort` para enviar o resultado ao programa principal, demonstrando paralelismo verdadeiro sem bloquear a thread principal.

[Aqui](../assets/code/isolate.dart) o exemplo completo.

## 4. Padrões Assíncronos Comuns

Existem padrões comuns para lidar com operações assíncronas em Dart:

- **Encadeamento de Futures**: Usar múltiplos `then` para sequenciar operações.
- **Paralelismo com `Future.wait`**: Executar várias operações assíncronas simultaneamente.
- **Timeout**: Definir um tempo máximo para uma operação com `timeout`.
- **Retry**: Tentar novamente uma operação em caso de falha.

### Exemplo com Future.wait

```dart
Future<String> tarefa1() => Future.delayed(Duration(seconds: 1), () => 'Tarefa 1 concluída');
Future<String> tarefa2() => Future.delayed(Duration(seconds: 2), () => 'Tarefa 2 concluída');

void main() async {
  print('Iniciando tarefas...');
  List<Future<String>> tarefas = [tarefa1(), tarefa2()];
  List<String> resultados = await Future.wait(tarefas);
  print('Resultados: $resultados');
}
```

**Saída:**

```plaintext
Iniciando tarefas...
Resultados: [Tarefa 1 concluída, Tarefa 2 concluída]
```

Aqui, `Future.wait` aguarda a conclusão de todas as tarefas antes de retornar seus resultados, permitindo execução paralela.

## 5. Stream API Avançada

A `Stream` é usada para lidar com uma sequência de eventos assíncronos, como dados de um WebSocket ou eventos de UI. A API de `Stream` em Dart oferece ferramentas avançadas, como transformações, filtros e controle de fluxo.

### Exemplo

```dart
Stream<int> contarNumeros(int max) async* {
  for (int i = 1; i <= max; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() {
  Stream<int> stream = contarNumeros(5)
      .where((numero) => numero % 2 == 0) // Filtra números pares
      .map((numero) => numero * 2); // Multiplica por 2
  
  stream.listen(
    (valor) => print('Valor recebido: $valor'),
    onDone: () => print('Stream concluída'),
    onError: (erro) => print('Erro: $erro'),
  );
}
```

**Saída:**

```plaintext
Valor recebido: 4
Valor recebido: 8
Stream concluída
```

Neste exemplo, a função `contarNumeros` gera uma `Stream` que emite números com intervalo de 1 segundo. Usamos `where` para filtrar números pares e `map` para multiplicá-los por 2. O método `listen` consome os eventos da `Stream`.

[Aqui](../assets/code/stream_async.dart.dart) o exemplo completo.
