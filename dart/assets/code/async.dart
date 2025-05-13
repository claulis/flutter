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