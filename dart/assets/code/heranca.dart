// heranca.dart
// Demonstração de herança básica em Dart

// Classe base (superclasse)
class Animal {
  String nome;
  
  Animal(this.nome);
  
  void emitirSom() {
    print('Som genérico de animal');
  }
  
  void mover() {
    print('$nome está se movendo');
  }
  
  void comer() {
    print('$nome está comendo');
  }
}

// Classe derivada (subclasse) que herda da classe Animal
class Cachorro extends Animal {
  // O construtor chama o construtor da classe pai
  Cachorro(String nome) : super(nome);
  
  // Demonstração de adição de novos métodos
  void abanarRabo() {
    print('$nome está abanando o rabo');
  }
}

// Outra subclasse para demonstrar como diferentes classes
// podem herdar da mesma superclasse
class Gato extends Animal {
  Gato(String nome) : super(nome);
  
  void ronronar() {
    print('$nome está ronronando');
  }
}

// Função principal para demonstrar o uso da herança
void main() {
  // Criando uma instância da classe base
  Animal animalGenerico = Animal('Criatura');
  animalGenerico.emitirSom();
  animalGenerico.mover();
  
  print('\n--- Cachorro ---');
  // Criando uma instância da subclasse
  Cachorro meuCachorro = Cachorro('Rex');
  
  // Métodos herdados da classe Animal
  meuCachorro.emitirSom();
  meuCachorro.mover();
  meuCachorro.comer();
  
  // Método específico da classe Cachorro
  meuCachorro.abanarRabo();
  
  print('\n--- Gato ---');
  // Outra subclasse
  Gato meuGato = Gato('Mimi');
  meuGato.emitirSom();
  meuGato.mover();
  meuGato.ronronar();
  
  // Demonstração de como uma variável do tipo da superclasse
  // pode referenciar um objeto de uma subclasse
  print('\n--- Demonstração de tipo ---');
  Animal animal1 = Cachorro('Totó');
  Animal animal2 = Gato('Felix');
  
  // O tipo declarado é Animal, mas o comportamento
  // depende do tipo real do objeto
  animal1.emitirSom(); // Usa a implementação da classe Cachorro
  animal2.emitirSom(); // Usa a implementação da classe Gato
}