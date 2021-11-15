import 'package:flutter/material.dart';

import 'keyboard_components/key_button.dart';
import 'keyboard_components/operation_button.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);

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
                    children: const [
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
                    children: const [
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
                    children: const [
                      KeyButton(value: '7'),
                      KeyButton(value: '8'),
                      KeyButton(value: '9'),
                    ],
                  ),
                ),
                const KeyButton(value: '0'),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const OperationButton(
                label: 'BRANCO',
                color: Colors.white,
                height: 50,
              ),
              const OperationButton(
                label: 'CORRIGE',
                color: Colors.orange,
                height: 50,
              ),
              OperationButton(
                label: 'CONFIRMA',
                color: Colors.green[300],
                height: 70,
              ),
            ],
          )
        ],
      ),
    );
  }
}
