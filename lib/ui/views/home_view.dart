import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyect_sm_accesorios/providers/auth_provider.dart';
import 'package:proyect_sm_accesorios/ui/cards/white_card.dart';
import 'package:proyect_sm_accesorios/ui/labels/custom_labels.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'Listado de productos',
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 20),
          WhiteCard(child: Text(authProvider.user!.email)),
        ],
      ),
    );
  }
}
