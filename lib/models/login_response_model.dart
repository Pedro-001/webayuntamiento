// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromMap(jsonString);

import 'dart:convert';

import 'package:webadminayuntamiento/models/usuario_model.dart';

class LoginResponse {
  LoginResponse({
    required this.status,
    required this.usuario,
    required this.token,
  });

  bool status;
  Usuario usuario;
  String token;

  factory LoginResponse.fromJson(String str) =>
      LoginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        usuario: Usuario.fromMap(json["usuario"]),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "usuario": usuario.toMap(),
        "token": token,
      };
}
