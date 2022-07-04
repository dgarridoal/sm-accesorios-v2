import 'package:dio/dio.dart';

import 'package:proyect_sm_accesorios/services/index.dart';

class SMAccesoriosApi {
  static final Dio _dio = Dio();

  static void configureDio() {
    //https://sm-accesorios-backend.herokuapp.com/api
    _dio.options.baseUrl = 'https://sm-accesorios-backend.herokuapp.com/api';
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? '',
    };
  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);
      return resp.data;
    } catch (e) {
      throw ('Error al obtener los datos');
    }
  }

  static Future httpPost(String path, Map<String, dynamic> data) async {
    try {
      final formData = FormData.fromMap(data);
      final resp = await _dio.post(path, data: formData);
      return resp.data;
    } catch (e) {
      throw ('Error al crear los datos');
    }
  }

  static Future httpPut(String path, Map<String, dynamic> data) async {
    try {
      final formData = FormData.fromMap(data);
      final resp = await _dio.put(path, data: formData);
      return resp.data;
    } catch (e) {
      throw ('Error al actualizar los datos');
    }
  }

  static Future httpDelete(String path, Map<String, dynamic> data) async {
    try {
      final formData = FormData.fromMap(data);
      final resp = await _dio.delete(path, data: formData);
      return resp.data;
    } catch (e) {
      throw ('Error al borrar los datos');
    }
  }
}
