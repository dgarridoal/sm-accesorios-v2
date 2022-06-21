import 'package:flutter/material.dart';
import 'package:proyect_sm_accesorios/models/category_model.dart';

class CategoriesDatasource extends DataTableSource {
  final List<Category> categories;
  final BuildContext context;

  CategoriesDatasource(this.categories, this.context);

  @override
  DataRow getRow(int index) {
    final category = categories[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('${index + 1}')),
        DataCell(Text(category.nombre)),
        DataCell(Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit_outlined,
                  color: Colors.amber,
                )),
            IconButton(
                onPressed: () {
                  final alert = AlertDialog(
                    title: const Text('¿Está seguro de borrarlo ?'),
                    content: Text(
                        '¿Desea eliminar la categoría: ${category.nombre} ?'),
                    actions: [
                      TextButton(
                        child: const Text('Cancelar'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Si, eliminar'),
                        onPressed: () {
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
  int get rowCount => categories.length;

  @override
  int get selectedRowCount => 0;
}
