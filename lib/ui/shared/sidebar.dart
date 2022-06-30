import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:proyect_sm_accesorios/providers/index.dart';
import 'package:proyect_sm_accesorios/router/router.dart';
import 'package:proyect_sm_accesorios/services/index.dart';
import 'package:proyect_sm_accesorios/ui/shared/widgets/index.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  void navigateTo(String routeName) {
    NavigatorService.navigateTo(routeName);
    SidebarProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final sidebarProvider = Provider.of<SidebarProvider>(context);

    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(height: 70),
          const TextSeparator(text: 'Dashboard'),
          CustomMenuItem(
            isActive: sidebarProvider.currentPage == Flurorouter.dashboardRoute,
            text: 'Inicio',
            icon: Icons.home,
            onPressed: () {
              navigateTo(Flurorouter.dashboardRoute);
            },
          ),
          CustomMenuItem(
            text: 'Estadísticas',
            icon: Icons.analytics_outlined,
            onPressed: () => SidebarProvider.closeMenu(),
          ),
          CustomMenuItem(
              isActive:
                  sidebarProvider.currentPage == Flurorouter.categoryRoute,
              text: 'Categorías',
              icon: Icons.view_in_ar_outlined,
              onPressed: () {
                navigateTo(Flurorouter.categoryRoute);
              }),
          CustomMenuItem(
            text: 'Productos',
            icon: Icons.local_mall_outlined,
            onPressed: () {
              navigateTo(Flurorouter.productsRoute);
            },
            isActive: sidebarProvider.currentPage == Flurorouter.productsRoute,
          ),
          const SizedBox(height: 70),
          const TextSeparator(text: 'Sesión'),
          CustomMenuItem(
              text: 'Salir',
              icon: Icons.logout_outlined,
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
              })
        ],
      ),
    );
  }

  BoxDecoration buildDecoration() => const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF3F8AE0),
              Color(0xFF00BFA5),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 8),
              blurRadius: 8,
            ),
          ]);
}
