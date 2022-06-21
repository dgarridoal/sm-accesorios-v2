import 'package:flutter/material.dart';
import 'package:proyect_sm_accesorios/ui/cards/white_card.dart';
import 'package:proyect_sm_accesorios/ui/labels/custom_labels.dart';

class BlankView extends StatelessWidget {
  const BlankView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'Blank View',
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 20),
          const WhiteCard(child: Text('White Card')),
        ],
      ),
    );
  }
}
