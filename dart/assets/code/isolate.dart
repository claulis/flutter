
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