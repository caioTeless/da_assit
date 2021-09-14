import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final double? size;
  final void Function(BuildContext) pushNamed;
  TextButtonWidget({
    required this.text,
    required this.size,
    required this.pushNamed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: TextButton(
        onPressed: () => pushNamed(context),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.black, fontSize: size, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
