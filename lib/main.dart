import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:proyect_sm_accesorios/api/sm_accesorios_api.dart';
import 'package:proyect_sm_accesorios/core/index.dart';
import 'package:proyect_sm_accesorios/providers/index.dart';
import 'package:proyect_sm_accesorios/router/router.dart';
import 'package:proyect_sm_accesorios/services/index.dart';
import 'package:proyect_sm_accesorios/ui/layouts/auth/index.dart';
import 'package:proyect_sm_accesorios/ui/layouts/dashboard/index.dart';
import 'package:proyect_sm_accesorios/ui/shared/index.dart';

void main() async {
  await LocalStorage.configurePrefs();
  SMAccesoriosApi.configureDio();
  Flurorouter.configureRoutes();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => SidebarProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeCustom.lightTheme,
      title: 'S&M Accesorios App',
      initialRoute: Flurorouter.loginRoute,
      navigatorKey: NavigatorService.navigatorKey,
      scaffoldMessengerKey: NotificationService.scaffoldMessengerKey,
      onGenerateRoute: Flurorouter.router.generator,
      builder: (_, child) {
        final authProvider = Provider.of<AuthProvider>(context);

        if (authProvider.authStatus == AuthStatus.checking) {
          return const Center(child: CustomLoadingSplash());
        }
        if (authProvider.authStatus == AuthStatus.notAuthenticated) {
          return AuthLayout(child: child!);
        } else {
          return DashboardLayout(child: child!);
        }
      },
    );
  }
}
