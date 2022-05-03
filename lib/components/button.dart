import 'package:flutter/material.dart';

class CalcBtn extends StatelessWidget {
  final String text;
  final int? fillColor;
  final int textColor;
  final double textSize;
  final Function callback;

  const CalcBtn({
    required this.text,
    this.fillColor,
    this.textColor = 0xFFFFFFFF,
    this.textSize = 28,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          callback(text);
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: textSize,
            color: Color(textColor),
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary:
              fillColor != null ? Color(fillColor!) : const Color(0xFF24475F),
          shape: const CircleBorder(),
        ),
      ),
    );
  }
}
