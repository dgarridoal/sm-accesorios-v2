import 'package:fluro/fluro.dart';

import 'package:provider/provider.dart';

import 'package:proyect_sm_accesorios/providers/index.dart';
import 'package:proyect_sm_accesorios/router/router.dart';
import 'package:proyect_sm_accesorios/ui/modals/index.dart';
import 'package:proyect_sm_accesorios/ui/views/index.dart';

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
  static Handler statistics = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);

      Provider.of<SidebarProvider>(context, listen: false)
          .setCurrentPage(Flurorouter.statisticsRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const StatisticsView();
      } else {
        return const LoginView();
      }
    },
  );
  static Handler search = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);

      Provider.of<SidebarProvider>(context, listen: false)
          .setCurrentPage(Flurorouter.searchRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const SearchView();
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
  static Handler products = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);

      Provider.of<SidebarProvider>(context, listen: false)
          .setCurrentPage(Flurorouter.productsRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const ProductView();
      } else {
        return const LoginView();
      }
    },
  );
  static Handler productView = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);

      Provider.of<SidebarProvider>(context, listen: false)
          .setCurrentPage(Flurorouter.productsRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        if (parameters['id']?.first != null) {
          return ProductModal(id: parameters['id']!.first);
        } else {
          return const ProductView();
        }
      } else {
        return const LoginView();
      }
    },
  );
  static Handler productNew = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);

      Provider.of<SidebarProvider>(context, listen: false)
          .setCurrentPage(Flurorouter.productsRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const ProductNewModal();
      } else {
        return const LoginView();
      }
    },
  );
  static Handler cart = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      final cartProvider = Provider.of<CartProvider>(context);
      Provider.of<SidebarProvider>(context, listen: false)
          .setCurrentPage(Flurorouter.cartRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        if (cartProvider.items.isEmpty) {
          return const HomeView();
        } else {
          return const CartView();
        }
      } else {
        return const LoginView();
      }
    },
  );
  static Handler profile = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SidebarProvider>(context, listen: false)
          .setCurrentPage(Flurorouter.profileRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const ProfileView();
      } else {
        return const LoginView();
      }
    },
  );
}
