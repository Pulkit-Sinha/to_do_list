import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class RegularTask extends StatelessWidget {
  final String title;
  final VoidCallback onComplete;
  final VoidCallback onEdit;
  final VoidCallback onMarkSpecial;

  const RegularTask({super.key, 
    required this.title,
    required this.onComplete,
    required this.onEdit,
    required this.onMarkSpecial,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff141111),
      elevation: 5,
      child: Row(
        children: <Widget>[

          //task completion button
          Container(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                width: 50,
                child: ElevatedButton(
                  onPressed: onComplete,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(const Color(0xff141111)),
                    shape: WidgetStateProperty.all<OutlinedBorder>(const CircleBorder(
                      side: BorderSide(color: Colors.yellow, width: 5),
                    )),
                    overlayColor: WidgetStateProperty.all<Color>(Colors.purple),
                    padding: WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.all(5)),
                  ),
                  child: Container(),
                ),
              ),
            ),
          ),

          //task title
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),

          //task edit button
          SizedBox(
            width: 50,
            height: 50,
            child: ElevatedButton(
              onPressed: onEdit,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff141111)),
                overlayColor: MaterialStateProperty.all<Color>(Colors.purple),
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
              ),
              child: const Icon(
                Feather.edit,
                size: 35,
                color: Colors.yellow,
              ),
            ),
          ),

          //mark task as special button
          SizedBox(
            width: 50,
            height: 50,
            child: ElevatedButton(
              onPressed: onMarkSpecial,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff141111)),
                overlayColor: MaterialStateProperty.all<Color>(Colors.purple),
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
              ),
              child: const Icon(
                AntDesign.staro,
                size: 35,
                color: Colors.yellow,
              ),
            ),
          ),

          //leave space on the right
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}