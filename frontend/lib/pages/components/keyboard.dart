import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urna/controllers/eleicao_controller.dart';

import 'keyboard_components/key_button.dart';
import 'keyboard_components/operation_button.dart';

class Keyboard extends StatelessWidget {
  Keyboard({Key? key}) : super(key: key);

  final EleicaoController eleicaoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      KeyButton(value: '1'),
                      KeyButton(value: '2'),
                      KeyButton(value: '3'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      KeyButton(value: '4'),
                      KeyButton(value: '5'),
                      KeyButton(value: '6'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      KeyButton(value: '7'),
                      KeyButton(value: '8'),
                      KeyButton(value: '9'),
                    ],
                  ),
                ),
                KeyButton(value: '0'),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              OperationButton(
                label: 'BRANCO',
                color: Colors.white,
                height: 50,
                onPressed: () {},
              ),
              OperationButton(
                label: 'CORRIGE',
                color: Colors.orange,
                height: 50,
                onPressed: () {
                  eleicaoController.limparNumero();
                },
              ),
              OperationButton(
                label: 'CONFIRMA',
                color: Colors.green[300],
                height: 70,
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
