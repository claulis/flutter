// static_members.dart

// Classe com membros estáticos (constantes, propriedades e métodos)
class MathUtils {
  // Constantes estáticas
  static const double PI = 3.14159265359;
  static const double E = 2.71828182846;
  
  // Impede a instanciação da classe
  MathUtils._();
  
  // Métodos estáticos
  static double calcularAreaCirculo(double raio) {
    return PI * raio * raio;
  }
  
  static double calcularCircunferenciaCirculo(double raio) {
    return 2 * PI * raio;
  }
  
  static double calcularAreaRetangulo(double largura, double altura) {
    return largura * altura;
  }
  
  static double calcularPerimetroRetangulo(double largura, double altura) {
    return 2 * (largura + altura);
  }
  
  // Métodos estáticos mais complexos
  static double calcularDistancia(double x1, double y1, double x2, double y2) {
    final dx = x2 - x1;
    final dy = y2 - y1;
    return sqrt(dx * dx + dy * dy);
  }
  
  // Implementação simples de raiz quadrada usando o método de Newton
  static double sqrt(double x) {
    if (x < 0) throw ArgumentError('Não é possível calcular raiz quadrada de número negativo');
    if (x == 0) return 0;
    
    double estimativa = x / 2;
    
    for (int i = 0; i < 10; i++) {
      estimativa = (estimativa + x / estimativa) / 2;
    }
    
    return estimativa;
  }
}

// Classe com propriedades estáticas e singleton
class ConfiguracaoApp {
  // Propriedades estáticas
  static String versao = '1.0.0';
  static String ambiente = 'desenvolvimento';
  static bool modoDebug = true;
  static final Map<String, dynamic> _configuracoes = {};
  
  // Singleton (instância única)
  static final ConfiguracaoApp _instancia = ConfiguracaoApp._();
  
  // Construtor privado
  ConfiguracaoApp._();
  
  // Getter para acessar a instância
  static ConfiguracaoApp get instancia => _instancia;
  
  // Métodos para gerenciar configurações
  static void definirConfiguracao(String chave, dynamic valor) {
    _configuracoes[chave] = valor;
  }
  
  static dynamic obterConfiguracao(String chave) {
    return _configuracoes[chave];
  }
  
  static bool contemConfiguracao(String chave) {
    return _configuracoes.containsKey(chave);
  }
  
  static void redefinirConfiguracoes() {
    _configuracoes.clear();
  }
  
  // Método estático para alternar modo de depuração
  static void alternarModoDebug() {
    modoDebug = !modoDebug;
  }
  
  // Método não estático na instância
  void inicializar({String? ambiente}) {
    if (ambiente != null) {
      ConfiguracaoApp.ambiente = ambiente;
    }
    
    print('Aplicação inicializada no ambiente ${ConfiguracaoApp.ambiente}');
  }
}

// Classe com contador estático
class Usuario {
  // Contador estático para gerar IDs únicos
  static int _contadorId = 0;
  
  // Propriedades da instância
  final int id;
  final String nome;
  final String email;
  
  // Construtor que utiliza o contador estático
  Usuario(this.nome, this.email) : id = ++_contadorId;
  
  // Construtor nomeado para criar usuário admin
  factory Usuario.admin(String nome, String email) {
    Usuario admin = Usuario(nome, email);
    // Registro de ação de administrador
    _registrarAcaoAdmin('Criação de usuário administrador: ${admin.id}');
    return admin;
  }
  
  // Método estático privado para registro
  static void _registrarAcaoAdmin(String mensagem) {
    print('[ADMIN] $mensagem (${DateTime.now()})');
  }
  
  // Método estático para obter total de usuários criados
  static int obterTotalUsuarios() {
    return _contadorId;
  }
  
  @override
  String toString() => 'Usuario(id: $id, nome: $nome, email: $email)';
}

// Classe com métodos de fábrica estáticos
class Cor {
  final int r;
  final int g;
  final int b;
  final int a;
  
  // Construtor
  Cor(this.r, this.g, this.b, [this.a = 255]) {
    _validarValores();
  }
  
  // Método de validação
  void _validarValores() {
    if (r < 0 || r > 255 || g < 0 || g > 255 || b < 0 || b > 255 || a < 0 || a > 255) {
      throw ArgumentError('Valores de cor devem estar entre 0 e 255');
    }
  }
  
  // Cores predefinidas (como propriedades estáticas)
  static  Cor preto = Cor(0, 0, 0);
  static  Cor branco = Cor(255, 255, 255);
  static  Cor vermelho = Cor(255, 0, 0);
  static  Cor verde = Cor(0, 255, 0);
  static  Cor azul = Cor(0, 0, 255);
  static  Cor amarelo = Cor(255, 255, 0);
  static  Cor magenta = Cor(255, 0, 255);
  static  Cor ciano = Cor(0, 255, 255);
  static  Cor transparente = Cor(0, 0, 0, 0);
  
  // Método estático de fábrica para criar cor a partir de string hexadecimal
  static Cor fromHex(String hexString) {
    // Remove # se presente
    final hex = hexString.startsWith('#') ? hexString.substring(1) : hexString;
    
    if (hex.length != 6 && hex.length != 8) {
      throw ArgumentError('Formato hexadecimal inválido. Use "RRGGBB" ou "RRGGBBAA"');
    }
    
    final r = int.parse(hex.substring(0, 2), radix: 16);
    final g = int.parse(hex.substring(2, 4), radix: 16);
    final b = int.parse(hex.substring(4, 6), radix: 16);
    final a = hex.length == 8 ? int.parse(hex.substring(6, 8), radix: 16) : 255;
    
    return Cor(r, g, b, a);
  }
  
