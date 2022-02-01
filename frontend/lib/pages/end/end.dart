import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urna/controllers/eleicao_controller.dart';
import 'package:urna/models/candidato/candidato.dart';
import 'package:urna/pages/end/components/candidato_card.dart';
import 'package:urna/services/api.dart';

class EndPage extends StatelessWidget {
  EndPage({Key? key}) : super(key: key);

  final EleicaoController eleicaoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Candidato>>(
          future: API.fetchCandidatos(0),
          builder: (context, vereadorSnapshot) {
            if (!vereadorSnapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return FutureBuilder<List<Candidato>>(
                future: API.fetchCandidatos(1),
                builder: (context, prefeitoSnapshot) {
                  if (!prefeitoSnapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  var vereadorList = <Widget>[];
                  var prefeitoList = <Widget>[];
                  // preenchendo vereadores
                  for (int i = 0; i < vereadorSnapshot.data!.length; i++) {
                    vereadorList.add(CandidatoCard(
                      candidato: vereadorSnapshot.data![i],
                      colocacao: i + 1,
                    ));
                  }
                  // preenchendo prefeitos
                  for (int i = 0; i < prefeitoSnapshot.data!.length; i++) {
                    prefeitoList.add(CandidatoCard(
                        candidato: prefeitoSnapshot.data![i],
                        colocacao: i + 1));
                  }
                  return Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Image(
                              image: AssetImage('assets/justicacerto.png')),
                        ),
                        const Divider(),
                        const Text("RESULTADOS",
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold)),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    const Text("SENADORES",
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold)),
                                    Column(
                                      children: vereadorList,
                                    )
                                  ],
                                )),
                            SizedBox(
                                height: MediaQuery.of(context).size.height / 2,
                                child:
                                    const VerticalDivider(color: Colors.black)),
                            Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    const Text("PRESIDENTES",
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold)),
                                    Column(
                                      children: prefeitoList,
                                    )
                                  ],
                                ))
                          ],
                        ),

                        /// REINICIAR A VOTAÇÃO
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.black),
                            child: const Text("Reiniciar Votação"),
                            onPressed: () async {
                              for (int i = 0;
                                  i < vereadorSnapshot.data!.length;
                                  i++) {
                                var candidato =
                                    await API.fetchCandidatoByNumero(
                                        vereadorSnapshot.data![i].numero!);
                                await API.deleteCandidato(candidato!.id!);
                              }
                              for (int i = 0;
                                  i < prefeitoSnapshot.data!.length;
                                  i++) {
                                var candidato =
                                    await API.fetchCandidatoByNumero(
                                        prefeitoSnapshot.data![i].numero!);
                                await API.deleteCandidato(candidato!.id!);
                              }
                              for (int i = 0;
                                  i < vereadorSnapshot.data!.length;
                                  i++) {
                                var newCandidato = Candidato(
                                    nome: vereadorSnapshot.data![i].nome,
                                    numero: vereadorSnapshot.data![i].numero,
                                    partido: vereadorSnapshot.data![i].partido,
                                    cargo: vereadorSnapshot.data![i].cargo,
                                    imagem: vereadorSnapshot.data![i].imagem);
                                await API.createCandidato(newCandidato);
                              }
                              for (int i = 0;
                                  i < prefeitoSnapshot.data!.length;
                                  i++) {
                                var newCandidato = Candidato(
                                    nome: prefeitoSnapshot.data![i].nome,
                                    numero: prefeitoSnapshot.data![i].numero,
                                    partido: prefeitoSnapshot.data![i].partido,
                                    cargo: prefeitoSnapshot.data![i].cargo,
                                    imagem: prefeitoSnapshot.data![i].imagem);
                                await API.createCandidato(newCandidato);
                              }
                              Get.toNamed('/');
                            },
                          ),
                        )
                      ],
                    ),
                  );
                });
          }),
    );
  }
}
