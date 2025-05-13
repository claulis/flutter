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