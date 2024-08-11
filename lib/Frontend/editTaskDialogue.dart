import 'package:flutter/material.dart';

Future<void> showEditDialog({
  required BuildContext context,
  required String title,
  required TextEditingController textEditController,
  required VoidCallback onSave,
}) async {
  textEditController.text = title;
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(0xff141111),
        title: const Text(
          'Edit task:',
          style: TextStyle(color: Colors.yellow),
        ),
        content: TextField(
          maxLines: 3,
          showCursor: true,
          style: const TextStyle(color: Colors.white),
          controller: textEditController,
          decoration: const InputDecoration(
            hintText: 'Enter task here.',
            hintStyle: TextStyle(color: Color(0xff696969)),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'SAVE',
              style: TextStyle(color: Colors.yellow),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              onSave();
            },
          ),
          TextButton(
            child: const Text(
              'CANCEL',
              style: TextStyle(color: Colors.yellow),
            ),
            onPressed: () {
              textEditController.text = '';
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}