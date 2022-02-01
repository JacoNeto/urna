import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urna/controllers/eleicao_controller.dart';
import 'package:urna/pages/components/end_button.dart';
import 'package:urna/pages/components/keyboard.dart';
import 'package:urna/pages/components/monitor.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EleicaoController eleicaoController = Get.put(EleicaoController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!eleicaoController.isAuth.value) {
        Timer.run(_showDialog);
      }

      return Row(
        children: [
          /// Monitor
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.only(
                  left: 50, right: 50, top: 70, bottom: 70),
              color: Colors.grey[300],
              child: Monitor(),
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
                    child: Keyboard(),
                    color: Colors.grey[700],
                  ),
                )
              ],
            ),
          )
        ],
      );
    });
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        String titulo = "";
        final _formKey = GlobalKey<FormState>();
        // return object of type Dialog
        return AlertDialog(
          title: const Text("Informe seu título de eleitor (12 dígitos):"),
          content: Form(
            key: _formKey,
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty || value.length != 12) {
                  return 'Insira o titulo corretamente!';
                }
                return null;
              },
              onChanged: (value) {
                titulo = value;
              },
              textInputAction: TextInputAction.next,
            ),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              child: const Text("Votar"),
              onPressed: () {
                _formKey.currentState!.save();
                if (_formKey.currentState!.validate()) {
                  eleicaoController.configTitulo(titulo);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
