import 'package:flutter/material.dart';
import 'package:proyect_sm_accesorios/providers/sidebar_provider.dart';
import 'package:proyect_sm_accesorios/ui/shared/widgets/cart_bar.dart';
import 'package:proyect_sm_accesorios/ui/shared/widgets/navbar_avatar.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 0,
            offset: Offset(0, -10),
          ),
        ],
      ),
      height: 50,
      child: Row(
        children: [
          if (size.width < 700)
            IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  SidebarProvider.openMenu();
                }),

          const SizedBox(width: 20),
          TextFormField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              icon: Icon(Icons.search),
              hintText: 'Buscar',
              constraints: BoxConstraints(
                maxWidth: 200,
              ),
            ),
          ),
          const Spacer(),
          const CartBar(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 1,
            height: 25,
            color: Colors.black,
          ),
          //TODO: Reemplazar por el icono de usuario
          const NavbarAvatar(),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
