import 'package:flutter/material.dart';

class TextSeccion extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  const TextSeccion({
    Key? key,
    required this.text,
    required this.color,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: size,
          fontStyle: FontStyle.normal,
          color: color,
        ),
      ),
    );
  }
}
