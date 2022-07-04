import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:proyect_sm_accesorios/models/http/index.dart';
import 'package:proyect_sm_accesorios/models/index.dart';
import 'package:proyect_sm_accesorios/providers/index.dart';
import 'package:proyect_sm_accesorios/router/router.dart';
import 'package:proyect_sm_accesorios/services/index.dart';
import 'package:proyect_sm_accesorios/ui/cards/index.dart';
import 'package:proyect_sm_accesorios/ui/labels/index.dart';
import 'package:proyect_sm_accesorios/ui/modals/widgets/index.dart';

class ProductModal extends StatefulWidget {
  final String id;

  const ProductModal({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<ProductModal> createState() => _ProductModalState();
}

class _ProductModalState extends State<ProductModal> {
  Product? prod;
  XFile? pickedFile;
  final ImagePicker _picker = ImagePicker();
  DateTime fechaVenc = DateTime.now();

  @override
  void initState() {
    super.initState();
    Provider.of<CategoryProvider>(context, listen: false).getCategories();
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    productProvider
        .getProductById(widget.id)
        .then((product) => setState(() => prod = product));
  }

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final categoryProvider = Provider.of<CategoryProvider>(context);

    final categories = categoryProvider.categories;

    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        WhiteCard(
          child: prod == null
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Información del producto',
                      style: CustomLabels.h1,
                    ),
                    const SizedBox(height: 15),
                    const Text('Se espera que todos los campos se completen.'),
                    const SizedBox(height: 15),
                    /* Input Name */
                    const Text(
                      'Nombre:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    TextFormField(
                      onChanged: ((value) => prod?.nombre = value),
                      decoration: InputDecoration(
                        hintText: prod?.nombre ?? 'Nombre del producto',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    /* File Selector */
                    const Text(
                      'Imagen:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        _pickerImage();
                      },
                      child: CustomSelectImage(image: pickedFile),
                    ),
                    const SizedBox(height: 30),

                    /* Description */
                    const Text(
                      'Descripción:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      minLines: 5,
                      maxLines: 5,
                      onChanged: (value) => prod?.descripcion = value,
                      decoration: InputDecoration(
                        hintText: prod?.descripcion ?? 'Descripción',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        /* Stock */
                        const Text(
                          'Stock:',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 8),
                        TextFormField(
                          onChanged: (value) => prod?.stock = int.parse(value),
                          decoration: InputDecoration(
                            constraints: const BoxConstraints(maxWidth: 100),
                            hintText: '${prod?.stock}',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const Spacer(),
                        /* Buy Price */
                        const Text(
                          'Precio de compra:',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 8),
                        TextFormField(
                          onChanged: (value) =>
                              prod?.precioCompra = int.parse(value),
                          decoration: InputDecoration(
                            constraints: const BoxConstraints(maxWidth: 100),
                            hintText: '${prod?.precioCompra}',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const Spacer(),
                        /* Sold Price */
                        const Text(
                          'Precio de venta:',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 8),
                        TextFormField(
                          onChanged: (value) =>
                              prod?.precioVenta = int.parse(value),
                          decoration: InputDecoration(
                            constraints: const BoxConstraints(maxWidth: 100),
                            hintText: '${prod?.precioVenta}',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),

                    /* Date */
                    const SizedBox(height: 30),
                    const Text(
                      'Fecha de vencimiento:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      readOnly: true,
                      onTap: () {
                        setState(() {
                          selectedDate(context);
                        });
                      },
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.calendar_month_outlined),
                        constraints: const BoxConstraints(maxWidth: 200),
                        hintText: DateFormat('dd/MM/yyyy').format(fechaVenc),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    /* Categories */
                    const SizedBox(height: 30),
                    const Text(
                      'Categorías:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      direction: Axis.horizontal,
                      children: getCustomChip(categories),
                    ),
                    const SizedBox(height: 15),

                    /* Botones */
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton.icon(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                            ),
                            onPressed: () {
                              NavigatorService.navigateTo(
                                  Flurorouter.productsRoute);
                            },
                            icon: const Icon(Icons.arrow_back),
                            label: const Text(
                              'Regresar',
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () async {
                              final resp =
                                  await productProvider.updateProduct(prod!);
                              if (pickedFile != null) {
                                final respFile = await productProvider
                                    .updateImagen(pickedFile!, resp.id);
                                respFile
                                    ? NotificationService.showSnackbarSuccess(
                                        'Exitoso',
                                        'Se ha actualizado el producto correctamente')
                                    : NotificationService.showSnackbarError(
                                        'Error',
                                        'Se ha producido un error al actualizar el producto');
                                NavigatorService.navigateTo(
                                    Flurorouter.dashboardRoute);
                                return;
                              }

                              resp.id.isNotEmpty
                                  ? NotificationService.showSnackbarSuccess(
                                      'Exitoso',
                                      'Se ha actualizado el producto correctamente')
                                  : NotificationService.showSnackbarError(
                                      'Error',
                                      'Ha ocurrido un error al actualizar el producto');

                              NavigatorService.navigateTo(
                                  Flurorouter.dashboardRoute);
                            },
                            icon: const Icon(Icons.save_as_outlined),
                            label: const Text(
                              'Guardar',
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ],
    );
  }

  bool isSelected(List<CategoryProductResponse> categories, Category category) {
    for (var cat in categories) {
      if (category.id == cat.id) {
        return true;
      }
    }
    return false;
  }

  _pickerImage() async {
    pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  Future<void> selectedDate(BuildContext context) async {
    DateTime? datePicker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 10),
    );
    if (datePicker != null && datePicker != fechaVenc) {
      setState(() {
        fechaVenc = datePicker;
        prod?.fechaVencimiento = fechaVenc;
      });
    }
  }

  List<Widget> getCustomChip(List<Category> list) {
    List<Widget> chip = [];
    for (var i = 0; i < list.length; i++) {
      final cat = list[i];
      chip.add(Container(
        margin: const EdgeInsets.all(8),
        child: ChoiceChip(
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          label: Text(
            cat.nombre,
            style: const TextStyle(color: Colors.white),
          ),
          onSelected: (value) {
            // product.categories.push(category) : product.categories.pop(category)
            if (value) {
              setState(() {
                prod!.categoria.add(
                    CategoryProductResponse(id: cat.id, nombre: cat.nombre));
              });
            } else {
              setState(() {
                prod!.categoria.removeWhere((c) => c.id == cat.id);
              });
            }
          },
          // (product.categories[index] == category ?true:false)
          selected: isSelected(prod!.categoria, cat),
          selectedColor: Colors.purple,
        ),
      ));
    }
    return chip;
  }
}
