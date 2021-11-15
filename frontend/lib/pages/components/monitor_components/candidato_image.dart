import 'package:flutter/material.dart';

class CandidatoImage extends StatelessWidget {
  const CandidatoImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 260,
      color: Colors.grey,
      child: const Center(
          child: Icon(
        Icons.person,
        size: 100,
        color: Colors.white,
      )),
    );
  }
}
