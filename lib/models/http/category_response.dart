import 'dart:convert';

import 'package:proyect_sm_accesorios/models/index.dart';

class CategoryResponse {
  CategoryResponse({
    required this.status,
    required this.category,
  });

  bool status;
  Category category;

  factory CategoryResponse.fromJson(String str) =>
      CategoryResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryResponse.fromMap(Map<String, dynamic> json) =>
      CategoryResponse(
        status: json["status"],
        category: Category.fromMap(json["category"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "category": category.toMap(),
      };
}
