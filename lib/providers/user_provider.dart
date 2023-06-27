import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
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

  Map<String, String> userData = {
    'password': '',
    'confirmPassword': '',
    'newPassword': '',
    'confirmNewPassword': '',
  };

  Future<bool> updateUser(User user) async {
    try {
      final data = {
        'nombre': user.nombre,
        'apellido': user.apellido,
        'email': user.email,
        'password': userData['password'],
        'confirmPassword': userData['confirmPassword'],
        'newPassword': userData['newPassword'],
      };
      final url = Uri.parse(
          'https://proyect-backend-sm-production.up.railway.app/api/user/update/${user.id}');

      final resp = await http.post(url, body: jsonEncode(data), headers: {
        'Accept': 'application/json, text/plain, */*',
        'x-token': LocalStorage.prefs.getString('token') ?? '',
        'Content-Type': 'application/json',
      });

      if (resp.statusCode == 200) {
        LocalStorage.prefs.setString('user', jsonEncode(user.toJson()));
        return true;
      } else {
        return true;
      }
    } catch (e) {
      return true;
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
