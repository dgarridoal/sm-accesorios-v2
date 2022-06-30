import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proyect_sm_accesorios/models/product_model.dart';
import 'package:proyect_sm_accesorios/ui/labels/custom_labels.dart';
import 'package:proyect_sm_accesorios/ui/shared/widgets/custom_chip.dart';
import 'package:proyect_sm_accesorios/ui/shared/widgets/item_counter.dart';

class CardItem extends StatelessWidget {
  final Product product;
  const CardItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          width: 150,
          height: 150,
          child: FadeInImage.assetNetwork(
            image: product.imgUrl,
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
            Text(
              product.descripcion,
              style: CustomLabels.subTitle1,
            ),
            const SizedBox(
              height: 15,
            ),
            Wrap(
              children: [
                ...product.categoria.map(
                  (e) => Container(
                    margin: const EdgeInsets.all(8),
                    child: CustomChip(label: e.nombre),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text('Disponibilidad: ${product.stock}'),
            product.stock >= 1
                ? ItemCounter(
                    removeOnpressed: () {},
                    counter: 1,
                    addOnPressed: () {},
                  )
                : Container(),
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
                          locale: 'es-cl', decimalDigits: 0, symbol: 'CLP')
                      .format(product.precioVenta),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            product.stock >= 1
                ? ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Icon(Icons.shopping_cart_outlined),
                        Text(' Agregar'),
                      ],
                    ),
                  )
                : Container(),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              constraints: const BoxConstraints(maxWidth: 80),
              decoration: BoxDecoration(
                color: (product.stock <= 0)
                    ? Colors.red
                    : product.stock < 10
                        ? Colors.amber
                        : Colors.green,
                borderRadius: BorderRadius.circular(5),
              ),
              child: FittedBox(
                child: (product.stock <= 0)
                    ? const Text('Sin stock')
                    : product.stock < 10
                        ? const Text('Poco stock')
                        : const Text('Disponible'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
