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
  static String categoryRoute = '/dashboard/categories';
  static String productsRoute = '/dashboard/products';
  static String productViewRoute = '/dashboard/products/view';

  static void configureRoutes() {
    //Auth routes
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.fadeIn);
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.fadeIn);

    //Dashboard routes
    router.define(dashboardRoute,
        handler: DashboardHandlers.dashboard,
        transitionType: TransitionType.fadeIn);

    router.define(categoryRoute,
        handler: DashboardHandlers.categories,
        transitionType: TransitionType.fadeIn);

    router.define(productsRoute,
        handler: DashboardHandlers.products,
        transitionType: TransitionType.fadeIn);

    router.define(productViewRoute,
        handler: DashboardHandlers.productView,
        transitionType: TransitionType.fadeIn);

    router.notFoundHandler = NotPageFoundHandler.notFoundHandler;
  }
}
