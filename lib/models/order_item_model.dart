import 'dart:convert';

class OrderItem {
  OrderItem({
    required this.id,
    required this.idProducto,
    required this.nombre,
    required this.cantidad,
    required this.precio,
    required this.img,
  });

  final String id;
  final String idProducto;
  final String nombre;
  final int cantidad;
  final int precio;
  final String img;

  factory OrderItem.fromJson(String str) => OrderItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderItem.fromMap(Map<String, dynamic> json) => OrderItem(
        id: json["_id"],
        idProducto: json["idProducto"],
        nombre: json["nombre"],
        cantidad: json["cantidad"],
        precio: json["precio"],
        img: json["img"],
      );

  Map<String, dynamic> toMap() => {
        "idProducto": idProducto,
        "nombre": nombre,
        "cantidad": cantidad,
        "precio": precio,
        "img": img,
      };
}
