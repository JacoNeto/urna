import 'package:flutter/material.dart';

class Monitor extends StatelessWidget {
  const Monitor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.grey[400],
      child: const Center(
        child: Text(
          'FIM',
          style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
