import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Exemplo de Stack')),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.red,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}