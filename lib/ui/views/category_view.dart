import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:proyect_sm_accesorios/datatables/index.dart';
import 'package:proyect_sm_accesorios/providers/index.dart';
import 'package:proyect_sm_accesorios/ui/labels/index.dart';
import 'package:proyect_sm_accesorios/ui/modals/index.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  void initState() {
    super.initState();
    Provider.of<CategoryProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<CategoryProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'Categorías',
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 20),
          PaginatedDataTable(
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Nombre')),
              DataColumn(label: Text('Acciones')),
            ],
            source:
                CategoriesDatasource(categoriesProvider.categories, context),
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
                  showDialog(
                    context: context,
                    builder: (_) => const CategoryModal(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
