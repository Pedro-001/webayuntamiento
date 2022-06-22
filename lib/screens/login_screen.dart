import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:webadminayuntamiento/helper/show_alerts.dart';
import 'package:webadminayuntamiento/services/auth_service.dart';
import 'package:webadminayuntamiento/services/socket_service.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                  Logo(
                    titulo: 'Inicio Sesión',
                  ),
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
  State<_Form> createState() => FormState();
}

class FormState extends State<_Form> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passController = TextEditingController();
  final descripController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.mail_outline,
            placeHolder: 'Email',
            keyboardType: TextInputType.emailAddress,
            textcontroller: emailController,
          ),
          CustomInput(
            icon: Icons.call_end_outlined,
            placeHolder: 'Password',
            textcontroller: passController,
            isPassword: true,
          ),
          SizedBox(
            width: 300,
            child: authService.autenticando
                ? null
                : Boton(
                    text: 'Ingresar',
                    onPressed: () async {
                      print(emailController.text);
                      print(passController.text);
                      final loginOk = await authService.login(
                          emailController.text.trim(),
                          passController.text.trim());
                      if (loginOk) {
                        //conectar a nuestro socket server
                        socketService.connect();
                        //moverse a siguiente pantalla
                        Navigator.pushReplacementNamed(context, 'users');
                      } else {
                        mostrarAlerta(
                            context, 'Login incorrecto', 'Revise credenciales');
                      }
                    }),
          ),
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
