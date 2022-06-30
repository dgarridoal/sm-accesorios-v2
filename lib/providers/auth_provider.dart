import 'package:flutter/cupertino.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:proyect_sm_accesorios/api/sm_accesorios_api.dart';
import 'package:proyect_sm_accesorios/models/http/login_response.dart';
import 'package:proyect_sm_accesorios/models/user_model.dart';
import 'package:proyect_sm_accesorios/router/router.dart';
import 'package:proyect_sm_accesorios/services/local_storage.dart';
import 'package:proyect_sm_accesorios/services/navigator_service.dart';
import 'package:proyect_sm_accesorios/services/notification_service.dart';

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
    notifyListeners();
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
