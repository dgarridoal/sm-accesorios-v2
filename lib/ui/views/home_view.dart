import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyect_sm_accesorios/providers/product_provider.dart';
import 'package:proyect_sm_accesorios/ui/cards/white_card.dart';
import 'package:proyect_sm_accesorios/ui/shared/widgets/card_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: productProvider.products.length,
        itemBuilder: (context, index) {
          return WhiteCard(
            child: CardItem(
              product: productProvider.products[index],
            ),
          );
        },
      ),
    );
  }
}
