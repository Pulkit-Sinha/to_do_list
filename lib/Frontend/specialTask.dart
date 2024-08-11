import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class SpecialTask extends StatelessWidget {
  final String title;
  final VoidCallback onComplete;
  final VoidCallback onEdit;
  final VoidCallback onMarkRegular;

  const SpecialTask({super.key, 
    required this.title,
    required this.onComplete,
    required this.onEdit,
    required this.onMarkRegular,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow,
      elevation: 5,
      child: Row(
        children: <Widget>[

          // Complete button
          Container(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                width: 50,
                child: ElevatedButton(
                  onPressed: onComplete,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
                    shape: MaterialStateProperty.all<OutlinedBorder>(const CircleBorder(
                      side: BorderSide(color: Colors.black, width: 5),
                    )),
                    overlayColor: MaterialStateProperty.all<Color>(Colors.purple),
                    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(5)),
                  ),
                  child: Container(),
                ),
              ),
            ),
          ),

          //space between buttons
          const SizedBox(width: 10),

          //title
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),

          // Edit button
          SizedBox(
            width: 50,
            height: 50,
            child: ElevatedButton(
              onPressed: onEdit,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
                overlayColor: MaterialStateProperty.all<Color>(Colors.purple),
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
              ),
              child: const Icon(
                Feather.edit,
                size: 35,
                color: Colors.black,
              ),
            ),
          ),

          //space between buttons
          const SizedBox(width: 10),

          // Mark as regular button
          SizedBox(
            width: 50,
            height: 50,
            child: ElevatedButton(
              onPressed: onMarkRegular,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
                overlayColor: MaterialStateProperty.all<Color>(Colors.purple),
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(
                    AntDesign.staro,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),

          //space on the right
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}