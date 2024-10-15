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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  String _resultado = '';

  void _saudar() {
    String nome = _nomeController.text;
    int? idade = int.tryParse(_idadeController.text);

    if (idade != null) {
      String mensagem = 'Olá, $nome! Sua idade é $idade. ';
      mensagem += idade >= 18 ? 'Você é maior de idade.' : 'Você é menor de idade.';
      setState(() {
        _resultado = mensagem;
      });
    } else {
      setState(() {
        _resultado = 'Por favor, insira uma idade válida.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saudação de Idade'),
      ),
      body: Padding(
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
              onPressed: _saudar,
              child: const Text('Saudar'),
            ),
           const SizedBox(height: 20),
            Text(
              _resultado,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
