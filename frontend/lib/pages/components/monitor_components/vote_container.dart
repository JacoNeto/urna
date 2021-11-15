import 'package:flutter/material.dart';

class Vote extends StatelessWidget {
  const Vote({Key? key, required this.numero, required this.candidato})
      : super(key: key);

  final List<String> numero;
  final int candidato;

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    int qtd;
    qtd = candidato == 0 ? 5 : 2;
    for (int i = 0; i < qtd; i++) {
      list.add(Padding(
        padding: const EdgeInsets.only(left: 3.0),
        child: VoteContainer(
          number: numero[i],
        ),
      ));
    }
    return Row(children: list);
  }
}

class VoteContainer extends StatelessWidget {
  const VoteContainer({Key? key, this.number}) : super(key: key);

  final String? number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 70,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black), color: Colors.white),
      child: Center(
        child: Text(
          number ?? "",
          style: const TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
