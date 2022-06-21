import 'package:dio/dio.dart';
import 'package:proyect_sm_accesorios/services/local_storage.dart';

class SMAccesoriosApi {
  static final Dio _dio = Dio();

  static void configureDio() {
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
      throw ('Error al obtener los datos');
    }
  }
}
