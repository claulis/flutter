//Classe para Criar um tabuleiro virtual
class TabuleiroEstado {
  //Lista de lista de inteiro "nullable", ou seja pode ter numero inteiro ou null
  final List<List<int?>> tabuleiro = List.generate(8, (i) => List.generate(8, (j) => null));
  //estabelece as posições do jogador 2 e 1
  void inicializar() {
    for (int i = 0; i < 8; i++) //cria 8 linhas e para cada linha
    {
      if (i < 3) { //verifica se as linhas são de 0 a 2
        for (int j = 0; j < 8; j++) { //cria as colunas para cada linha
          if ((i + j) % 2 == 0) tabuleiro[i][j] = 2;//para posições pares coloca 2
        }
      } else if (i > 4) {//verifica se as linha são de 5 a 7
        for (int j = 0; j < 8; j++) {//cria as colunas para cada linha
          if ((i + j) % 2 == 0) tabuleiro[i][j] = 1;//para posições pares coloca 1
        }
      }
    }
  }//fim inicializar
  //metodo para verificar se uma posição está vazia
  bool podeMover(int linha, int coluna) {
    return tabuleiro[linha][coluna] == null;//verifica se a posição no tabuleiro
  }
  //metodo para mover de um ponto até o outro, passando linha e coluna inicial e linha e coluna final
  void mover(int daLinha, int daColuna, int paraLinha, int paraColuna) {
    tabuleiro[paraLinha][paraColuna] = tabuleiro[daLinha][daColuna];//atualiza a posição nova no tabuleiro
    tabuleiro[daLinha][daColuna] = null;//apaga a posição antiga
  }
}
