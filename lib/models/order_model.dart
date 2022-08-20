import 'dart:convert';

import 'package:proyect_sm_accesorios/models/index.dart';

class Order {
  Order({
    required this.nroItems,
    required this.total,
    required this.orderItems,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  final int nroItems;
  final int total;
  final List<OrderItem> orderItems;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;

  factory Order.fromJson(String str) => Order.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Order.fromMap(Map<String, dynamic> json) => Order(
        nroItems: json["nroItems"],
        total: json["total"],
        orderItems: List<OrderItem>.from(
            json["orderItems"].map((x) => OrderItem.fromMap(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "nroItems": nroItems,
        "total": total,
        "orderItems": List<OrderItem>.from(orderItems.map((x) => x.toMap())),
      };
}
