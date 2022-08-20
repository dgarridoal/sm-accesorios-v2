import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyect_sm_accesorios/models/http/index.dart';

import 'package:proyect_sm_accesorios/models/index.dart';

import '../services/index.dart';

class CartProvider extends ChangeNotifier {
  List<CartItemModel> items = [];
  List<OrderItemRequest> itemsRequest = [];

  get totalCount => items.length;

  addToCart(Product product) {
    final item = CartItemModel(
      id: product.id,
      nombre: product.nombre,
      precio: product.precioVenta,
      imagen: product.imgUrl,
      stock: product.stock,
    );
    var band = false;

    items.map((i) {
      if (i.id == item.id) {
        i.quantity = item.quantity;
        band = true;
      }
    });

    if (!band) {
      items.add(item);
    }
    notifyListeners();
  }

  convertCartToOrder() {
    for (var item in items) {
      final order = OrderItemRequest(
          cantidad: item.quantity,
          precio: item.precio,
          idProducto: item.id,
          nombre: item.nombre,
          img: item.imagen);
      itemsRequest.add(order);
    }
  }

  Future<bool> payment() async {
    try {
      convertCartToOrder();
      final data = OrderRequest(
              orderItems: [...itemsRequest],
              nroItems: totalCountItem(),
              total: totalPrice())
          .toMap();
      /* final resp = await SMAccesoriosApi.httpPost('/order/payment', data);

      final orderResponse = OrderResponse.fromMap(resp); */

      var url = Uri.parse(
          'https:sm-accesorios-backend.herokuapp.com/api/order/payment');

      final resp = await http.post(url, body: jsonEncode(data), headers: {
        'Accept': 'application/json, text/plain, */*',
        'x-token': LocalStorage.prefs.getString('token') ?? '',
        'Content-Type': 'application/json',
      });

      if (resp.statusCode == 200) {
        items.clear();
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      itemsRequest.clear();
      return false;
    }
  }

  int totalPrice() {
    int total = 0;
    for (var item in items) {
      total += item.precio * item.quantity;
    }
    return total;
  }

  int totalCountItem() {
    int total = 0;
    for (var item in items) {
      total += item.quantity;
    }
    return total;
  }

  cleanCart() {
    items.clear();
    notifyListeners();
  }

  removeFromCart(CartItemModel item) {
    items.remove(item);
    notifyListeners();
  }

  addCounter(CartItemModel item) {
    item.quantity++;
    notifyListeners();
  }

  removeCounter(CartItemModel item) {
    item.quantity--;
    notifyListeners();
  }
}
