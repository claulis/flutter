// stream_controller.dart
import 'dart:async';

class TemperaturaSensor {
  final _controladorTemperatura = StreamController<double>();

  Stream<double> get temperaturaStream => _controladorTemperatura.stream;

  void adicionarLeitura(double temperatura) {
    if (temperatura > 0) {
      _controladorTemperatura.sink.add(temperatura);
    } else {
      _controladorTemperatura.addError('Temperatura inválida');
    }
  }

  void dispose() {
    _controladorTemperatura.close();
  }
}

void main() async {
  var sensor = TemperaturaSensor();

  sensor.temperaturaStream.listen(
    (temperatura) => print('Temperatura: $temperatura°C'),
    onError: (erro) => print('Erro: $erro'),
  );

  sensor.adicionarLeitura(25.5);
  sensor.adicionarLeitura(-10);
}