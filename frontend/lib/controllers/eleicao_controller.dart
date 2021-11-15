import 'package:get/get.dart';
import 'package:urna/models/candidato/candidato.dart';
import 'package:urna/services/api.dart';

class EleicaoController extends GetxController {
  /// Controladores da votação
  ///
  ///

  // Variável pra saber se tá na votação de vereador ou prefeito
  var cargo = 0.obs;

  // Variável pra guardar o candidato atual
  var candidatoAtual = Rx<Candidato>(Candidato());

  /// Controladores do teclado
  ///
  ///

  var numeroAtual = "".obs;

  void adicionarNumero(String newNumero) async {
    if ((cargo.value == 0 && numeroAtual.value.length <= 5) ||
        (cargo.value == 1 && numeroAtual.value.length <= 2)) {
      numeroAtual.value += newNumero;
    }
    if ((cargo.value == 0 && numeroAtual.value.length == 5) ||
        (cargo.value == 1 && numeroAtual.value.length == 2)) {
      candidatoAtual.value =
          await API.fetchCandidatoByNumero(int.parse(numeroAtual.value));
      print(
          "MAAAAAAPPAAAAAAAAAAAA " + (candidatoAtual.value.imagem ?? "faiou"));
    }
  }

  void limparNumero() {
    numeroAtual.value = "";
    candidatoAtual.value = Candidato();
  }
}
