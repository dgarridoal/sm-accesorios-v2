import 'package:flutter/material.dart';
import 'package:proyect_sm_accesorios/api/sm_accesorios_api.dart';
import 'package:proyect_sm_accesorios/models/category_model.dart';
import 'package:proyect_sm_accesorios/models/http/categories_response.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Category> categories = [];
  getCategories() async {
    final resp = await SMAccesoriosApi.httpGet('/category');
    final categoriesResponse = CategoriesResponse.fromMap(resp);
    categories = [...categoriesResponse.categories];
    notifyListeners();
  }
}
