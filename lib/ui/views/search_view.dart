import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:proyect_sm_accesorios/providers/index.dart';

import 'package:proyect_sm_accesorios/ui/cards/index.dart';
import 'package:proyect_sm_accesorios/ui/labels/index.dart';
import 'package:proyect_sm_accesorios/ui/shared/widgets/card_item.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'Buscador',
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 20),
          WhiteCard(
            child: TextFormField(
              decoration: const InputDecoration(
                label: Text('Buscar'),
              ),
              onChanged: (value) => productProvider.searchText = value,
            ),
          ),
          const SizedBox(height: 20),
          ...productProvider.products.map((product) {
            if (product.nombre.toLowerCase().contains(productProvider.search) ||
                product.descripcion
                    .toLowerCase()
                    .contains(productProvider.search) ||
                product.categoria.any((categoria) => categoria.nombre
                    .toLowerCase()
                    .contains(productProvider.search))) {
              return WhiteCard(child: CardItem(product: product));
            }
            return Container();
          }).toList(),
        ],
      ),
    );
  }
}
