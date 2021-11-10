import 'package:flutter/material.dart';
import 'package:urna/pages/components/end_button.dart';
import 'package:urna/pages/components/keyboard.dart';
import 'package:urna/pages/components/monitor.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Monitor
        Expanded(
          flex: 2,
          child: Container(
            padding:
                const EdgeInsets.only(left: 50, right: 50, top: 70, bottom: 70),
            color: Colors.grey[300],
            child: const Monitor(),
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              /// Finalizar Eleição
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey[200],
                  child: const EndButton(),
                ),
              ),

              /// Teclado
              Expanded(
                flex: 3,
                child: Container(
                  child: const Keyboard(),
                  color: Colors.grey[700],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}