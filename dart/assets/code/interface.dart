// Demonstração de interfaces em Dart

void main() {
  print('== Exemplo de Dispositivos Eletrônicos ==');
  var smartphone = Smartphone();
  
  // Interagindo com um smartphone
  smartphone.ligar();
  smartphone.conectar();
  
  print('\nVerificando status:');
  print('Ligado: ${smartphone.verificarEnergia()}');
  print('Conectado: ${smartphone.verificarConexao()}');
  
  // Testando métodos específicos do smartphone
  smartphone.fazerLigacao('123-456-789');
  smartphone.tirarFoto();
  
  // Demonstrando desconexão e desligamento
  print('\nDesligando dispositivo:');
  smartphone.desligar();
  print('Ligado: ${smartphone.verificarEnergia()}');
  print('Conectado: ${smartphone.verificarConexao()}');
  
  // Tentando conectar dispositivo desligado
  print('\nTentando conectar dispositivo desligado:');
  smartphone.conectar();
  
  print('\n== Exemplo de Animais ==');
  testarAnimais();
}

void testarAnimais() {
  var cachorro = Cachorro();
  var gato = Gato();
  
  print('\nTestando comportamentos do cachorro:');
  executarComportamentosAnimal(cachorro);
  cachorro.abanarRabo();
  
  print('\nTestando comportamentos do gato:');
  executarComportamentosAnimal(gato);
}

void executarComportamentosAnimal(Animal animal) {
  animal.comer();
  animal.dormir();
  animal.emitirSom();
}

// Interface para dispositivos eletrônicos
abstract class DispositivoEletronico {
  void ligar();
  void desligar();
  bool verificarEnergia();
}

// Interface para dispositivos com conexão à internet
abstract class ConexaoInternet {
  void conectar();
  void desconectar();
  bool verificarConexao();
}

// Interface para dispositivos com câmera
abstract class DispositivoComCamera {
  void tirarFoto();
  void gravarVideo();
}

// Classe que implementa múltiplas interfaces
class Smartphone implements DispositivoEletronico, ConexaoInternet, DispositivoComCamera {
  bool _ligado = false;
  bool _conectado = false;
  
  // Implementação da interface DispositivoEletronico
  @override
  void ligar() {
    _ligado = true;
    print('Smartphone ligado');
  }
  
  @override
  void desligar() {
    _ligado = false;
    _conectado = false;
    print('Smartphone desligado');
  }
  
  @override
  bool verificarEnergia() {
    return _ligado;
  }
  
  // Implementação da interface ConexaoInternet
  @override
  void conectar() {
    if (_ligado) {
      _conectado = true;
      print('Conectado à internet');
    } else {
      print('Impossível conectar: dispositivo desligado');
    }
  }
  
  @override
  void desconectar() {
    _conectado = false;
    print('Desconectado da internet');
  }
  
  @override
  bool verificarConexao() {
    return _conectado;
  }
  
  // Implementação da interface DispositivoComCamera
  @override
  void tirarFoto() {
    if (_ligado) {
      print('Foto tirada com sucesso');
    } else {
      print('Impossível tirar foto: dispositivo desligado');
    }
  }
  
  @override
  void gravarVideo() {
    if (_ligado) {
      print('Gravação de vídeo iniciada');
    } else {
      print('Impossível gravar vídeo: dispositivo desligado');
    }
  }
  
  // Métodos específicos do smartphone
  void fazerLigacao(String numero) {
    if (_ligado) {
      print('Ligando para $numero');
    } else {
      print('Impossível fazer ligação: dispositivo desligado');
    }
  }
}

// Esta classe será usada como interface
class Animal {
  void comer() {
    print('Animal comendo');
  }
  
  void dormir() {
    print('Animal dormindo');
  }
  
  void emitirSom() {
    print('Som genérico de animal');
  }
}

// Implementando a interface Animal
class Cachorro implements Animal {
  // Precisamos implementar todos os métodos
  @override
  void comer() {
    print('Cachorro comendo ração');
  }
  
  @override
  void dormir() {
    print('Cachorro dormindo na casinha');
  }
  
  @override
  void emitirSom() {
    print('Au au!');
  }
  
  // Métodos adicionais
  void abanarRabo() {
    print('Abanando o rabo feliz!');
  }
}

// Outra implementação da interface Animal
class Gato implements Animal {
  @override
  void comer() {
    print('Gato comendo ração de gato');
  }
  
  @override
  void dormir() {
    print('Gato dormindo no sofá');
  }
  
  @override
  void emitirSom() {
    print('Miau!');
  }
}