// polimorfismo.dart
// Demonstração de polimorfismo em Dart

// Classe base para demonstração de polimorfismo
abstract class Forma {
  // Métodos abstratos que devem ser implementados pelas subclasses
  double calcularArea();
  double calcularPerimetro();
  
  // Método concreto que pode ser usado por todas as subclasses
  void exibirInformacoes() {
    print('Área: ${calcularArea()}');
    print('Perímetro: ${calcularPerimetro()}');
  }
}

class Circulo extends Forma {
  double raio;
  
  Circulo(this.raio);
  
  @override
  double calcularArea() {
    return 3.14 * raio * raio;
  }
  
  @override
  double calcularPerimetro() {
    return 2 * 3.14 * raio;
  }
  
  @override
  void exibirInformacoes() {
    print('--- Círculo ---');
    print('Raio: $raio');
    super.exibirInformacoes();
  }
}

class Retangulo extends Forma {
  double largura;
  double altura;
  
  Retangulo(this.largura, this.altura);
  
  @override
  double calcularArea() {
    return largura * altura;
  }
  
  @override
  double calcularPerimetro() {
    return 2 * (largura + altura);
  }
  
  @override
  void exibirInformacoes() {
    print('--- Retângulo ---');
    print('Largura: $largura');
    print('Altura: $altura');
    super.exibirInformacoes();
  }
}

class Quadrado extends Retangulo {
  // Reutilizando a implementação de Retangulo com lado = largura = altura
  Quadrado(double lado) : super(lado, lado);
  
  @override
  void exibirInformacoes() {
    print('--- Quadrado ---');
    print('Lado: $largura');
    print('Área: ${calcularArea()}');
    print('Perímetro: ${calcularPerimetro()}');
  }
}

class Triangulo extends Forma {
  double lado1;
  double lado2;
  double lado3;
  
  Triangulo(this.lado1, this.lado2, this.lado3);
  
  @override
  double calcularArea() {
    // Usando a fórmula de Heron para a área do triângulo
    double s = (lado1 + lado2 + lado3) / 2;
    return sqrt(s * (s - lado1) * (s - lado2) * (s - lado3));
  }
  
  // Implementação simplificada da raiz quadrada para exemplo
  double sqrt(double valor) {
    return double.parse((valor * valor).toStringAsFixed(2));
  }
  
  @override
  double calcularPerimetro() {
    return lado1 + lado2 + lado3;
  }
  
  @override
  void exibirInformacoes() {
    print('--- Triângulo ---');
    print('Lados: $lado1, $lado2, $lado3');
    super.exibirInformacoes();
  }
}

// Exemplo de interface para demonstrar polimorfismo de interface
abstract class Desenhavel {
  void desenhar();
}

// Implementação de interface
class FormaDesenhavel extends Forma implements Desenhavel {
  String cor;
  
  FormaDesenhavel(this.cor);
  
  @override
  double calcularArea() {
    return 0; // Implementação genérica
  }
  
  @override
  double calcularPerimetro() {
    return 0; // Implementação genérica
  }
  
  @override
  void desenhar() {
    print('Desenhando forma na cor $cor');
  }
}

class CirculoDesenhavel extends Circulo implements Desenhavel {
  String cor;
  
  CirculoDesenhavel(double raio, this.cor) : super(raio);
  
  @override
  void desenhar() {
    print('Desenhando círculo de raio $raio na cor $cor');
  }
}

// Funções que demonstram polimorfismo
void exibirForma(Forma forma) {
  // Esta função pode receber qualquer objeto que seja uma Forma
  print('\nProcessando forma...');
  forma.exibirInformacoes();
}

void desenharObjeto(Desenhavel objeto) {
  // Esta função pode receber qualquer objeto que implemente Desenhavel
  objeto.desenhar();
}

// Exemplo de polimorfismo paramétrico (genéricos)
class Recipiente<T> {
  T valor;
  
  Recipiente(this.valor);
  
  T obterValor() {
    return valor;
  }
  
  void definirValor(T novoValor) {
    valor = novoValor;
  }
  
  String getTipo() {
    return valor.runtimeType.toString();
  }
}

void main() {
  print('--- Demonstração de Polimorfismo ---\n');
  
  // Criando instâncias de diferentes formas
  Circulo circulo = Circulo(5);
  Retangulo retangulo = Retangulo(4, 6);
  Quadrado quadrado = Quadrado(3);
  Triangulo triangulo = Triangulo(3, 4, 5);
  
  // Lista de formas diferentes - demonstra polimorfismo
  List<Forma> formas = [circulo, retangulo, quadrado, triangulo];
  
  // Iterando pela lista e chamando métodos - cada forma responde de acordo com sua implementação
  for (var forma in formas) {
    exibirForma(forma);
  }
  
  print('\n--- Polimorfismo de Interface ---');
  CirculoDesenhavel circuloColorido = CirculoDesenhavel(7, 'azul');
  FormaDesenhavel formaGenerica = FormaDesenhavel('verde');
  
  // Lista de objetos desenháveis
  List<Desenhavel> desenhaveis = [circuloColorido, formaGenerica];
  
  // Iterando pela lista e chamando o método desenhar
  for (var desenhavel in desenhaveis) {
    desenharObjeto(desenhavel);
  }
  
  // Polimorfismo com o tipo específico e a superclasse
  print('\n--- Polimorfismo com Referências ---');
  Forma formaCirculo = Circulo(10);  // Referência do tipo Forma apontando para um Circulo
  formaCirculo.exibirInformacoes();  // Chama a implementação do Circulo
  
  // Polimorfismo paramétrico (genéricos)
  print('\n--- Polimorfismo Paramétrico ---');
  Recipiente<int> recipienteInt = Recipiente<int>(42);
  Recipiente<String> recipienteString = Recipiente<String>('Olá, Mundo!');
  Recipiente<Circulo> recipienteCirculo = Recipiente<Circulo>(Circulo(8));
  
  print('Recipiente Int: ${recipienteInt.obterValor()} (${recipienteInt.getTipo()})');
  print('Recipiente String: ${recipienteString.obterValor()} (${recipienteString.getTipo()})');
  print('Recipiente Circulo: ${recipienteCirculo.obterValor().raio} (${recipienteCirculo.getTipo()})');
  
  // Resumo das aplicações de polimorfismo demonstradas
  print('\n--- Resumo das Aplicações de Polimorfismo ---');
  print('1. Polimorfismo de Subtipo: objetos de diferentes subclasses tratados como a superclasse');
  print('2. Polimorfismo de Interface: objetos de diferentes classes que implementam a mesma interface');
  print('3. Polimorfismo Paramétrico: uso de genéricos para trabalhar com diferentes tipos');
}