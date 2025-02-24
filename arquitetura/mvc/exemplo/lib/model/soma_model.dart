class SomaModel {
  double? _result;                               
  // Armazena o resultado
  String _message = "Digite números e clique em 'Somar'"; 
  // Mensagem padrão

  double? get result => _result;                 
  // Getter para resultado
  String get message => _message;                
  // Getter para mensagem

  void add(double num1, double num2) {           
    // Lógica de soma
    _result = num1 + num2;                       
    // Calcula resultado
    _message = "Resultado: $_result";            
    // Atualiza mensagem
  }

  void clear() {                                 
    // Limpa dados
    _result = null;                              
    // Reseta resultado
    _message = "Digite números e clique em 'Somar'"; 
    // Mensagem inicial
  }
}