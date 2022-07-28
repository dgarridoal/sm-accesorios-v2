import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyect_sm_accesorios/api/sm_accesorios_api.dart';
import 'package:proyect_sm_accesorios/models/index.dart';
import 'package:proyect_sm_accesorios/services/index.dart';

class UserProvider extends ChangeNotifier {
  bool _isEditable = false;
  bool get isEditable => _isEditable;
  set isEditable(bool value) {
    _isEditable = value;
    notifyListeners();
  }

  final User _user = User.fromJson(LocalStorage.prefs.getString('user')!);

  User get user => _user;

//TODO: Implementar el metodo para actualizar el usuario
  Future<User?> updateUser(User user) async {
    try {
      final data = {
        'nombre': user.nombre,
        'apellido': user.apellido,
        'email': user.email,
        'password': user.email,
      };
      /* final data = {
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
      products.add(newProduct); */
      notifyListeners();
      // return newProduct;
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
      await SMAccesoriosApi.httpPut('/upload/admin/$id', data);
      return true;
    } catch (e) {
      return false;
    }
  }
}
