import 'dart:convert';

import 'package:proyect_sm_accesorios/models/index.dart';

class CategoriesResponse {
  CategoriesResponse({
    required this.status,
    required this.categories,
  });

  bool status;
  List<Category> categories;

  factory CategoriesResponse.fromJson(String str) =>
      CategoriesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoriesResponse.fromMap(Map<String, dynamic> json) =>
      CategoriesResponse(
        status: json["status"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "categories": List<dynamic>.from(categories.map((x) => x.toMap())),
      };
}
