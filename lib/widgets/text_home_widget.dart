import 'package:flutter/material.dart';

class TextHomeWidget extends StatelessWidget {
  final String? text;
  final double? size;
  final bool condition;
  TextHomeWidget({
    required this.text,
    required this.size,
    required this.condition
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        color: Colors.white,
        fontSize: size,
        fontFamily: 'RobotoCondensed',
        fontWeight: condition ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
