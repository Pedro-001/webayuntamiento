import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webadminayuntamiento/screens/screens.dart';
import 'package:webadminayuntamiento/services/auth_service.dart';
import 'package:webadminayuntamiento/services/socket_service.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot) {
          return Center(
            child: Text('Espere...'),
          );
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    print('checklginstate');
    final authService = Provider.of<AuthService>(context, listen: false);
    final socketService = Provider.of<SocketService>(context, listen: false);

    final autenticado = await authService.isLoggedIn();

    if (autenticado) {
      socketService.connect();
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => UsersScreen(),
              transitionDuration: Duration(milliseconds: 0)));
    } else {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => LoginScreen(),
              transitionDuration: Duration(milliseconds: 0)));
    }
  }
}
