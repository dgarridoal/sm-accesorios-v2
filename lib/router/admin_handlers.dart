import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:proyect_sm_accesorios/providers/auth_provider.dart';
import 'package:proyect_sm_accesorios/ui/views/home_view.dart';

import 'package:proyect_sm_accesorios/ui/views/login_view.dart';

class AdminHandlers {
  static Handler login = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.notAuthenticated) {
      return const LoginView();
    } else {
      return const HomeView();
    }
  });
}
