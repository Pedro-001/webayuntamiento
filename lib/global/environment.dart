import 'dart:io';

class Environments {
  static String apiUrl = 'http://localhost:3000/api';
  //static String apiUrl = 'http://backayuntamientoprod.herokuapp.com/api';
  //Platform.isAndroid
  //    ? 'http://10.0.2.2:3000/api'
  //    : 'http://localhost:3000/api';
  static String socketUrl = 'http://localhost:3000';
  //static String socketUrl = 'http://backayuntamientoprod.herokuapp.com';
  //  Platform.isAndroid ? 'http://10.0.2.2:3000' : 'http://localhost:3000';
}
