import 'package:flutter/material.dart';
import 'package:urna/utils/widgets/text_default.dart';

class InfoText extends StatelessWidget {
  const InfoText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        TextDefault(
          "Aperte a Tecla:",
        ),
        TextDefault(
          "VERDE para CONFIRMAR este voto",
        ),
        TextDefault(
          "LARANJA para REINICIAR este voto",
        )
      ],
    );
  }
}
