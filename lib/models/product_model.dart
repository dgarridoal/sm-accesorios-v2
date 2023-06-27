import 'dart:convert';

import 'package:proyect_sm_accesorios/models/http/index.dart';

class Product {
  Product({
    required this.stock,
    required this.categoria,
    required this.nombre,
    required this.descripcion,
    required this.precioVenta,
    required this.precioCompra,
    required this.fechaVencimiento,
    required this.img,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  int stock;
  List<CategoryProductResponse> categoria;
  String nombre;
  String descripcion;
  int precioVenta;
  int precioCompra;
  DateTime fechaVencimiento;
  String img;
  DateTime createdAt;
  DateTime updatedAt;
  String id;

  get imgUrl => !img.contains('http')
      ? 'https://proyect-backend-sm-production.up.railway.app/api/upload/products/$img'
      : img;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        stock: json["stock"],
        categoria: List<CategoryProductResponse>.from(
            json["categoria"].map((x) => CategoryProductResponse.fromMap(x))),
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        precioVenta: json["precioVenta"],
        precioCompra: json["precioCompra"],
        fechaVencimiento: DateTime.parse(json["fechaVencimiento"]),
        img: json["img"] ?? 'prod',
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "stock": stock,
        "categoria": List<String>.from(categoria.map((x) => x.id)),
        "nombre": nombre,
        "descripcion": descripcion,
        "precioVenta": precioVenta,
        "precioCompra": precioCompra,
        "fechaVencimiento": fechaVencimiento.toIso8601String(),
        "img": img,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
      };
}
