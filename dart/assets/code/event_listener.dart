class DummyButton{  
   void Function()? onClick;
   void registrarClick(void Function()? funcao) {
     onClick = funcao;
   }
   void clicar() {
     if (onClick != null) {
       onClick!();
     } else {
       print('Nenhuma função registrada para o clique.');
     }
   }  
}
void main() {
  DummyButton botao = DummyButton();  
  void imprimirMensagem() {
    print('Botão clicado!');
  }
  // Registrando a função de clique   
  botao.registrarClick(imprimirMensagem);  
  botao.clicar(); // Saída: Botão clicado!
}
