import 'dart:convert';

import 'package:proyect_sm_accesorios/models/product_model.dart';

class ProductResponse {
  ProductResponse({
    required this.status,
    required this.product,
  });

  bool status;
  Product product;

  factory ProductResponse.fromJson(String str) =>
      ProductResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductResponse.fromMap(Map<String, dynamic> json) => ProductResponse(
        status: json["status"],
        product: Product.fromMap(json["product"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "product": product.toMap(),
      };
}
