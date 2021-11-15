import 'package:get/get.dart';

class EleicaoController extends GetxController {
  var numeroAtual = "".obs;

  void adicionarNumero(String newNumero) {
    numeroAtual.value += newNumero;
  }

  void limparNumero() {
    numeroAtual.value = "";
  }
}
