import 'package:flutter/material.dart';

import 'package:proyect_sm_accesorios/api/sm_accesorios_api.dart';
import 'package:proyect_sm_accesorios/models/http/index.dart';
import 'package:proyect_sm_accesorios/models/index.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> categories = [];
  getCategories() async {
    final resp = await SMAccesoriosApi.httpGet('/category');
    final categoriesResponse = CategoriesResponse.fromMap(resp);
    categories = [...categoriesResponse.categories];
    notifyListeners();
  }

  Future<bool> newCategory(String nombre) async {
    try {
      final data = {'nombre': nombre};
      final resp = await SMAccesoriosApi.httpPost('/category', data);
      final categoryResponse = CategoryResponse.fromMap(resp);
      final newCategory = categoryResponse.category;
      categories.add(newCategory);
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateCategory(String nombre, String id) async {
    try {
      final data = {'nombre': nombre};
      // ignore: unused_local_variable
      final resp = await SMAccesoriosApi.httpPut('/category/$id', data);

      categories = categories.map((category) {
        if (category.id != id) {
          return category;
        }
        category.nombre = nombre;
        return category;
      }).toList();

      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteCategory(String id) async {
    try {
      // ignore: unused_local_variable
      final resp = await SMAccesoriosApi.httpDelete('/category/$id', {});

      categories.removeWhere((category) => category.id == id);

      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }
}
