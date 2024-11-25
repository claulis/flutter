import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Exemplo de Row')),
        body: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.star, size: 50, color: Colors.blue),
            Icon(Icons.favorite, size: 50, color: Colors.red),
            Icon(Icons.thumb_up, size: 50, color: Colors.green),
          ],
        ),
      ),
    );
  }
}