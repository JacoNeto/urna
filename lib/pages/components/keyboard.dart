import 'package:flutter/material.dart';

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
            children: [
              const OperationButton(
                label: 'BRANCO',
                color: Colors.white,
              ),
              const OperationButton(
                label: 'CORRIGE',
                color: Colors.orange,
              ),
              OperationButton(
                label: 'CONFIRMA',
                color: Colors.green[300],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class KeyButton extends StatelessWidget {
  const KeyButton({Key? key, required this.value}) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(value),
      onPressed: () {},
      style: ElevatedButton.styleFrom(primary: Colors.grey[800]),
    );
  }
}

class OperationButton extends StatelessWidget {
  const OperationButton({Key? key, required this.color, required this.label})
      : super(key: key);

  final Color? color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        label,
        style: const TextStyle(color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(primary: color),
      onPressed: () {},
    );
  }
}
