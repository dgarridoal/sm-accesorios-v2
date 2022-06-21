import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:proyect_sm_accesorios/providers/auth_provider.dart';
import 'package:proyect_sm_accesorios/providers/sidebar_provider.dart';

import 'package:proyect_sm_accesorios/router/router.dart';
import 'package:proyect_sm_accesorios/ui/views/category_view.dart';

import 'package:proyect_sm_accesorios/ui/views/home_view.dart';
import 'package:proyect_sm_accesorios/ui/views/login_view.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);

      Provider.of<SidebarProvider>(context, listen: false)
          .setCurrentPage(Flurorouter.dashboardRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const HomeView();
      } else {
        return const LoginView();
      }
    },
  );
  static Handler categories = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);

      Provider.of<SidebarProvider>(context, listen: false)
          .setCurrentPage(Flurorouter.categoryRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const CategoryView();
      } else {
        return const LoginView();
      }
    },
  );
}
