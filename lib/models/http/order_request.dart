// To parse this JSON data, do
//
//     final orderRequest = orderRequestFromMap(jsonString);

import 'dart:convert';

OrderRequest orderRequestFromMap(String str) =>
    OrderRequest.fromMap(json.decode(str));

String orderRequestToMap(OrderRequest data) => json.encode(data.toMap());

class OrderRequest {
  OrderRequest({
    required this.orderItems,
    required this.nroItems,
    required this.total,
  });

  final List<OrderItemRequest> orderItems;
  final int nroItems;
  final int total;

  OrderRequest copyWith({
    List<OrderItemRequest>? orderItems,
    int? nroItems,
    int? total,
  }) =>
      OrderRequest(
        orderItems: orderItems ?? this.orderItems,
        nroItems: nroItems ?? this.nroItems,
        total: total ?? this.total,
      );

  factory OrderRequest.fromMap(Map<String, dynamic> json) => OrderRequest(
        orderItems: List<OrderItemRequest>.from(
            json["orderItems"].map((x) => OrderItemRequest.fromMap(x))),
        nroItems: json["nroItems"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "orderItems": List<dynamic>.from(orderItems.map((x) => x.toMap())),
        "nroItems": nroItems,
        "total": total,
      };
}

class OrderItemRequest {
  OrderItemRequest({
    required this.idProducto,
    required this.nombre,
    required this.cantidad,
    required this.precio,
    required this.img,
  });

  final String idProducto;
  final String nombre;
  final int cantidad;
  final int precio;
  final String img;

  OrderItemRequest copyWith({
    String? idProducto,
    String? nombre,
    int? cantidad,
    int? precio,
    String? img,
  }) =>
      OrderItemRequest(
        idProducto: idProducto ?? this.idProducto,
        nombre: nombre ?? this.nombre,
        cantidad: cantidad ?? this.cantidad,
        precio: precio ?? this.precio,
        img: img ?? this.img,
      );

  factory OrderItemRequest.fromMap(Map<String, dynamic> json) =>
      OrderItemRequest(
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