  // Método estático para criar uma cor a partir de outro espaço de cor (HSL)
  static Cor fromHSL(double h, double s, double l) {
    // Garante que h está no intervalo [0, 360)
    h = h % 360;
    
    // Garante que s e l estão no intervalo [0, 1]
    s = s.clamp(0.0, 1.0);
    l = l.clamp(0.0, 1.0);
    
    // Implementação simplificada da conversão HSL para RGB
    final c = (1 - (2 * l - 1).abs()) * s;
    final x = c * (1 - ((h / 60) % 2 - 1).abs());
    final m = l - c / 2;
    
    double r = 0, g = 0, b = 0;
    
    if (h < 60) {
      r = c; g = x; b = 0;
    } else if (h < 120) {
      r = x; g = c; b = 0;
    } else if (h < 180) {
      r = 0; g = c; b = x;
    } else if (h < 240) {
      r = 0; g = x; b = c;
    } else if (h < 300) {
      r = x; g = 0; b = c;
    } else {
      r = c; g = 0; b = x;
    }
    
    return Cor(
      ((r + m) * 255).round(),
      ((g + m) * 255).round(),
      ((b + m) * 255).round()
    );
  }
  
  // Método estático para criar cor aleatória
  static Cor aleatoria() {
    // Simulação simplificada de números aleatórios
    final now = DateTime.now().millisecondsSinceEpoch;
    final r = (now % 255);
    final g = ((now ~/ 255) % 255);
    final b = ((now ~/ (255 * 255)) % 255);
    
    return Cor(r, g, b);
  }
  
  // Método para obter representação hexadecimal da cor
  String toHex() {
    String rHex = r.toRadixString(16).padLeft(2, '0');
    String gHex = g.toRadixString(16).padLeft(2, '0');
    String bHex = b.toRadixString(16).padLeft(2, '0');
    String aHex = a.toRadixString(16).padLeft(2, '0');
    
    return '#$rHex$gHex$bHex$aHex';
  }
  
  @override
  String toString() => 'Cor(r: $r, g: $g, b: $b, a: $a)';
}

void main() {
  print('---- Membros Estáticos em MathUtils ----');
  
  // Usando constantes estáticas
  print('Valor de π: ${MathUtils.PI}');
  print('Valor de e: ${MathUtils.E}');
  
  // Usando métodos estáticos
  final raio = 5.0;
  print('Área do círculo com raio $raio: ${MathUtils.calcularAreaCirculo(raio)}');
  print('Circunferência do círculo com raio $raio: ${MathUtils.calcularCircunferenciaCirculo(raio)}');
  
  final largura = 10.0;
  final altura = 7.0;
  print('Área do retângulo $largura x $altura: ${MathUtils.calcularAreaRetangulo(largura, altura)}');
  
  final x1 = 0.0, y1 = 0.0, x2 = 3.0, y2 = 4.0;
  print('Distância entre pontos ($x1,$y1) e ($x2,$y2): ${MathUtils.calcularDistancia(x1, y1, x2, y2)}');
  
  // Método de raiz quadrada personalizado
  print('Raiz quadrada de 16: ${MathUtils.sqrt(16)}');
  
  print('\n---- Configuração do App (Singleton e Propriedades Estáticas) ----');
  
  // Acessando propriedades estáticas
  print('Versão da aplicação: ${ConfiguracaoApp.versao}');
  print('Ambiente: ${ConfiguracaoApp.ambiente}');
  print('Modo debug: ${ConfiguracaoApp.modoDebug ? "Ativado" : "Desativado"}');
  
  // Alterando propriedades estáticas
  ConfiguracaoApp.ambiente = 'produção';
  ConfiguracaoApp.alternarModoDebug();
  
  print('Novo ambiente: ${ConfiguracaoApp.ambiente}');
  print('Modo debug atualizado: ${ConfiguracaoApp.modoDebug ? "Ativado" : "Desativado"}');
  
  // Definindo configurações
  ConfiguracaoApp.definirConfiguracao('timeout', 30000);
  ConfiguracaoApp.definirConfiguracao('apiUrl', 'https://api.exemplo.com');
  
  print('Timeout: ${ConfiguracaoApp.obterConfiguracao("timeout")}');
  print('URL da API: ${ConfiguracaoApp.obterConfiguracao("apiUrl")}');
  
  // Usando a instância singleton
  final config = ConfiguracaoApp.instancia;
  config.inicializar(ambiente: 'homologação');
  
  print('\n---- Contador Estático em Usuário ----');
  
  // Criando usuários com IDs incrementais
  final usuario1 = Usuario('Alice', 'alice@example.com');
  final usuario2 = Usuario('Bob', 'bob@example.com');
  final admin = Usuario.admin('Admin', 'admin@example.com');
  
  print(usuario1);
  print(usuario2);
  print(admin);
  
  // Verificando o total de usuários criados
  print('Total de usuários criados: ${Usuario.obterTotalUsuarios()}');
  
  print('\n---- Métodos de Fábrica Estáticos em Cor ----');
  
  // Usando constantes de cor
  print('Cor preta: ${Cor.preto}');
  print('Cor vermelha: ${Cor.vermelho}');
  
  // Usando métodos de fábrica estáticos
  try {
    final corHex = Cor.fromHex('#1a2b3c');
    print('Cor do hexadecimal #1a2b3c: $corHex');
    print('Hexadecimal: ${corHex.toHex()}');
    
    final corHSL = Cor.fromHSL(240, 1.0, 0.5); // Azul em HSL
    print('Cor HSL (240, 1.0, 0.5): $corHSL');
    print('Hexadecimal: ${corHSL.toHex()}');
    
    final corAleatoria = Cor.aleatoria();
    print('Cor aleatória: $corAleatoria');
    print('Hexadecimal: ${corAleatoria.toHex()}');
  } catch (e) {
    print('Erro: $e');
  }
}