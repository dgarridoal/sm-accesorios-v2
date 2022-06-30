import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String label;
  const CustomChip({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(50),
      ),
      height: 20,
      child: Text(
        label,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}
