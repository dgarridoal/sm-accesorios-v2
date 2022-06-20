import 'package:flutter/material.dart';
import 'package:proyect_sm_accesorios/ui/shared/widgets/logo.dart';
import 'package:proyect_sm_accesorios/ui/shared/widgets/menu_item.dart';
import 'package:proyect_sm_accesorios/ui/shared/widgets/text_separator.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          CustomMenuItem(text: 'Inicio', icon: Icons.home, onPressed: () {}),
          CustomMenuItem(
              text: 'Estadísticas',
              icon: Icons.analytics_outlined,
              onPressed: () {}),
          const TextSeparator(text: 'Categorías'),
          CustomMenuItem(
              text: 'Listar', icon: Icons.inventory_outlined, onPressed: () {}),
          CustomMenuItem(text: 'Crear', icon: Icons.add, onPressed: () {}),
          const TextSeparator(text: 'Productos'),
          CustomMenuItem(
              text: 'Listar', icon: Icons.list_outlined, onPressed: () {}),
          CustomMenuItem(
              text: 'Crear', icon: Icons.add_outlined, onPressed: () {}),
          const SizedBox(height: 70),
          const TextSeparator(text: 'Sesión'),
          CustomMenuItem(
              text: 'Salir', icon: Icons.logout_outlined, onPressed: () {})
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
