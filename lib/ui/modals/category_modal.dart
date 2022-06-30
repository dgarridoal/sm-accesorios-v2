import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyect_sm_accesorios/models/category_model.dart';
import 'package:proyect_sm_accesorios/providers/category_provider.dart';
import 'package:proyect_sm_accesorios/services/notification_service.dart';
import 'package:proyect_sm_accesorios/ui/inputs/custom_input_decoration.dart';

class CategoryModal extends StatefulWidget {
  final Category? category;

  const CategoryModal({Key? key, this.category}) : super(key: key);

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  String nombre = '';
  String? id;

  @override
  void initState() {
    super.initState();
    id = widget.category?.id;
    nombre = widget.category?.nombre ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final categoriesProvider =
        Provider.of<CategoryProvider>(context, listen: false);
    return AlertDialog(
      title: const Text('Ingrese la categoría'),
      content: id == null
          ? TextFormField(
              decoration: CustomInputDecoration.formInputDecoration(
                hint: 'Nueva categoría',
                label: 'Nombre de categoría',
                icon: Icons.category_outlined,
              ),
              onChanged: (value) => nombre = value,
            )
          : SizedBox(
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Nombre actual'),
                  RichText(
                    text: TextSpan(
                      text: nombre,
                      style: const TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Nuevo nombre'),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) return 'Debe tener un nombre';
                      return null;
                    },
                    decoration: CustomInputDecoration.formInputDecoration(
                      hint: '',
                      label: '',
                      icon: Icons.category_outlined,
                    ),
                    onChanged: (value) => nombre = value,
                  ),
                ],
              ),
            ),
      actions: [
        TextButton(
          child: const Text(
            'Cancelar',
            style: TextStyle(color: Colors.pink),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Guardar'),
          onPressed: () async {
            if (id == null) {
              final resp = await categoriesProvider.newCategory(nombre);
              resp
                  ? NotificationService.showSnackbarSuccess(
                      'Exitoso', 'Categoría creada satisfactoriamente')
                  : NotificationService.showSnackbarError(
                      'Error', 'No se ha podido agregar la categoría');
            } else {
              final resp = await categoriesProvider.updateCategory(nombre, id!);
              resp
                  ? NotificationService.showSnackbarSuccess(
                      'Exitoso', 'Categoría creada satisfactoriamente')
                  : NotificationService.showSnackbarError(
                      'Error', 'No se ha podido agregar la categoría');
            }
            // ignore: use_build_context_synchronously
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
