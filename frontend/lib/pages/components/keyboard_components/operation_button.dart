import 'package:flutter/material.dart';

class OperationButton extends StatelessWidget {
  const OperationButton(
      {Key? key,
      required this.color,
      required this.label,
      required this.height})
      : super(key: key);

  final Color? color;
  final String label;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        label,
        style: const TextStyle(color: Colors.black, fontSize: 17),
      ),
      style: ElevatedButton.styleFrom(
          primary: color, fixedSize: Size(120, height)),
      onPressed: () {},
    );
  }
}
