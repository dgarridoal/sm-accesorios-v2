import 'package:flutter/material.dart';

import 'package:proyect_sm_accesorios/ui/labels/index.dart';

class WhiteCard extends StatelessWidget {
  final Widget child;
  final String? title;
  const WhiteCard({Key? key, required this.child, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      decoration: buildDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            FittedBox(
              fit: BoxFit.contain,
              child: Text(
                title!,
                style: CustomLabels.h1,
              ),
            ),
            const Divider(),
          ],
          child,
        ],
      ),
    );
  }

  BoxDecoration buildDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
          ),
        ],
      );
}
