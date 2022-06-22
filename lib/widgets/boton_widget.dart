import 'package:flutter/material.dart';

class Boton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const Boton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            elevation: MaterialStateProperty.all(2),
            shape: MaterialStateProperty.all(StadiumBorder())),
        onPressed: () => onPressed(),
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 17)));
  }
}
