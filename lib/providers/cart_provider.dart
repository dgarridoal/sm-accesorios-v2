import 'package:flutter/material.dart';

import 'package:proyect_sm_accesorios/models/index.dart';

class CartProvider extends ChangeNotifier {
  List<CartItemModel> items = [];

  get totalCount => items.length;

  addToCart(Product product) {
    final item = CartItemModel(
      id: product.id,
      nombre: product.nombre,
      precio: product.precioVenta,
      imagen: product.imgUrl,
      stock: product.stock,
    );
    items.add(item);
    notifyListeners();
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
