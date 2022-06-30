import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:proyect_sm_accesorios/api/sm_accesorios_api.dart';
import 'package:proyect_sm_accesorios/models/http/index.dart';
import 'package:proyect_sm_accesorios/models/index.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];

  Future<void> getProducts() async {
    final resp = await SMAccesoriosApi.httpGet('/product');
    final productsResponse = ProductsResponse.fromMap(resp);
    products = [...productsResponse.products];
    notifyListeners();
  }

  searchProduct(Product product) {
    products.map((prod) {
      if (prod.id == product.id) {
        return product;
      }
    });
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

  Future<bool> updateProduct(Product product) async {
    try {
      final data = {
        'categoria': [product.categoria],
        'stock': product.stock,
        'nombre': product.nombre,
        'descripcion': product.descripcion,
        'precioVenta': product.precioVenta,
        'precioCompra': product.precioCompra,
        'fechaVencimiento': product.fechaVencimiento,
        'id': product.id
      };
      // ignore: unused_local_variable
      final resp =
          await SMAccesoriosApi.httpPut('/product/${product.id}', data);

      products = products.map((prod) {
        if (prod.id != product.id) {
          return prod;
        }
        prod = prod;
        return prod;
      }).toList();

      notifyListeners();
      return true;
    } catch (e) {
      return false;
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
