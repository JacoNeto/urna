import 'package:flutter/material.dart';

///  TELA DE QUANDO UMA SESSÃO DE VOTAÇÃO ACABA
class EndScreen extends StatelessWidget {
  const EndScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'FIM',
        style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
      ),
    );
  }
}
