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