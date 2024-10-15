# segundoapp

Este código cria um aplicativo simples que coleta o nome e a idade do usuário, exibe uma mensagem de saudação e informa se a idade é maior ou menor de 18 anos. É um exemplo básico de como usar `StatefulWidget`, `TextField` e manipulação de estado no Flutter.

```dart
import 'package:flutter/material.dart';
```
- **Importação do Flutter**: Esta linha importa a biblioteca principal do Flutter, que contém widgets e temas para a construção de interfaces de usuário.

```dart
void main() {
  runApp(const MyApp());
}
```
- **Função principal**: `main()` é o ponto de entrada do aplicativo.
- **`runApp`**: Esta função inicializa o aplicativo Flutter. Aqui, estamos passando uma instância constante de `MyApp`.

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});
```
- **Definição da classe `MyApp`**: Esta classe estende `StatelessWidget`, o que significa que ela não tem estado interno e não muda após a construção.
- **Construtor**: `const MyApp({super.key})` permite a criação de uma instância constante. O parâmetro `key` é usado para identificar widgets de forma única.

```dart
  @override
  Widget build(BuildContext context) {
```
- **Sobrescrita do método `build`**: Este método descreve a interface do widget. Ele é chamado sempre que o widget precisa ser reconstruído.

```dart
    return MaterialApp(
```
- **MaterialApp**: Este widget é a raiz do aplicativo. Ele fornece a estrutura básica, incluindo temas e navegação.

```dart
      title: 'Saudação',
```
- **Título do aplicativo**: Define o título que pode ser mostrado em algumas interfaces, como na barra de título do sistema.

```dart
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
```
- **Tema do aplicativo**: Aqui, definimos o tema do aplicativo. `primarySwatch` define a cor primária que será usada em diversos widgets.

```dart
      home: const HomePage(),
```
- **Página inicial**: Especifica o widget que será exibido como a página inicial do aplicativo. Neste caso, é uma instância constante de `HomePage`.

```dart
class HomePage extends StatefulWidget {
  const HomePage({super.key});
```
- **Classe `HomePage`**: Esta classe estende `StatefulWidget`, o que significa que ela pode manter estado interno.
- **Construtor**: Similar ao anterior, permite que a classe `HomePage` seja criada como uma instância constante.

```dart
  @override
  _HomePageState createState() => _HomePageState();
}
```
- **Criação do estado**: O método `createState` retorna uma nova instância da classe `_HomePageState`, que gerenciará o estado da `HomePage`.

```dart
class _HomePageState extends State<HomePage> {
```
- **Classe de estado**: `_HomePageState` é a classe que contém o estado da `HomePage`.

```dart
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
```
- **Controladores de texto**: `TextEditingController` é usado para capturar o texto inserido nos campos de entrada. Aqui, temos um controlador para o nome e outro para a idade.

```dart
  String _resultado = '';
```
- **Variável de resultado**: `_resultado` armazenará a mensagem que será exibida após o botão ser pressionado.

```dart
  void _saudar() {
```
- **Método `_saudar`**: Este método é chamado quando o botão é pressionado. Ele processa a entrada do usuário.

```dart
    String nome = _nomeController.text;
    int? idade = int.tryParse(_idadeController.text);
```
- **Captura de entrada**: Lê o texto dos controladores. A idade é convertida para um inteiro; se a conversão falhar, `idade` será `null`.

```dart
    if (idade != null) {
```
- **Verificação de validade**: Confere se a idade é um número válido.

```dart
      String mensagem = 'Olá, $nome! Sua idade é $idade. ';
```
- **Criação da mensagem**: Gera uma mensagem de saudação usando interpolação de strings.

```dart
      mensagem += idade >= 18 ? 'Você é maior de idade.' : 'Você é menor de idade.';
```
- **Avaliação condicional**: Adiciona uma parte à mensagem com base na idade do usuário.

```dart
      setState(() {
        _resultado = mensagem;
      });
```
- **Atualização do estado**: `setState` notifica o Flutter que o estado mudou, fazendo com que a interface seja reconstruída com a nova mensagem.

```dart
    } else {
      setState(() {
        _resultado = 'Por favor, insira uma idade válida.';
      });
    }
  }
```
- **Tratamento de erro**: Se a idade não for válida, uma mensagem de erro é exibida.

```dart
  @override
  Widget build(BuildContext context) {
```
- **Sobrescrita do método `build`**: Define como a interface do widget será construída.

```dart
    return Scaffold(
```
- **Scaffold**: Fornece a estrutura visual básica do aplicativo, como AppBar e corpo.

```dart
      appBar: AppBar(
        title: const Text('Saudação de Idade'),
      ),
```
- **AppBar**: Um cabeçalho que contém o título do aplicativo.

```dart
      body: Padding(
        padding: const EdgeInsets.all(16.0),
```
- **Corpo do Scaffold**: O conteúdo principal do aplicativo. O `Padding` adiciona um espaço em torno dos widgets.

```dart
        child: Column(
          children: [
```
- **Column**: Um widget que organiza seus filhos em uma coluna vertical.

```dart
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
```
- **Campo de texto para o nome**: Um `TextField` para o usuário inserir seu nome. `controller` conecta o campo ao controlador de texto.

```dart
            TextField(
              controller: _idadeController,
              decoration: const InputDecoration(labelText: 'Idade'),
              keyboardType: TextInputType.number,
            ),
```
- **Campo de texto para a idade**: Um `TextField` similar para a idade, que permite apenas a entrada de números.

```dart
            const SizedBox(height: 20),
```
- **Espaço vertical**: Um `SizedBox` para adicionar um espaço de 20 pixels entre os widgets.

```dart
            ElevatedButton(
              onPressed: _saudar,
              child: const Text('Saudar'),
            ),
```
- **Botão**: Um botão elevado que chama o método `_saudar` quando pressionado.

```dart
           const SizedBox(height: 20),
```
- **Outro espaço vertical**: Um `SizedBox` para separar o botão do texto de resultado.

```dart
            Text(
              _resultado,
              style: const TextStyle(fontSize: 18),
            ),
```
- **Texto de resultado**: Um widget `Text` que exibe a mensagem de saudação ou erro, com um tamanho de fonte de 18.

```dart
          ],
        ),
      ),
    );
  }
}
```
- **Fechamento de widgets**: Aqui, os widgets `Column`, `Padding`, `Scaffold` e `MaterialApp` são fechados, completando a definição da interface do aplicativo.

### Resumo


