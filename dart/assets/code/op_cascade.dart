class Pessoa {
  String nome;
  int idade;
  List<String> habilidades = [];
  
  Pessoa(this.nome, this.idade);
  
  void apresentar() {
    print("Meu nome é $nome e tenho $idade anos.");
  }
  
  void fazerAniversario() {
    idade++;
    print("Agora tenho $idade anos!");
  }
  
  void adicionarHabilidade(String habilidade) {
    habilidades.add(habilidade);
    print("Aprendi: $habilidade");
  }
  
  void listarHabilidades() {
    print("Minhas habilidades são: ${habilidades.join(', ')}");
  }
}

void main() {
  print('==== Cascade Operator (..) em Dart ====\n');
  
  print('Sem cascade operator:');
  Pessoa p1 = Pessoa("Ana", 25);
  p1.apresentar();
  p1.fazerAniversario();
  p1.adicionarHabilidade("Programação");
  p1.adicionarHabilidade("Inglês");
  p1.listarHabilidades();
  
  print('\nCom cascade operator:');
  Pessoa p2 = Pessoa("João", 30)
    ..apresentar()
    ..fazerAniversario()
    ..adicionarHabilidade("Desenho")
    ..adicionarHabilidade("Música")
    ..listarHabilidades();
    
  print('\nCom cascade operator e modificando propriedades:');
  Pessoa p3 = Pessoa("Maria", 40)
    ..nome = "Maria Silva"
    ..idade = 41
    ..apresentar()
    ..adicionarHabilidade("Fotografia")
    ..listarHabilidades();
  
  print('\nCom cascade operator em múltiplas linhas:');
  Pessoa p4 = Pessoa("Carlos", 35)
    ..apresentar()
    ..fazerAniversario()
    ..adicionarHabilidade("Natação")
    ..adicionarHabilidade("Cozinhar")
    ..adicionarHabilidade("Direção")
    ..listarHabilidades();
}