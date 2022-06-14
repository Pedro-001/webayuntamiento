import 'package:flutter/material.dart';

class labels extends StatelessWidget {
  final String ruta;
  //final String titulo;
  //final String subTitulo;
  const labels({
    Key? key,
    required this.ruta,
    //required this.titulo,
    //required this.subTitulo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
//          GestureDetector(
//            onTap: () {
//              Navigator.pushReplacementNamed(context, 'register');
//            },
//            child: const Text(
//              '¿No tienes cuenta?',
//              style: TextStyle(
//                  color: Colors.black54,
//                  fontSize: 15,
//                  fontWeight: FontWeight.w300),
//            ),
//          ),
//          const SizedBox(
//            height: 10,
//          ),
//          GestureDetector(
//            onTap: () {
//              Navigator.pushReplacementNamed(context, this.ruta);
//            },
//            child: Text(
//              'Crear una cuenta',
//              style: TextStyle(
//                  color: Colors.blue[600],
//                  fontSize: 18,
//                  fontWeight: FontWeight.bold),
//            ),
//          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, ruta);
            },
            child: Text(
              'Usar como anonimo',
              style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
