import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class SpecialTask extends StatefulWidget {
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
  _SpecialTaskState createState() => _SpecialTaskState();
}

class _SpecialTaskState extends State<SpecialTask> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (Rect bounds) {
            return SweepGradient(
              colors: [
                Colors.purple,
                Colors.blue,
                Colors.green,
                Colors.yellow,
                Colors.orange,
                Colors.red,
                Colors.purple,
              ],
              stops: [0.0, 0.2, 0.3, 0.45, 0.6, 0.8, 1.0],
              transform: GradientRotation(_controller.value * 2 * 3.14159),
            ).createShader(bounds);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Card(
                color: const Color(0xff141111),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: <Widget>[

                    //task completion button
                    Container(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: SizedBox(
                          width: 50,
                          child: ElevatedButton(
                            onPressed: widget.onComplete,
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
                          widget.title,
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),

                    //task edit button
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: widget.onEdit,
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
                        onPressed: widget.onMarkRegular,
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
              ),
            ),
          ),
        );
      },
    );
  }
}