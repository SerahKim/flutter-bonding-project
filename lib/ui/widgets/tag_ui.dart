import 'package:flutter/material.dart';

class TagUI extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;

  const TagUI({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 10,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
