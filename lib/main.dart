import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'routes/routes.dart';
import 'screens/screens.dart';
import 'services/socket_service.dart';

void main() => runApp(MyApp());

//googlemapsplatform api: AIzaSyBuIb2wetoxFRDtKVsXSPVeRep01qNzBTU
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SocketService())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mujer segura',
        initialRoute: 'map',
        routes: appRooutes,
      ),
    );
  }
}
