import 'dart:convert';

import 'package:proyect_sm_accesorios/models/index.dart';

class ProductsResponse {
  ProductsResponse({
    required this.status,
    required this.products,
  });

  bool status;
  List<Product> products;

  factory ProductsResponse.fromJson(String str) =>
      ProductsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductsResponse.fromMap(Map<String, dynamic> json) =>
      ProductsResponse(
        status: json["status"],
        products:
            List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "products": List<dynamic>.from(products.map((x) => x.toMap())),
      };
}
