import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urna/controllers/eleicao_controller.dart';

class KeyButton extends StatelessWidget {
  KeyButton({Key? key, required this.value}) : super(key: key);

  final String value;
  final EleicaoController eleicaoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        value,
        style: const TextStyle(fontSize: 30),
      ),
      onPressed: () {
        eleicaoController.adicionarNumero(value);
      },
      style: ElevatedButton.styleFrom(
          primary: Colors.grey[800], fixedSize: const Size(40, 40)),
    );
  }
}
