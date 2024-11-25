import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title:const Text('Exemplo de Column')),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Primeiro Item', style: TextStyle(fontSize: 24)),
            Text('Segundo Item', style: TextStyle(fontSize: 24)),
            Text('Terceiro Item', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}