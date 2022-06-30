import 'dart:convert';

class CategoryProductResponse {
  CategoryProductResponse({
    required this.id,
    required this.nombre,
  });

  String id;
  String nombre;

  factory CategoryProductResponse.fromJson(String str) =>
      CategoryProductResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryProductResponse.fromMap(Map<String, dynamic> json) =>
      CategoryProductResponse(
        id: json["_id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
      };
}
