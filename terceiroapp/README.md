# terceiroapp


### Resumo do Fluxo do Aplicativo

1. O aplicativo inicia na `MyApp`, que exibe a `HomePage`.
2. A `HomePage` apresenta um formulário (`FormPage`) onde o usuário pode inserir seu nome e idade.
3. Ao pressionar "Enviar", o aplicativo verifica se a idade é válida e, se for, navega para a `ResultPage`, que mostra uma mensagem com as informações inseridas.
4. O usuário pode retornar à `FormPage` pressionando "Voltar".

### Estrutura do Código

1. **Importação do Pacote**:
   ```dart
   import 'package:flutter/material.dart';
   ```
   Aqui, estamos importando o pacote principal do Flutter, que nos permite utilizar widgets e outras funcionalidades.

2. **Função Principal**:
   ```dart
   void main() {
     runApp(const MyApp());
   }
   ```
   A função `main()` é o ponto de entrada do aplicativo. Ela chama `runApp()` com uma instância de `MyApp`, que inicia a aplicação.

3. **Classe MyApp**:
   ```dart
   class MyApp extends StatelessWidget {
     const MyApp({super.key});
     ...
   }
   ```
   - `MyApp` é um widget sem estado (`StatelessWidget`), que significa que não gerencia estado interno.
   - O método `build()` retorna um `MaterialApp`, definindo o título e o tema do aplicativo.

4. **Classe HomePage**:
   ```dart
   class HomePage extends StatelessWidget {
     const HomePage({super.key});
     ...
   }
   ```
   - `HomePage` também é um widget sem estado.
   - O método `build()` retorna um `Scaffold`, que é a estrutura básica para uma tela no Flutter, contendo uma `AppBar` e um corpo que exibe o `FormPage`.

5. **Classe FormPage**:
   ```dart
   class FormPage extends StatefulWidget {
     const FormPage({super.key});
     ...
   }
   ```
   - `FormPage` é um widget com estado (`StatefulWidget`), pois precisa gerenciar a entrada de dados do usuário.
   - A classe `_FormPageState` mantém o estado da `FormPage` e contém controladores de texto para os campos de entrada.

6. **Método _enviarDados**:
   ```dart
   void _enviarDados(BuildContext context) {
     ...
   }
   ```
   Este método é chamado quando o usuário pressiona o botão "Enviar". Ele captura os valores dos campos de texto, verifica se a idade é válida e, se for, navega para a `ResultPage`.

7. **Método build() de FormPage**:
   ```dart
   @override
   Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.all(16.0),
       child: Column(
         ...
       ),
     );
   }
   ```
   Este método constrói a interface da `FormPage`, que inclui:
   - Dois campos de texto (para nome e idade).
   - Um botão que chama `_enviarDados` ao ser pressionado.

8. **Classe ResultPage**:
   ```dart
   class ResultPage extends StatelessWidget {
     final String nome;
     final int idade;
     ...
   }
   ```
   - `ResultPage` é um widget sem estado que recebe o nome e a idade como parâmetros.
   - O método `build()` exibe uma mensagem personalizada e um botão para retornar à página anterior.



