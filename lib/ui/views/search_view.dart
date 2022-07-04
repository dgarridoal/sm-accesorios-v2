import 'package:flutter/material.dart';

import 'package:proyect_sm_accesorios/ui/cards/index.dart';
import 'package:proyect_sm_accesorios/ui/labels/index.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'Buscador',
            style: CustomLabels.h1,
          ),
          //TODO: Crear los checkbox
          const WhiteCard(child: Text('Sección de selected')),
          const SizedBox(height: 20),
          Column(
            children: const [
              WhiteCard(
                child: Text('Resultado'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
