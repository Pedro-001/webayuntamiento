import 'package:flutter/material.dart';

import '../screens/screens.dart';

final Map<String, Widget Function(BuildContext)> appRooutes = {
  'home': (_) => HomeScreen(),
  'login': (_) => LoginScreen(),
  'users': (_) => UsersScreen(),
  'loading': (_) => LoadingScreen(),
  'map': (_) => MapScreen(),
  'register': (_) => RegisterScreen(),
};
