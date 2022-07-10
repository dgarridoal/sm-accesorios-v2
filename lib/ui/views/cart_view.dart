import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

import 'package:proyect_sm_accesorios/providers/index.dart';
import 'package:proyect_sm_accesorios/router/router.dart';
import 'package:proyect_sm_accesorios/services/index.dart';
import 'package:proyect_sm_accesorios/ui/cards/index.dart';
import 'package:proyect_sm_accesorios/ui/labels/index.dart';
import 'package:proyect_sm_accesorios/ui/shared/widgets/index.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: [
                  Text(
                    'Carrito listo para vender',
                    style: CustomLabels.h1,
                  ),
                  const SizedBox(height: 20),
                  ...cartProvider.items.map((product) => WhiteCard(
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              width: 150,
                              height: 150,
                              child: FadeInImage.assetNetwork(
                                image: product.imagen,
                                placeholder: 'assets/img/no-image.jpg',
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.nombre,
                                  style: CustomLabels.h2,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text('Disponibilidad: ${product.stock}'),
                                ItemCounter(
                                  counter: product.quantity,
                                  removeOnpressed: product.quantity > 1
                                      ? () {
                                          cartProvider.removeCounter(product);
                                        }
                                      : () {},
                                  addOnPressed:
                                      product.quantity <= product.stock - 1
                                          ? () {
                                              cartProvider.addCounter(product);
                                            }
                                          : () {},
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.attach_money_outlined),
                                    Text(
                                      NumberFormat.currency(
                                              locale: 'es-cl',
                                              decimalDigits: 0,
                                              symbol: 'CLP')
                                          .format(product.precio),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    cartProvider.removeFromCart(product);
                                  },
                                  child: const Text('Remover'),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: WhiteCard(
              title: 'Orden',
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Nro. productos'),
                        Text('${cartProvider.totalCountItem()}'),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.attach_money_outlined),
                            Text(
                              NumberFormat.currency(
                                      locale: 'es-cl',
                                      decimalDigits: 0,
                                      symbol: 'CLP')
                                  .format(cartProvider.totalPrice()),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            primary: Colors.green,
                            padding: const EdgeInsets.all(15),
                            side: const BorderSide(
                              color: Colors.green,
                              width: 1,
                            ),
                          ),
                          onPressed: () {},
                          icon:
                              const Icon(Icons.shopping_cart_checkout_outlined),
                          label: const Text('Hacer compra'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            primary: Colors.red,
                            padding: const EdgeInsets.all(15),
                            side: const BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                          onPressed: () {
                            NavigatorService.navigateTo(
                                Flurorouter.dashboardRoute);
                            cartProvider.cleanCart();
                          },
                          icon: const Icon(Icons.remove_shopping_cart_outlined),
                          label: const Text('Deshacer compra'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
