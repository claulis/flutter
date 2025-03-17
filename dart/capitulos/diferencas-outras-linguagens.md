# Dart vs Outras Linguagens

## Dart vs JavaScript

### Principais diferenças

| Característica | Dart | JavaScript |
|---------------|------|------------|
| Tipagem | Opcional e estática | Dinâmica (TypeScript adiciona tipagem estática opcional) |
| Compilação | AOT, JIT e para JS | Interpretada (com JIT em engines modernas) |
| Classes | Orientação a objetos completa | Baseada em protótipos (classes adicionadas no ES6) |
| Concorrência | Isolates (sem memória compartilhada) | Single-threaded com event loop (Web Workers separados) |
| Null safety | Integrado à linguagem | Não disponível nativamente (opcional no TypeScript) |
| Ferramentas | Análise estática robusta integrada | Ecossistema de linting separado |

### Pontos fortes do Dart em relação ao JavaScript

- Sistema de tipos mais robusto e consistente
- Melhor desempenho em aplicativos complexos quando compilado nativamente
- Ferramentas de análise estática superiores
- Maior previsibilidade e menos "surpresas" da linguagem
- Melhor suporte para grandes bases de código

### Pontos fortes do JavaScript em relação ao Dart

- Onipresença (roda em qualquer navegador)
- Ecossistema muito maior de bibliotecas
- Não requer processo de compilação para web
- Maior comunidade e mais recursos de aprendizado
- Mais oportunidades de emprego

### Exemplo de código: Busca assíncrona de dados

**JavaScript:**
```javascript
// JavaScript
async function fetchUserData(userId) {
  try {
    const response = await fetch(`https://api.example.com/users/${userId}`);
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    const userData = await response.json();
    return {
      name: userData.name,
      email: userData.email,
      isActive: userData.status === "active"
    };
  } catch (error) {
    console.error("Fetching user data failed:", error);
    return null;
  }
}

// Uso
fetchUserData(123).then(user => {
  if (user) {
    console.log(`User: ${user.name}, Email: ${user.email}`);
  }
});
```

**Dart:**
```dart
// Dart
Future<User?> fetchUserData(int userId) async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/users/$userId'));
    if (response.statusCode != 200) {
      throw HttpException('Failed to load user data: ${response.statusCode}');
    }
    final userData = jsonDecode(response.body);
    return User(
      name: userData['name'],
      email: userData['email'],
      isActive: userData['status'] == 'active',
    );
  } catch (error) {
    print('Fetching user data failed: $error');
    return null;
  }
}

// Uso
void main() async {
  final user = await fetchUserData(123);
  if (user != null) {
    print('User: ${user.name}, Email: ${user.email}');
  }
}

// Classe para tipagem
class User {
  final String name;
  final String email;
  final bool isActive;
  
  User({required this.name, required this.email, required this.isActive});
}
```

---
Vai para:
- [Sumário](https://github.com/claulis/flutter/blob/main/dart/README.md)
- [Próximo capítulo](https://github.com/claulis/flutter/blob/main/dart/capitulos/arquitetura-dart.md)