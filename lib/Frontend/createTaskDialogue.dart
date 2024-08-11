import 'package:flutter/material.dart';

Future<AlertDialog?> showAddTaskDialog({
  required BuildContext context,
  required TextEditingController textFieldController,
  required Function(String) onAdd,
}) async {
   return await showDialog<AlertDialog>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(0xff141111),
        title: const Text(
          'Add task:',
          style: TextStyle(color: Colors.yellow),
        ),
        content: TextField(
          maxLines: 3,
          style: const TextStyle(color: Colors.white),
          controller: textFieldController,
          decoration: const InputDecoration(
            hintText: 'Enter task here.',
            hintStyle: TextStyle(color: Color(0xff696969)),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'ADD',
              style: TextStyle(color: Colors.yellow),
            ),
            onPressed: () {
              if (textFieldController.text.isNotEmpty) {
                Navigator.of(context).pop();
                onAdd(textFieldController.text);
              }
            },
          ),
          TextButton(
            child: const Text(
              'CANCEL',
              style: TextStyle(color: Colors.yellow),
            ),
            onPressed: () {
              textFieldController.text = '';
              Navigator.of(context).pop();
            },
          )
        ],
      );
    }
  );
}