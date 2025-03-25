// event_listeners.dart
class BotaoInterativo {
  void Function()? _onClicado;

  void registrarClique(void Function() callback) {
    _onClicado = callback;
  }

  void simularClique() {
    print("Botão foi clicado!");
    _onClicado?.call();
  }
}

void main() {
  var botao = BotaoInterativo();
  
  botao.registrarClique(() {
    print("Ação personalizada executada!");
  });

  botao.simularClique();
}