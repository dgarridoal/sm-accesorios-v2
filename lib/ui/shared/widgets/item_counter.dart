import 'package:flutter/material.dart';

class ItemCounter extends StatelessWidget {
  final int counter;
  final Function removeOnpressed;
  final Function addOnPressed;

  const ItemCounter({
    Key? key,
    required this.counter,
    required this.removeOnpressed,
    required this.addOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () => removeOnpressed()),
        Text('$counter'),
        IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () => addOnPressed()),
      ],
    );
  }
}
