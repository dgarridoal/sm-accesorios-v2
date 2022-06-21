import 'dart:convert';

class Category {
  Category({
    required this.nombre,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  String nombre;
  DateTime createdAt;
  DateTime updatedAt;
  String id;

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        nombre: json["nombre"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
      };
}
