import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyect_sm_accesorios/datatables/products_datasource.dart';
import 'package:proyect_sm_accesorios/providers/product_provider.dart';
import 'package:proyect_sm_accesorios/router/router.dart';
import 'package:proyect_sm_accesorios/services/navigator_service.dart';
import 'package:proyect_sm_accesorios/ui/labels/custom_labels.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
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
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'Productos',
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 20),
          PaginatedDataTable(
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Nombre')),
              DataColumn(label: Text('Stock')),
              DataColumn(label: Text('Acciones')),
            ],
            source: ProductsDataSource(productProvider.products, context),
            header: const Text(''),
            actions: [
              TextButton.icon(
                icon: const Icon(
                  Icons.add_outlined,
                  color: Colors.purple,
                ),
                label: const Text(
                  'Agregar',
                  style: TextStyle(color: Colors.purple),
                ),
                onPressed: () {
                  NavigatorService.navigateTo(Flurorouter.productViewRoute);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
