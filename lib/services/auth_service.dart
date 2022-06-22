import 'dart:convert';
import 'dart:developer';
import 'dart:html';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:random_string/random_string.dart';
import 'package:webadminayuntamiento/global/environment.dart';
import 'package:webadminayuntamiento/models/login_response_model.dart';
import 'package:webadminayuntamiento/models/usuario_model.dart';

class AuthService with ChangeNotifier {
  Usuario? usuario;
  final _storage = new FlutterSecureStorage();
  final Storage _webStorage = window.sessionStorage;

//Autenticación
  bool _autenticando = false;
  bool get autenticando => this._autenticando;
  set autenticando(bool valor) {
    this._autenticando = valor;
    notifyListeners();
  }

  //Getters del token de forma estatica
  static Future<String> getToken() async {
    final _webStorage = window.sessionStorage;
    //web
    final token = await _webStorage["token"]!;

    //mobile
    //final _storage = new FlutterSecureStorage();
    //final token = await _storage.read(key: 'token');
    return token;
  }

  // static Future<String> deleteToken() async {
  static Future<String> deleteToken() async {
    final _webStorage = window.sessionStorage;

    return await window.localStorage.remove('token')!;
    //final _storage = new FlutterSecureStorage();
    //final token = await _storage.delete(key: 'token');
    //return token;
  }

//
  Future<bool> login(String email, String password) async {
    this.autenticando = true;

    final data = {'email': email, 'contraseña': password};
    var Url = Uri.parse('${Environments.apiUrl}/login');
    final resp = await http.post(Url, body: jsonEncode(data), headers: {
      'Content-type': 'application/json',
      "Access-Control-Allow-Origin": "*"
    });
    this.autenticando = false;
    if (resp.statusCode == 200) {
      final loginResponse = LoginResponse.fromJson(resp.body);
      final Usuario = loginResponse.usuario;
      await _guardarToken(loginResponse.token);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> register(
      String nombre, String telefono, String descripcion) async {
    this.autenticando = true;

    final data = {
      'nombre': nombre,
      'telefono': telefono,
      'descripcion': descripcion,
      'email': randomAlphaNumeric(10) + '@example.com'
    };
    var Url = Uri.parse('${Environments.apiUrl}/login/new');
    final resp = await http.post(Url, body: jsonEncode(data), headers: {
      'Content-type': 'application/json',
      "Access-Control-Allow-Origin": "*"
    });

    this.autenticando = false;

    if (resp.statusCode == 200) {
      final loginResponse = LoginResponse.fromJson(resp.body);
      final Usuario = loginResponse.usuario;
      await _guardarToken(loginResponse.token);
      return true;
    } else {
      //final respBody = jsonDecode(resp.body);
      //return respBody['msg'];
      return false;
    }
  }

  Future<bool> isLoggedIn() async {
    //web
    final token = await _webStorage["token"] ?? '';
    // final token = await _storage.read(key: 'token');

    var Url = Uri.parse('${Environments.apiUrl}/login/renew');
    final resp = await http.get(Url,
        headers: {'Content-type': 'application/json', 'x-token': token});

    if (resp.statusCode == 200) {
      final loginResponse = LoginResponse.fromJson(resp.body);
      usuario = loginResponse.usuario;
      await _guardarToken(loginResponse.token);
      return true;
    } else {
      _logOut();
      return false;
    }
  }

  Future _guardarToken(String token) async {
    //Web
    return _webStorage["token"] = token;

    //mobile
    //print('Guardando token');
    //print(token);
    //return await _storage.write(key: 'token', value: token);
  }

  Future _logOut() async {
//    await _storage.delete(key: 'token');
    await _webStorage.remove("token");
  }
}
