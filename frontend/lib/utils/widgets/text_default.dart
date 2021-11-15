import 'package:flutter/material.dart';

class TextDefault extends StatelessWidget {
  const TextDefault(
    this.label, {
    Key? key,
    this.fontWeight,
  }) : super(key: key);

  final String label;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(fontSize: 23, fontWeight: fontWeight),
    );
  }
}
