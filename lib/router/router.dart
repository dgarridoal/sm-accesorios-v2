import 'package:fluro/fluro.dart';
import 'package:proyect_sm_accesorios/router/admin_handlers.dart';
import 'package:proyect_sm_accesorios/router/dashboard_handlers.dart';
import 'package:proyect_sm_accesorios/router/not_page_found_handler.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  //Auth router
  static String loginRoute = '/auth/login';

  //Dashboard router
  static String dashboardRoute = '/dashboard';

  static void configureRoutes() {
    //Auth routes
    router.define(loginRoute, handler: AdminHandlers.login);

    //Dashboard routes
    router.define(dashboardRoute, handler: DashboardHandlers.dashboard);

    router.notFoundHandler = NotPageFoundHandler.notFoundHandler;
  }
}
