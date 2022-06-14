import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String titulo;

  const Logo({
    Key? key,
    required this.titulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170,
        child: Column(
          children: [
            const Image(
              image: AssetImage('assets/logoAyuntamiento.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              titulo,
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}