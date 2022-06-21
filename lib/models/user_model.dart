import 'dart:convert';

class User {
  User({
    required this.nombre,
    required this.apellido,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  String nombre;
  String apellido;
  String email;
  DateTime createdAt;
  DateTime updatedAt;
  String id;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        nombre: json["nombre"],
        apellido: json["apellido"],
        email: json["email"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "apellido": apellido,
        "email": email,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
      };
}
