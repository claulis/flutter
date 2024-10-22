import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Container(color: Colors.orange,
          child: const Center(
            child: Column(
             children: [Text("Olá",
                        style: TextStyle(color: Colors.white, 
                        decorationStyle: TextDecorationStyle.dashed),),
             Text("Mundo",style: TextStyle(color: Colors.white,
                         decorationStyle: TextDecorationStyle.wavy),)] ,
            ),  
            ),
          )
    );
  }
}
