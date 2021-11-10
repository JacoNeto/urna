import 'package:flutter/material.dart';

class EndButton extends StatelessWidget {
  const EndButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Image(image: AssetImage('assets/justicacerto.png')),
            Text(
              'Justiça\nEleitoral',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
