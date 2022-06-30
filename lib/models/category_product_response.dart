import 'dart:convert';

class CategoriaProductResponse {
  CategoriaProductResponse({
    required this.id,
    required this.nombre,
  });

  String id;
  String nombre;

  factory CategoriaProductResponse.fromJson(String str) =>
      CategoriaProductResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoriaProductResponse.fromMap(Map<String, dynamic> json) =>
      CategoriaProductResponse(
        id: json["_id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
      };
}
