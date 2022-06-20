import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:proyect_sm_accesorios/core/theme/app_theme.dart';
import 'package:proyect_sm_accesorios/providers/auth_provider.dart';
import 'package:proyect_sm_accesorios/router/router.dart';
import 'package:proyect_sm_accesorios/services/local_storage.dart';
import 'package:proyect_sm_accesorios/services/navigator_service.dart';
import 'package:proyect_sm_accesorios/ui/layouts/auth/auth_layout.dart';
import 'package:proyect_sm_accesorios/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:proyect_sm_accesorios/ui/shared/custom_loading_splash.dart';

void main() async {
  await LocalStorage.configurePrefs();
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
      onGenerateRoute: Flurorouter.router.generator,
      builder: (_, child) {
        final authProvider = Provider.of<AuthProvider>(context);

        if (authProvider.authStatus == AuthStatus.checking) {
          return const Center(child: LoadingSplash());
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
