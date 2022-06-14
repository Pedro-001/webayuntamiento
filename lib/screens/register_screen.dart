import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff2f2f2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Logo(titulo: 'Registro'),
                  _Form(),
                  const labels(
                    ruta: 'register',
                  ),
                  _TerminosYcondiciones()
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  _Form({Key? key}) : super(key: key);

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final nombreController = TextEditingController();
  final passwordController = TextEditingController();
  final telController = TextEditingController();
  final descripController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.mail_outline,
            placeHolder: 'Nombre',
            keyboardType: TextInputType.emailAddress,
            textcontroller: nombreController,
          ),
          CustomInput(
            icon: Icons.call_end_outlined,
            placeHolder: 'Telefono',
            keyboardType: TextInputType.emailAddress,
            textcontroller: telController,
          ),
          CustomInput(
            icon: Icons.comment_bank_outlined,
            placeHolder: 'Caracteristicas',
            keyboardType: TextInputType.emailAddress,
            textcontroller: descripController,
          ),
          SizedBox(
            width: 300,
            child: Boton(
                text: 'Ingresar',
                onPressed: () {
                  print('olapoperros');
                }),
          )
        ],
      ),
    );
  }
}

class _TerminosYcondiciones extends StatefulWidget {
  _TerminosYcondiciones({Key? key}) : super(key: key);

  @override
  State<_TerminosYcondiciones> createState() => __TerminosYcondicionesState();
}

class __TerminosYcondicionesState extends State<_TerminosYcondiciones> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Text(
            'Terminos y condiciones',
            style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
