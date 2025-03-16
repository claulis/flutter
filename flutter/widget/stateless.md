# Stateless Widget

Aqui está uma lista de alguns dos principais **Stateless Widgets** disponíveis no Flutter, 
que não mantêm estado e são utilizados para construir interfaces de usuário de forma eficiente:

## Lista de Stateless Widgets

1. **Text**
   - Exibe uma string de texto na tela.
   ```dart
   Text('Olá, Mundo!')
   ```

2. **Icon**
   - Exibe um ícone gráfico.
   ```dart
   Icon(Icons.favorite, color: Colors.red)
   ```

3. **Image**
   - Exibe uma imagem a partir de uma fonte local ou da web.
   ```dart
   Image.asset('assets/imagem.png')
   ```

4. **Container**
   - Um contêiner que pode conter outros widgets e aplicar estilos como margens, preenchimento e bordas.
   ```dart
   Container(
     padding: EdgeInsets.all(16.0),
     color: Colors.blue,
     child: Text('Dentro do Container'),
   )
   ```

5. **Row**
   - Organiza seus filhos em uma linha horizontal.
   ```dart
   Row(
     children: <Widget>[
       Icon(Icons.star),
       Text('Estrela'),
     ],
   )
   ```

6. **Column**
   - Organiza seus filhos em uma coluna vertical.
   ```dart
   Column(
     children: <Widget>[
       Text('Linha 1'),
       Text('Linha 2'),
     ],
   )
   ```

7. **Scaffold**
   - Fornece uma estrutura básica para a aplicação, incluindo AppBar, Drawer e BottomNavigationBar.
   ```dart
   Scaffold(
     appBar: AppBar(title: Text('Título')),
     body: Center(child: Text('Corpo da Página')),
   )
   ```
   [Aqui](https://github.com/claulis/flutter/blob/main/widget/scaffold.md) para mais informações sobre Scaffold

8. **AppBar**
   - Uma barra de aplicativos que pode incluir título, ícones e ações.
   ```dart
   AppBar(
     title: Text('Meu App'),
     actions: <Widget>[
       IconButton(icon: Icon(Icons.settings), onPressed: () {}),
     ],
   )
   ```

9. **FlatButton** (ou `TextButton` em versões mais recentes)
   - Um botão que não tem bordas visíveis.
   ```dart
   TextButton(
     onPressed: () {},
     child: Text('Clique Aqui'),
   )
   ```

10. **RaisedButton** (ou `ElevatedButton` em versões mais recentes)
    - Um botão elevado que se destaca do fundo.
    ```dart
    ElevatedButton(
      onPressed: () {},
      child: Text('Botão Elevado'),
    )
    ```

11. **Card**
    - Um widget que representa um cartão com sombra e arredondamento.
    ```dart
    Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('Este é um cartão!'),
      ),
    )
    ```

12. **ListTile**
    - Um item de lista que pode conter ícone, título e subtítulo.
    ```dart
    ListTile(
      leading: Icon(Icons.access_alarm),
      title: Text('Título do Item'),
      subtitle: Text('Subtítulo do Item'),
    )
    ```

13. **Divider**
    - Uma linha horizontal que pode ser usada para separar itens em uma lista.
    ```dart
    Divider(color: Colors.grey)
    ```

14. **SafeArea**
    - Um widget que ajusta seu conteúdo para evitar áreas como entalhes e barras de status.
    ```dart
    SafeArea(
      child: Text('Conteúdo seguro!'),
    )
    ```

15. **FutureBuilder**
    - Um widget que constrói sua interface com base no resultado de uma operação assíncrona.
    ```dart
    FutureBuilder<String>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erro: ${snapshot.error}');
        } else {
          return Text('Dados: ${snapshot.data}');
        }
      },
    )
    ```
## Exemplo de projeto
Para criar um **Stateless Widget** em Dart usando o Flutter, você precisa seguir algumas etapas básicas. Um Stateless Widget é um widget que não muda seu estado após ser construído. Isso significa que ele é imutável e é ideal para exibir informações que não precisam ser alteradas durante a execução do aplicativo.

### Exemplo de Stateless Widget

Exemplo simples de um aplicativo Flutter que utiliza um Stateless Widget para exibir uma mensagem na tela.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo de Stateless Widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Este é um App'),
        ),
        body: Center(
          child: BemVindoWidget(), // Chama o Stateless Widget
        ),
      ),
    );
  }
}

// Definindo o Stateless Widget
class BemVindoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Olá, bem-vindo ao Flutter!',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}
```

### Explicação do Código

1. **Importação do Pacote**:
   - `import 'package:flutter/material.dart';`: Importa o pacote Material Design do Flutter, que contém os widgets necessários.

2. **Função `main()`**:
   - A função `main` é o ponto de entrada da aplicação. Ela chama `runApp`, passando a instância do `MyApp`.

3. **Classe `MyApp`**:
   - É um **Stateless Widget** que configura o tema da aplicação. O método `build` retorna um `MaterialApp` com um `Scaffold` que contém uma barra de aplicativos (`AppBar`) e um corpo centralizado.
   - O método build(BuildContext context) é uma função que faz parte da classe de um widget, seja ele um StatelessWidget ou um StatefulWidget. Este método é chamado sempre que o Flutter precisa renderizar ou atualizar a interface do usuário. Ele recebe um objeto BuildContext como argumento, que fornece informações sobre a localização do widget na árvore de widgets.
     - Função do Método Build
        - Descrever a Interface: O método build retorna uma nova árvore de widgets que descreve como a interface deve ser apresentada com base no estado atual do widget.
        - Atualização Dinâmica: Sempre que há uma mudança de estado ou quando o Flutter precisa redesenhar a interface, o método build é chamado novamente, permitindo que o widget atualize sua aparência conforme necessário.
        - Acesso ao Contexto: O BuildContext permite que o widget acesse informações sobre sua posição na árvore de widgets e interaja com outros widgets, como acessar temas ou dados de configuração.
     
4. **Classe `GreetingWidget`**:
   - Este é o nosso **Stateless Widget**. O método `build` retorna um widget `Text` que exibe uma mensagem de saudação.

### Como Executar

1. Certifique-se de ter o Flutter instalado em seu ambiente.
2. Crie um novo projeto Flutter usando o comando:
   ```bash
   flutter create stateless_app
   ```
3. Substitua o conteúdo do arquivo `lib/main.dart` pelo código acima.
4. Execute o aplicativo usando:
   ```bash
   flutter run
   ```

