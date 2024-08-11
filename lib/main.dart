import 'package:flutter/material.dart';
import 'TodoList.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do List',
      theme: ThemeData(
        fontFamily: 'GoogleSans',
        primaryColor: const Color(0xff141111),
        scaffoldBackgroundColor: const Color(0xff1d1d1d),
      ),
      home: const TodoList(),
    );
  }
}