import 'package:fluro/fluro.dart';

import 'package:proyect_sm_accesorios/router/admin_handlers.dart';
import 'package:proyect_sm_accesorios/router/dashboard_handlers.dart';
import 'package:proyect_sm_accesorios/router/not_page_found_handler.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  // Search
  static String searchRoute = '/dashboard/search';

  //Auth router
  static String loginRoute = '/auth/login';

  //Dashboard router
  static String dashboardRoute = '/dashboard';
  static String statisticsRoute = '/dashboard/statistics';
  static String categoryRoute = '/dashboard/categories';
  static String productsRoute = '/dashboard/products';
  static String productsNewRoute = '/dashboard/products/new';
  static String productViewRoute = '/dashboard/products/view/:id';
  static String cartRoute = '/dashboard/cart';

  //Profile router
  static String profileRoute = '/user/profile';

  static void configureRoutes() {
    //Search routes
    router.define(searchRoute,
        handler: DashboardHandlers.search,
        transitionType: TransitionType.fadeIn);

    //Auth routes
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.fadeIn);
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.fadeIn);

    //Dashboard routes
    router.define(dashboardRoute,
        handler: DashboardHandlers.dashboard,
        transitionType: TransitionType.fadeIn);

    router.define(statisticsRoute,
        handler: DashboardHandlers.statistics,
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

    router.define(productsNewRoute,
        handler: DashboardHandlers.productNew,
        transitionType: TransitionType.fadeIn);

    router.define(cartRoute,
        handler: DashboardHandlers.cart, transitionType: TransitionType.fadeIn);

    //Profile
    router.define(profileRoute,
        handler: DashboardHandlers.profile,
        transitionType: TransitionType.fadeIn);

    router.notFoundHandler = NotPageFoundHandler.notFoundHandler;
  }
}
