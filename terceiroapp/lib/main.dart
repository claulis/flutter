import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saudação',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário'),
      ),
      body: const FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();

  void _enviarDados(BuildContext context) {
    String nome = _nomeController.text;
    int? idade = int.tryParse(_idadeController.text);

    if (idade != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(nome: nome, idade: idade),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, insira uma idade válida.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _nomeController,
            decoration: const InputDecoration(labelText: 'Nome'),
          ),
          TextField(
            controller: _idadeController,
            decoration: const InputDecoration(labelText: 'Idade'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _enviarDados(context),
            child: const Text('Enviar'),
          ),
        ],
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final String nome;
  final int idade;

  const ResultPage({super.key, required this.nome, required this.idade});

  @override
  Widget build(BuildContext context) {
    String mensagem =
        'Olá, $nome! Sua idade é $idade. ${idade >= 18 ? 'Você é maior de idade.' : 'Você é menor de idade.'}';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              mensagem,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
