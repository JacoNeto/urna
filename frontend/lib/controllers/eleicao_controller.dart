import 'dart:async';

import 'package:get/get.dart';
import 'package:urna/models/candidato/candidato.dart';
import 'package:urna/models/voto/voto.dart';
import 'package:urna/services/api.dart';
import 'package:urna/utils/generate_titulo.dart';

class EleicaoController extends GetxController {
  /// Controladores da votação
  ///
  ///

  // Variável pra saber se tá na votação de vereador ou prefeito
  var cargo = 0.obs;

  // variável para colocar a tela de fim
  var isFim = false.obs;

  var isAuth = false.obs;

  // Variável pra guardar o candidato atual
  var candidatoAtual = Rx<Candidato>(Candidato());

  /// Controladores do teclado
  ///
  ///

  var numeroAtual = "".obs;
  var tituloEleitor = "";

  void adicionarNumero(String newNumero) async {
    if (((cargo.value == 0 || cargo.value == 1) &&
            numeroAtual.value.length < 3) ||
        (cargo.value == 2 && numeroAtual.value.length < 2)) {
      numeroAtual.value += newNumero;
    }
    if (((cargo.value == 0 || cargo.value == 1) &&
            numeroAtual.value.length == 3) ||
        (cargo.value == 2 && numeroAtual.value.length == 2)) {
      Candidato? aux =
          await API.fetchCandidatoByNumero(int.parse(numeroAtual.value));
      candidatoAtual.value = aux ?? Candidato();

      print(
          "MAAAAAAPPAAAAAAAAAAAA " + (candidatoAtual.value.imagem ?? "faiou"));
    }
  }

  void confirmarVoto(int numero) async {
    // TRATANDO VOTAÇÃO
    if (((cargo.value == 0 || cargo.value == 1) &&
            numeroAtual.value.length == 3) ||
        (cargo.value == 2 && numeroAtual.value.length == 2) ||
        numero == 0 ||
        numero == 1) {
      // TRATANDO VOTO NULO
      print("CANDIDATOOOOOOOOOOOOOOOOOO " +
          (candidatoAtual.value.nome ?? "faio"));
      if ((cargo.value == 0 || cargo.value == 1) &&
          candidatoAtual.value.numero == null) {
        numero = -1;
      } else if (cargo.value == 2 && candidatoAtual.value.numero == null) {
        numero = -2;
      }

      var voto = Voto(tItuloEleitor: tituloEleitor, numero: numero);
      await API.vote(voto);
      limparNumero();

      if (cargo.value == 2) {
        isFim.value = true;
        Timer(const Duration(milliseconds: 3000), () {
          setEnd();
        });
      }

      if (cargo.value == 0) {
        cargo.value = 1;
      } else if (cargo.value == 1) {
        cargo.value = 2;
      } else {
        cargo.value = 0;
      }
    }
  }

  void setEnd() {
    tituloEleitor = "";
    isAuth.value = false;
    isFim.value = false;
  }

  void votoBranco() {
    if ((cargo.value == 0) || (cargo.value == 1)) {
      confirmarVoto(0);
    } else {
      confirmarVoto(1);
    }
  }

  void limparNumero() {
    numeroAtual.value = "";
    candidatoAtual.value = Candidato();
  }

  void configTitulo(String titulo) {
    isAuth.value = true;
    tituloEleitor = titulo;
  }

  // RESULTADOS DA ELEIÇÃO

}
