import 'dart:convert';

import 'package:proyect_sm_accesorios/models/index.dart';

class LoginResponse {
  LoginResponse({
    required this.status,
    required this.user,
    required this.token,
  });

  bool status;
  User user;
  String token;

  factory LoginResponse.fromJson(String str) =>
      LoginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        user: User.fromMap(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "user": user.toMap(),
        "token": token,
      };
}
