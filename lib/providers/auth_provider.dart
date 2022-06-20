import 'package:flutter/cupertino.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:proyect_sm_accesorios/router/router.dart';
import 'package:proyect_sm_accesorios/services/local_storage.dart';
import 'package:proyect_sm_accesorios/services/navigator_service.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated,
}

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  Future<bool> isAuthenticated() async {
    //TODO: Verificar el token con jwt_decoder: ^2.0.1
    final token = LocalStorage.prefs.getString('token');
    //JwtDecoder.isExpired(token!);
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
    //TODO: Backend
    await Future.delayed(const Duration(milliseconds: 1000));

    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }

  login(String email, String password) async {
    //TODO: peticion
    _token = 'lkasjelñaksdjflñaskdjfñlaskdjfaosldjfalksdjflasdjfla';
    LocalStorage.prefs.setString('token', _token!);

    authStatus = AuthStatus.authenticated;
    notifyListeners();
    NavigatorService.replaceTo(Flurorouter.dashboardRoute);
  }
}
