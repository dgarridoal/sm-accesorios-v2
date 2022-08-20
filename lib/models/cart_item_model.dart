import 'dart:convert';

class CartItemModel {
  String id;
  String nombre;
  int precio;
  int stock;
  int quantity;
  String imagen;

  CartItemModel({
    required this.id,
    required this.nombre,
    required this.precio,
    this.quantity = 1,
    required this.stock,
    required this.imagen,
  });

  factory CartItemModel.fromJson(String str) =>
      CartItemModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartItemModel.fromMap(Map<String, dynamic> json) => CartItemModel(
        id: json["id"],
        nombre: json["nombre"],
        precio: json["precio"],
        stock: json["stock"],
        quantity: json["quantity"],
        imagen: json["imagen"],
      );

  Map<String, dynamic> toMap() => {
        "idProducto": id,
        "nombre": nombre,
        "precio": precio,
        "stock": stock,
        "cantidad": quantity,
        "imagen": imagen,
      };
}
