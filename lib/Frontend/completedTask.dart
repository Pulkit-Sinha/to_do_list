import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class CompletedTask extends StatelessWidget {
  final String title;
  final VoidCallback onUndo;
  final VoidCallback onDelete;

  const CompletedTask({super.key, 
    required this.title,
    required this.onUndo,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.purple,
      elevation: 5,
      child: Row(
        children: <Widget>[

          // Undo button
          Container(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                width: 50,
                child: ElevatedButton(
                  onPressed: onUndo,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(Colors.purple),
                    elevation: WidgetStateProperty.all(0.0),
                    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                  ),
                  child: Icon(
                      MaterialCommunityIcons.undo,
                      size: 35,
                      color: Colors.black,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 5),

          // Title
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),

          // Delete button
          SizedBox(
            width: 50,
            child: Container(
              child: ElevatedButton(
                onPressed: onDelete,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.purple),
                  overlayColor: WidgetStateProperty.all<Color>(Colors.purple),
                  elevation: WidgetStateProperty.all(0.0),
                ),
                child: const Center(
                  child: Icon(
                    MaterialCommunityIcons.delete,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 30)
        ],
      ),
    );
  }
}