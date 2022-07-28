import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProdcutInfoCard extends StatelessWidget {
  const ProdcutInfoCard({
    Key? key,
    required this.title,
    required this.count,
    required this.price,
  }) : super(key: key);

  final String title;
  final int price, count;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
            width: 2, color: const Color(0xFF2697FF).withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(
            height: 20,
            width: 20,
            child: Icon(Icons.shopping_bag_outlined),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    NumberFormat.currency(
                            locale: 'es-cl', decimalDigits: 0, symbol: 'CLP')
                        .format(price),
                    style: Theme.of(context).textTheme.caption!,
                  ),
                ],
              ),
            ),
          ),
          Text('$count'),
        ],
      ),
    );
  }
}
