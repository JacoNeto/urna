import 'package:flutter/material.dart';

class KeyButton extends StatelessWidget {
  const KeyButton({Key? key, required this.value}) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        value,
        style: const TextStyle(fontSize: 30),
      ),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          primary: Colors.grey[800], fixedSize: const Size(40, 40)),
    );
  }
}
