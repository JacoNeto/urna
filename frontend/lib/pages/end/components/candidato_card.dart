import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urna/controllers/eleicao_controller.dart';
import 'package:urna/models/candidato/candidato.dart';
import 'package:urna/pages/components/monitor_components/candidato_image.dart';

class CandidatoCard extends StatelessWidget {
  CandidatoCard({Key? key, required this.candidato, required this.colocacao})
      : super(key: key);

  final Candidato candidato;
  final EleicaoController eleicaoController = Get.find();
  final int colocacao;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Text(
              colocacao.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 8,
            ),
            SizedBox(
              width: 50,
              height: 70,
              child: CandidatoImage(
                image: candidato.imagem ?? "",
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  candidato.nome ?? "",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(candidato.partido ?? ""),
                Text("Votos: " + (candidato.votos.toString()))
              ],
            )
          ],
        ));
  }
}
