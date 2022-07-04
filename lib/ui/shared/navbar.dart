import 'package:flutter/material.dart';

import 'package:proyect_sm_accesorios/ui/shared/widgets/index.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const CartBar(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 1,
            height: 25,
            color: Colors.black,
          ),
          const NavbarAvatar(),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
