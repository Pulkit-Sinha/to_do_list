import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

//defines appbar and addTask floating button
class MainBody extends StatelessWidget {
  final List<Widget> items;
  final VoidCallback onAddTask;
  final Future<AlertDialog> Function(BuildContext) displayDialog;

  const MainBody({super.key, 
    required this.items,
    required this.onAddTask,
    required this.displayDialog,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //creating appbar
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'To-Do List',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow),
        ),
      ),

      //this contains list of all tasks
      body: ListView(children: items),

      //addTask floating button
      floatingActionButton: FloatingActionButton(
        onPressed: () => displayDialog(context),
        backgroundColor: const Color(0xff141111),
        splashColor: Colors.purple,
        tooltip: 'Add Task',
        child: Icon(
          FontAwesome5Solid.plus,
          size: 45,
          color: Colors.yellow,
        ),
      ),
    );
  }
}