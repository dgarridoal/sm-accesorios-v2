import 'package:flutter/material.dart';

class CartBar extends StatelessWidget {
  const CartBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: Colors.blue[900],
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Center(
                child: Text(
              '3',
              style: TextStyle(fontSize: 10, color: Colors.white),
            )),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}
