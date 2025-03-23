// extends.dart
// Demonstração de extensão de classes em Dart

// Classe base com atributos e métodos
class Veiculo {
  String marca;
  String modelo;
  int ano;
  
  Veiculo(this.marca, this.modelo, this.ano);
  
  void exibirInformacoes() {
    print('$marca $modelo, ano $ano');
  }
  
  void ligarMotor() {
    print('Motor ligado');
  }
  
  void desligarMotor() {
    print('Motor desligado');
  }
}

// Extensão da classe Veiculo para criar uma classe mais especializada
class Carro extends Veiculo {
  int numeroDePortas;
  bool temArCondicionado;
  
  // Construtor que chama o construtor da superclasse e inicializa atributos adicionais
  Carro(String marca, String modelo, int ano, this.numeroDePortas, this.temArCondicionado) 
      : super(marca, modelo, ano);
  
  // Método que utiliza um método herdado e adiciona funcionalidade
  void descricaoCompleta() {
    exibirInformacoes();  // Chamando método herdado
    print('Número de portas: $numeroDePortas');
    print('Ar condicionado: ${temArCondicionado ? "Sim" : "Não"}');
  }
  
  void abrirPortas() {
    print('Abrindo as $numeroDePortas portas');
  }
}

// Outra extensão para mostrar como diferentes classes podem estender a mesma base
class Motocicleta extends Veiculo {
  int cilindradas;
  
  Motocicleta(String marca, String modelo, int ano, this.cilindradas) 
      : super(marca, modelo, ano);
  
  void empinar() {
    print('Empinando a moto de $cilindradas cilindradas!');
  }
}

// Exemplo de classe abstrata para demonstrar extensão de classes abstratas
abstract class DispositivoEletronico {
  bool ligado = false;
  
  void ligar() {
    ligado = true;
    print('Dispositivo ligado');
  }
  
  void desligar() {
    ligado = false;
    print('Dispositivo desligado');
  }
  
  // Método abstrato que deve ser implementado pelas subclasses
  void executarFuncaoPrincipal();
}

// Extensão de uma classe abstrata
class Televisao extends DispositivoEletronico {
  int canal = 1;
  int volume = 10;
  
  void mudarCanal(int novoCanal) {
    if (ligado) {
      canal = novoCanal;
      print('Canal alterado para $canal');
    } else {
      print('A TV está desligada');
    }
  }
  
  void ajustarVolume(int novoVolume) {
    if (ligado) {
      volume = novoVolume;
      print('Volume ajustado para $volume');
    } else {
      print('A TV está desligada');
    }
  }
  
  // Implementação do método abstrato
  @override
  void executarFuncaoPrincipal() {
    if (ligado) {
      print('Exibindo imagem e som no canal $canal');
    } else {
      print('A TV está desligada');
    }
  }
}

void main() {
  print('--- Exemplo de Veículos ---');
  Veiculo meuVeiculo = Veiculo('Genérico', 'Básico', 2020);
  meuVeiculo.exibirInformacoes();
  meuVeiculo.ligarMotor();
  
  print('\n--- Exemplo de Carro ---');
  Carro meuCarro = Carro('Toyota', 'Corolla', 2023, 4, true);
  meuCarro.descricaoCompleta();
  meuCarro.ligarMotor();  // Método herdado
  meuCarro.abrirPortas(); // Método específico
  
  print('\n--- Exemplo de Moto ---');
  Motocicleta minhaMoto = Motocicleta('Honda', 'CB500', 2022, 500);
  minhaMoto.exibirInformacoes(); // Método herdado
  minhaMoto.empinar();           // Método específico
  
  print('\n--- Exemplo de Dispositivo Eletrônico ---');
  Televisao minhaTV = Televisao();
  minhaTV.ligar();
  minhaTV.mudarCanal(5);
  minhaTV.ajustarVolume(15);
  minhaTV.executarFuncaoPrincipal();
  minhaTV.desligar();
}