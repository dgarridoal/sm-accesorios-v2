import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:proyect_sm_accesorios/models/index.dart';
import 'package:proyect_sm_accesorios/providers/index.dart';
import 'package:proyect_sm_accesorios/router/router.dart';
import 'package:proyect_sm_accesorios/services/index.dart';

class ProductsDataSource extends DataTableSource {
  final List<Product> products;
  final BuildContext context;

  ProductsDataSource(this.products, this.context);

  @override
  DataRow getRow(int index) {
    final product = products[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('${index + 1}')),
        DataCell(Text(product.nombre)),
        DataCell(Text('${product.stock}')),
        DataCell(Row(
          children: [
            IconButton(
                onPressed: () {
                  NavigatorService.navigateTo(Flurorouter.productViewRoute);
                },
                icon: const Icon(
                  Icons.edit_outlined,
                  color: Colors.blue,
                )),
            IconButton(
                onPressed: () {
                  final alert = AlertDialog(
                    title: const Text('¿Está seguro de borrarlo ?'),
                    content: Text(
                        '¿Desea eliminar la categoría: ${product.nombre} ?'),
                    actions: [
                      TextButton(
                        child: const Text('Cancelar'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Si, eliminar'),
                        onPressed: () async {
                          final resp = await Provider.of<ProductProvider>(
                                  context,
                                  listen: false)
                              .deleteProduct(product.id);
                          resp
                              ? NotificationService.showSnackbarSuccess(
                                  'Exitoso', 'Se ha eliminado correctamente')
                              : NotificationService.showSnackbarError('Error',
                                  'No se ha podido eliminar la categoría');
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                  showDialog(context: context, builder: (_) => alert);
                },
                icon: const Icon(
                  Icons.delete_outlined,
                  color: Colors.red,
                )),
          ],
        )),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => products.length;

  @override
  int get selectedRowCount => 0;
}
