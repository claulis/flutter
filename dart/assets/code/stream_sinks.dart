// streams_sinks.dart
import 'dart:async';

class ProcessadorDeDados {
  final _streamProcessada = StreamController<String>();
  
  StreamSink<String> get entradaDados => _streamProcessada.sink;

  Stream<String> get dadosProcessados => _streamProcessada.stream.map((dado) {
    return dado.toUpperCase();
  });

  void dispose() {
    _streamProcessada.close();
  }
}

void main() {
  var processador =ProcessadorDeDados();

  processador.dadosProcessados.listen(
    (dadoProcessado) => print('Dado processado: $dadoProcessado')
  );

  processador.entradaDados.add('hello world');
}