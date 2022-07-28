import 'package:flutter/material.dart';

import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:proyect_sm_accesorios/api/sm_accesorios_api.dart';
import 'package:proyect_sm_accesorios/models/http/index.dart';
import 'package:proyect_sm_accesorios/models/index.dart';
import 'package:proyect_sm_accesorios/router/router.dart';
import 'package:proyect_sm_accesorios/services/index.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated,
}

class AuthProvider extends ChangeNotifier {
  AuthStatus authStatus = AuthStatus.checking;
  User? user;

  AuthProvider() {
    isAuthenticated();
  }

  Future<bool> isAuthenticated() async {
    authStatus = AuthStatus.checking;
    final token = LocalStorage.prefs.getString('token');

    if (token != null) {
      final isExpired = JwtDecoder.isExpired(token);
      if (isExpired) {
        authStatus = AuthStatus.notAuthenticated;
        notifyListeners();
        return false;
      }

      user = User.fromJson(LocalStorage.prefs.getString('user')!);

      authStatus = AuthStatus.authenticated;
      SMAccesoriosApi.configureDio();
      notifyListeners();
      return true;
    } else {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  login(String email, String password) async {
    authStatus = AuthStatus.checking;
    final data = {
      'email': email,
      'password': password,
    };

    SMAccesoriosApi.httpPost('/auth/login', data).then((json) {
      authStatus = AuthStatus.authenticated;
      NotificationService.showSnackbarSuccess(
          'Éxito', 'Inicio de sesión exitoso, tenga un buen día');
      final loginResponse = LoginResponse.fromMap(json);
      user = loginResponse.user;

      LocalStorage.prefs.setString('token', loginResponse.token);
      LocalStorage.prefs.setString('user', loginResponse.user.toJson());
      NavigatorService.replaceTo(Flurorouter.dashboardRoute);
      SMAccesoriosApi.configureDio();
      notifyListeners();
    }).catchError((error) {
      print(error);
      authStatus = AuthStatus.notAuthenticated;
      NotificationService.showSnackbarError(
          'Error', 'Error al iniciar sesión, vuelve a intentarlo');
    });
  }

  logout() {
    LocalStorage.prefs.remove('token');
    LocalStorage.prefs.remove('user');
    authStatus = AuthStatus.notAuthenticated;
    user = null;
    notifyListeners();
  }
}
