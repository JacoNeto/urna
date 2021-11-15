import 'package:flutter/material.dart';
import 'package:urna/pages/components/monitor_components/candidato_image.dart';
import 'package:urna/pages/components/monitor_components/vote_container.dart';
import 'package:urna/utils/widgets/text_default.dart';

import 'monitor_components/info_text.dart';

class Monitor extends StatelessWidget {
  const Monitor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          /// CONTEÚDO
          Expanded(
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
                      const Padding(
                        padding: EdgeInsets.only(left: 250.0),
                        child: Text(
                          "VEREADOR",
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                      ),

                      const SizedBox(
                        height: 120,
                      ),

                      /// NÚMERO INFORMADO
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          TextDefault("Número: "),
                          Vote(
                            numero: ["1", "2", "3", "4", "5"],
                            candidato: 0,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      /// Nome do Candidato INFORMADO
                      Row(
                        children: const [
                          TextDefault("Nome: "),
                          TextDefault("Jacó Neto", fontWeight: FontWeight.bold),
                        ],
                      ),

                      const SizedBox(
                        height: 14,
                      ),

                      /// Partido do Candidato INFORMADO
                      Row(
                        children: const [
                          TextDefault("Partido: "),
                          TextDefault(
                            "Partido dos Gordos",
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                    ],
                  ),
                ),

                /// FOTO DO CANDIDATO
                const Expanded(
                    flex: 2,
                    child: Align(
                        alignment: Alignment.topRight, child: CandidatoImage()))
              ],
            ),
          ),

          /// DIVISÓRIA
          const Divider(),

          /// INSTRUÇÕES
          const Align(alignment: Alignment.bottomLeft, child: InfoText())
        ],
      ),
    );
  }
}
