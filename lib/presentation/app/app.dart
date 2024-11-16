import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      title: 'Todo App',
      theme: ThemeData( // TODO change color scheme
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}