import 'package:flutter/material.dart';

class CandidatoImage extends StatelessWidget {
  const CandidatoImage({Key? key, this.image}) : super(key: key);

  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 260,
      color: Colors.grey,
      child: (image == null || image == "")
          ? const Center(
              child: Icon(
              Icons.person,
              size: 100,
              color: Colors.white,
            ))
          : Image(
              image: NetworkImage(image!),
            ),
    );
  }
}
