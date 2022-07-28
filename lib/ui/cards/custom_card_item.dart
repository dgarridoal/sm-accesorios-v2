import 'package:flutter/material.dart';

class CustomCardItem extends StatelessWidget {
  final Color color;
  final Widget child;
  const CustomCardItem({
    Key? key,
    required this.color,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        gradient: LinearGradient(
          colors: [color, color.withOpacity(0.7)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: child,
    );
  }
}
