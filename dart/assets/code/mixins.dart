// mixins.dart
// Demonstração de mixins em Dart

void main() {
  print('== Testando Mixins com Animais ==');
  
  var peixe = Peixe('Nemo');
  print('\nPeixe ${peixe.nome}:');
  peixe.nadar();
  peixe.comer();
  
  var pato = Pato('Donald');
  print('\nPato ${pato.nome}:');
  pato.nadar(); // Sobrescrito
  pato.voar();  // Do mixin Voador
  pato.comer(); // Da classe Animal
  
  var passaro = Passaro('Blu');
  print('\nPássaro ${passaro.nome}:');
  passaro.voar(); // Do mixin Voador
  // passaro.nadar(); // Erro! Passaro não tem o mixin Nadador
  
  print('\n== Testando Mixin Avançado ==');
  
  var aguia = Aguia('Americana');
  print('\nÁguia ${aguia.nome}:');
  aguia.voar(); // Método sobrescrito pelo mixin VoadorAvancado
  aguia.voarRapido(); // Método do mixin VoadorAvancado
  
  print('\n== Testando Múltiplos Mixins ==');
  demonstrarVeiculoAnfibio();
}

void demonstrarVeiculoAnfibio() {
  var veiculo = VeiculoAnfibio();
  
  print('Demonstrando comportamentos do veículo anfíbio:');
  veiculo.ligarMotor();
  veiculo.acelerar();
  veiculo.nadar();
  veiculo.submergir();
  veiculo.frear();
}

// Classe base
class Animal {
  String nome;
  
  Animal(this.nome);
  
  void comer() {
    print('$nome está comendo');
  }
}

// Mixin para capacidade de nadar
mixin Nadador {
  void nadar() {
    print('Nadando');
  }
  
  void mergulhar() {
    print('Mergulhando');
  }
}

// Mixin para capacidade de voar
mixin Voador {
  void voar() {
    print('Voando');
  }
  
  void planar() {
    print('Planando');
  }
}

// Classe que usa apenas um mixin
class Peixe extends Animal with Nadador {
  Peixe(String nome) : super(nome);
}

// Classe que usa vários mixins
class Pato extends Animal with Nadador, Voador {
  Pato(String nome) : super(nome);
  
  // Podemos sobrescrever métodos dos mixins
  @override
  void nadar() {
    print('$nome está nadando como um pato');
  }
}

// Classe que usa apenas o mixin Voador
class Passaro extends Animal with Voador {
  Passaro(String nome) : super(nome);
}

// Classe base para aves
class Ave {
  String nome;
  
  Ave(this.nome);
  
  void voar() {
    print('Voando como uma ave comum');
  }
}

// Mixin com restrição "on" - só pode ser usado com subclasses de Ave
mixin VoadorAvancado on Ave {
  void voarRapido() {
    print('$nome está voando em alta velocidade');
  }
  
  @override
  void voar() {
    print('$nome está voando como um especialista');
  }
}

// Classe que usa o mixin restrito
class Aguia extends Ave with VoadorAvancado {
  Aguia(String nome) : super(nome);
}

// Demonstração de múltiplos mixins em contexto diferente
// Mixin para veículos terrestres
mixin Terrestre {
  bool _motorLigado = false;
  
  void ligarMotor() {
    _motorLigado = true;
    print('Motor ligado');
  }
  
  void desligarMotor() {
    _motorLigado = false;
    print('Motor desligado');
  }
  
  void acelerar() {
    if (_motorLigado) {
      print('Acelerando em terra');
    } else {
      print('Não é possível acelerar: motor desligado');
    }
  }
  
  void frear() {
    print('Freando');
  }
}

// Mixin para veículos aquáticos
mixin Aquatico {
  void nadar() {
    print('Movendo-se na água');
  }
  
  void submergir() {
    print('Submergindo');
  }
  
  void emergir() {
    print('Emergindo para a superfície');
  }
}

// Classe que usa múltiplos mixins
class VeiculoAnfibio with Terrestre, Aquatico {
  // Podemos adicionar propriedades e métodos específicos
  double velocidade = 0;
  
  @override
  void acelerar() {
    super.acelerar(); // Chama o método do mixin
    velocidade += 10;
    print('Velocidade atual: $velocidade km/h');
  }
}