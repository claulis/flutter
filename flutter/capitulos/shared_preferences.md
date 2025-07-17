# SharedPreferences

O **SharedPreferences** é uma biblioteca do Flutter que permite ao desenvolvedor armazenar e recuperar dados simples no formato chave-valor de maneira persistente no dispositivo. Ele é adequado para salvar pequenas quantidades de dados, como configurações do usuário, preferências ou estados simples, como uma lista de tarefas. Neste exemplo, o SharedPreferences será utilizado para salvar uma lista de tarefas em formato JSON, garantindo que os dados sejam mantidos mesmo após o fechamento do aplicativo. O **Provider** é empregado para gerenciar o estado da lista de tarefas de forma reativa, notificando a interface automaticamente quando ocorrem alterações, o que elimina a necessidade de chamadas manuais a `setState` e torna o código mais organizado e escalável.

## Como funciona o SharedPreferences

O SharedPreferences armazena dados localmente no dispositivo em um formato leve, utilizando arquivos `XML` no Android e `Plist` no iOS. Ele é projetado para ser simples e eficiente, mas não é adequado para grandes volumes de dados ou estruturas complexas. Abaixo estão os principais aspectos do seu funcionamento:

### Armazenamento de dados simples

O SharedPreferences **suporta tipos de dados básicos**: `int, double, bool, String e List<String>`.
Os dados são salvos como pares *chave-valor*, onde a chave é uma string que identifica o dado, e o valor é o dado em si.

Exemplo: Salvar o tema escolhido pelo usuário como "theme": "dark".

### Persistência

Os dados são salvos no **armazenamento interno** do dispositivo e **persistem até serem explicitamente removidos ou o aplicativo ser desinstalado**.
Isso permite que configurações ou estados sejam recuperados quando o aplicativo é reiniciado.

### Acesso assíncrono

O SharedPreferences opera de forma assíncrona, utilizando Future para acessar ou modificar dados.
Para usá-lo, o desenvolvedor deve obter uma instância de SharedPreferences com `SharedPreferences.getInstance()`.

### Serialização para dados complexos

Embora o SharedPreferences suporte apenas tipos básicos, o desenvolvedor pode serializar objetos complexos (como listas ou mapas) em formato *JSON* (como String) para armazenamento.

Exemplo: Uma lista de tarefas pode ser convertida em JSON e salva como uma string.

### Limitações

- Não é adequado para grandes quantidades de dados, pois o acesso a arquivos XML/Plist pode ser lento.
- Não oferece segurança por padrão, então dados sensíveis (como senhas) devem ser evitados ou criptografados.
- Não suporta consultas complexas ou estruturas relacionais (para isso, use bancos de dados como SQLite ou Hive).

## Como o SharedPreferences é implementado

O desenvolvedor utiliza o pacote shared_preferences, que faz parte do ecossistema Flutter.
Abaixo está o fluxo básico de uso:

1. **Obter uma instância**:
O método `SharedPreferences.getInstance()` retorna um objeto SharedPreferences para interação com o armazenamento.

```dart
SharedPreferences prefs = await SharedPreferences.getInstance();
```

2. **Salvar dados**:
Métodos como `setInt, setString, setBool, setDouble ou setStringList` são usados para salvar dados.

```dart
await prefs.setString('username', 'João');
await prefs.setBool('isDarkMode', true);
```

3. **Recuperar dados**:
Métodos como `getInt, getString, getBool, getDouble ou getStringList` recuperam os dados. Se o dado não existir, retorna null (ou um valor padrão, se especificado).

```dart
String? username = prefs.getString('username');
bool? isDarkMode = prefs.getBool('isDarkMode');
```

4. **Remover dados**:
O método remove exclui um par chave-valor.

```dart
await prefs.remove('username');
```

5. **Limpar tudo**:
O método clear remove todos os dados salvos.

```dart
await prefs.clear();
```

## Exemplo de aplicativo

O aplicativo desenvolvido é uma lista de tarefas com as seguintes funcionalidades:

- Adicionar novas tarefas por meio de um campo de texto.
- Marcar ou desmarcar tarefas como concluídas usando um checkbox.
- Persistir as tarefas no dispositivo com SharedPreferences.
- Gerenciar o estado da lista de tarefas com o Provider.

```dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const TaskScreen(),
    );
  }
}

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  TaskProvider() {
    _loadTasks();
  }

  // Carrega as tarefas salvas no SharedPreferences
  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksJson = prefs.getString('tasks');
    if (tasksJson != null) {
      final List<dynamic> decodedTasks = jsonDecode(tasksJson);
      _tasks = decodedTasks.map((task) => Task.fromJson(task)).toList();
    }
    notifyListeners();
  }

  // Salva as tarefas no SharedPreferences
  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = jsonEncode(_tasks.map((task) => task.toJson()).toList());
    await prefs.setString('tasks', tasksJson);
  }

  // Adiciona uma nova tarefa à lista
  void addTask(String title) {
    _tasks.add(Task(title: title, isCompleted: false));
    _saveTasks();
    notifyListeners();
  }

  // Alterna o estado de conclusão de uma tarefa
  void toggleTaskCompletion(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    _saveTasks();
    notifyListeners();
  }
}

class Task {
  String title;
  bool isCompleted;

  Task({required this.title, required this.isCompleted});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isCompleted': isCompleted,
    };
  }
}

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Lista de Tarefas'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      labelText: 'Nova Tarefa',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        taskProvider.addTask(value);
                        controller.clear();
                      }
                    },
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      taskProvider.addTask(controller.text);
                      controller.clear();
                    }
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          Expanded(
            child: taskProvider.tasks.isEmpty
                ? const Center(child: Text('Nenhuma tarefa adicionada!'))
                : ListView.builder(
                    itemCount: taskProvider.tasks.length,
                    itemBuilder: (context, index) {
                      final task = taskProvider.tasks[index];
                      return ListTile(
                        leading: Checkbox(
                          value: task.isCompleted,
                          onChanged: (value) {
                            taskProvider.toggleTaskCompletion(index);
                          },
                        ),
                        title: Text(
                          task.title,
                          style: TextStyle(
                            decoration: task.isCompleted
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
```

## Configuração e execução do aplicativo

Para configurar e executar o aplicativo, o desenvolvedor deve seguir os passos abaixo:

1. **Criar um novo projeto Flutter**:
   - Executar o comando `flutter create task_list_app` no terminal.
   - Substituir o conteúdo do arquivo `lib/main.dart` pelo código fornecido.

2. **Adicionar dependências**:
   - Abrir o arquivo `pubspec.yaml` e incluir as seguintes dependências:

     ```yaml
     dependencies:
       flutter:
         sdk: flutter
       shared_preferences: ^2.2.3
       provider: ^6.1.2
     ```

   - Executar `flutter pub get` para instalar os pacotes.

3. **Executar o aplicativo**:
   - Conectar um dispositivo ou emulador e executar `flutter run`.

### Funcionalidades do aplicativo

O aplicativo oferece as seguintes funcionalidades:

- **Adição de tarefas**: O usuário pode inserir uma nova tarefa em um campo de texto e adicioná-la à lista ao pressionar "Enter" ou clicar no botão de adição.
- **Marcação de tarefas como concluídas**: Cada tarefa possui um checkbox que permite ao usuário marcá-la como concluída ou não, com tarefas concluídas exibindo um texto riscado.
- **Persistência de dados**: As tarefas são salvas automaticamente no SharedPreferences em formato JSON e carregadas ao iniciar o aplicativo.
- **Gerenciamento de estado com Provider**: O estado da lista de tarefas é gerenciado pelo `TaskProvider`, que notifica a interface sempre que há alterações, garantindo uma atualização reativa.

### Quando usar SharedPreferences neste contexto

O SharedPreferences é ideal para:

- Armazenar listas pequenas, como as tarefas neste exemplo.
- Salvar configurações ou estados que precisam persistir entre sessões.
- Situações em que a simplicidade é prioritária em relação ao desempenho com grandes volumes de dados.

### Limitações

O SharedPreferences não é adequado para:

- Grandes quantidades de dados, devido à sua limitação de desempenho.
- Dados complexos ou estruturados, onde bancos de dados como SQLite ou Hive são mais apropriados.
- Dados sensíveis sem criptografia, pois o SharedPreferences não oferece segurança por padrão.
