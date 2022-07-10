import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:proyect_sm_accesorios/providers/index.dart';
import 'package:proyect_sm_accesorios/router/router.dart';
import 'package:proyect_sm_accesorios/services/index.dart';

class CartBar extends StatelessWidget {
  const CartBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return cartProvider.totalCount > 0
        ? Stack(
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
                  child: Center(
                      child: Text(
                    '${cartProvider.totalCount}',
                    style: const TextStyle(fontSize: 10, color: Colors.white),
                  )),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () =>
                    NavigatorService.navigateTo(Flurorouter.cartRoute),
              ),
            ],
          )
        : IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          );
  }
}
