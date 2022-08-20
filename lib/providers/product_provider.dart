import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:proyect_sm_accesorios/api/sm_accesorios_api.dart';
import 'package:proyect_sm_accesorios/models/http/index.dart';
import 'package:proyect_sm_accesorios/models/index.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];
  List<OrderItem> itemsStatistics = [];
  List<Map<OrderItem, int>> itemsStatisticsMap = [];
  List<Order> orders = [];

  String _search = '';

  set searchText(String value) {
    _search = value;
    notifyListeners();
  }

  get search => _search;

  getMayorCantidad() {
    int mayor = 0;
    for (var item in orders) {
      if (item.total > mayor) {
        mayor = item.total;
      }
    }
    return mayor;
  }

  List<Order> getOrderByMes() {
    List<Order> ordersByMes = [];
    for (var element in orders) {
      if (element.createdAt.month == DateTime.now().month) {
        ordersByMes.add(element);
      }
    }

    for (var i = 0; i < ordersByMes.length - 1; i++) {
      for (var j = 0; j < ordersByMes.length - 1; j++) {
        if (ordersByMes[j].createdAt.day > ordersByMes[j + 1].createdAt.day) {
          var aux = ordersByMes[j];
          ordersByMes[j] = ordersByMes[j + 1];
          ordersByMes[j + 1] = aux;
        }
      }
    }
    return ordersByMes;
  }

  Future<void> getProdStatistics() async {
    try {
      final resp = await SMAccesoriosApi.httpGet('/order');
      final ordersResponse = OrderResponse.fromMap(resp);

      orders = ordersResponse.orders;

      for (var order in orders) {
        for (var item in order.orderItems) {
          itemsStatistics = [...itemsStatistics, item];
        }
      }

      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  OrderItem? searchItemStatistic(String idProduct) {
    for (var item in itemsStatistics) {
      if (item.idProducto == idProduct) {
        return item;
      }
    }
    return null;
  }

  itemsMasVendidos() {
    var items = itemsStatistics.map((e) => e.idProducto).toSet().toList();

    Map<String, int> itemsMap = {};

    for (var item in items) {
      itemsMap.addAll({item: 0});
    }

    for (var item in itemsStatistics) {
      itemsMap.forEach((key, value) {
        if (key == item.idProducto) {
          itemsMap[key] = value + 1;
        }
      });
    }

    itemsMap.forEach((key, value) {
      itemsStatisticsMap = [
        ...itemsStatisticsMap,
        {searchItemStatistic(key)!: value}
      ];
    });
  }

  getTotalOrder() {
    int total = 0;
    for (var item in itemsStatistics) {
      total += item.precio;
    }
    return total;
  }

  getMenorPrecio() {
    var menor = itemsStatistics.first.precio;
    for (var item in itemsStatistics) {
      if (item.precio < menor) {
        menor = item.precio;
      }
    }
    return menor;
  }

  getPorcentajeMes() {
    List<Order> mesAnterior = [];
    List<Order> mesActual = [];
    for (var item in orders) {
      if (item.createdAt.month < DateTime.now().month) {
        mesAnterior.add(item);
      } else {
        mesActual.add(item);
      }
    }

    var totalAnterior = 0;
    for (var item in mesAnterior) {
      totalAnterior += item.total;
    }
    var totalActual = 0;
    for (var item in mesActual) {
      totalActual += item.total;
    }

    if (totalAnterior == 0) {
      return 100;
    }
    if (totalActual == 0) {
      return -100;
    }

    return ((totalActual / totalAnterior) - 1) * 100;
  }

  Future<void> getProducts() async {
    final resp = await SMAccesoriosApi.httpGet('/product');
    final productsResponse = ProductsResponse.fromMap(resp);
    products = [...productsResponse.products];
    notifyListeners();
  }

  Future<Product> getProductById(String id) async {
    try {
      final resp = await SMAccesoriosApi.httpGet('/product/$id');
      final productResponse = ProductResponse.fromMap(resp);
      return productResponse.product;
    } catch (e) {
      rethrow;
    }
  }

  Future<Product> newProduct(Product product) async {
    try {
      final data = {
        'categoria': List<String>.from(product.categoria.map((x) => x.id)),
        'stock': product.stock,
        'nombre': product.nombre,
        'descripcion': product.descripcion,
        'precioVenta': product.precioVenta,
        'precioCompra': product.precioCompra,
        'fechaVencimiento': product.fechaVencimiento,
        'id': product.id
      };

      final resp = await SMAccesoriosApi.httpPost('/product', data);
      final productResponse = ProductResponse.fromMap(resp);
      final newProduct = productResponse.product;
      products.add(newProduct);
      notifyListeners();
      return newProduct;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateImagen(XFile file, String id) async {
    try {
      final data = {
        'fileImg': MultipartFile.fromBytes(await file.readAsBytes(),
            filename: file.name)
      };
      await SMAccesoriosApi.httpPut('/upload/products/$id', data);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Product> updateProduct(Product product) async {
    try {
      final resp = await SMAccesoriosApi.httpPut(
          '/product/${product.id}', product.toMap());
      final productResponse = ProductResponse.fromMap(resp);
      final prod = productResponse.product;
      return prod;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteProduct(String id) async {
    try {
      // ignore: unused_local_variable
      final resp = await SMAccesoriosApi.httpDelete('/product/$id', {});

      products.removeWhere((product) => product.id == id);

      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }
}
