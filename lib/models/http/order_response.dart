// To parse this JSON data, do
//
//     final orderResponse = orderResponseFromMap(jsonString);

import 'dart:convert';

import 'package:proyect_sm_accesorios/models/index.dart';

class OrderResponse {
  OrderResponse({
    required this.status,
    required this.orders,
  });

  final bool status;
  final List<Order> orders;

  factory OrderResponse.fromJson(String str) =>
      OrderResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderResponse.fromMap(Map<String, dynamic> json) => OrderResponse(
        status: json["status"],
        orders: List<Order>.from(json["orders"].map((x) => Order.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "orders": List<dynamic>.from(orders.map((x) => x.toMap())),
      };
}
