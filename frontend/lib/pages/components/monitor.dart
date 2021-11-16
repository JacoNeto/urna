import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urna/controllers/eleicao_controller.dart';
import 'package:urna/pages/components/monitor_components/candidato_image.dart';
import 'package:urna/pages/components/monitor_components/end_screen.dart';
import 'package:urna/pages/components/monitor_components/vote_container.dart';
import 'package:urna/utils/widgets/text_default.dart';

import 'monitor_components/info_text.dart';

class Monitor extends StatelessWidget {
  Monitor({Key? key}) : super(key: key);

  final EleicaoController eleicaoController = Get.find();

  @override
  Widget build(BuildContext context) {
    var candidato = eleicaoController.candidatoAtual;
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Obx(() {
        if (eleicaoController.isFim.value) {
          return const EndScreen();
        }
        return Column(
          children: [
            /// CONTEÚDO
            Obx(() => Expanded(
                  child: Row(
                    children: [
                      /// INFORMAÇÕES DO CANDIDATO
                      Expanded(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "SEU VOTO PARA",
                              style: TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.bold),
                            ),

                            /// CARGO DISPUTADO
                            Padding(
                              padding: const EdgeInsets.only(left: 250.0),
                              child: Obx(() => Text(
                                    eleicaoController.cargo.value == 0 ||
                                            eleicaoController.cargo.value == 1
                                        ? "SENADOR"
                                        : "PRESIDENTE",
                                    style: const TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),

                            const SizedBox(
                              height: 120,
                            ),

                            /// NÚMERO INFORMADO
                            Obx(() {
                              var list =
                                  eleicaoController.numeroAtual.value.split('');
                              list.addAll(["", "", "", "", ""]);
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const TextDefault("Número: "),
                                  Vote(
                                    numero: list,
                                    candidato: eleicaoController.cargo.value,
                                  )
                                ],
                              );
                            }),
                            const SizedBox(
                              height: 30,
                            ),

                            /// Nome do Candidato INFORMADO
                            Row(
                              children: [
                                const TextDefault("Nome: "),
                                TextDefault(candidato.value.nome ?? "",
                                    fontWeight: FontWeight.bold),
                              ],
                            ),

                            const SizedBox(
                              height: 14,
                            ),

                            /// Partido do Candidato INFORMADO
                            Row(
                              children: [
                                const TextDefault("Partido: "),
                                TextDefault(
                                  candidato.value.partido ?? "",
                                  fontWeight: FontWeight.bold,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),

                      /// FOTO DO CANDIDATO
                      Expanded(
                          flex: 2,
                          child: Align(
                              alignment: Alignment.topRight,
                              child: CandidatoImage(
                                image: candidato.value.imagem ?? "",
                              )))
                    ],
                  ),
                )),

            /// DIVISÓRIA
            const Divider(),

            /// INSTRUÇÕES
            const Align(alignment: Alignment.bottomLeft, child: InfoText())
          ],
        );
      }),
    );
  }
}
