import 'dart:convert';

import 'package:proyect_sm_accesorios/models/category_product_response.dart';

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
  List<CategoriaProductResponse> categoria;
  String nombre;
  String descripcion;
  int precioVenta;
  int precioCompra;
  DateTime fechaVencimiento;
  String img;
  DateTime createdAt;
  DateTime updatedAt;
  String id;

  get imgUrl =>
      'https://sm-accesorios-backend.herokuapp.com/api/upload/products/$img';

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        stock: json["stock"],
        categoria: List<CategoriaProductResponse>.from(
            json["categoria"].map((x) => CategoriaProductResponse.fromMap(x))),
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
        "categoria": List<dynamic>.from(categoria.map((x) => x.toMap())),
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
