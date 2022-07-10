import 'package:flutter/material.dart';

import 'package:proyect_sm_accesorios/ui/cards/index.dart';
import 'package:proyect_sm_accesorios/ui/labels/index.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'Perfil',
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 20),
          const WhiteCard(child: Text('Perfil de usuario')),
        ],
      ),
    );
  }
}
