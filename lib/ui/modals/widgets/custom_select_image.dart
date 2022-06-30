import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyect_sm_accesorios/ui/labels/custom_labels.dart';

class CustomSelectImage extends StatelessWidget {
  final XFile? image;
  const CustomSelectImage({
    Key? key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(10),
      padding: const EdgeInsets.all(6),
      dashPattern: const [8, 8],
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Container(
          height: 200,
          width: double.infinity,
          color: Colors.amber,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(30),
                child: Stack(
                  children: [
                    ClipOval(
                      child: image == null
                          ? Image.asset('assets/img/no-image.jpg')
                          : const Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                              size: 150,
                            ),
                    ),
                    image == null
                        ? Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.indigo,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.add_a_photo_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  image == null
                      ? const Text('Seleccione una imagen desde su ordenador.')
                      : Text(
                          'Imagen seleccionada',
                          style: CustomLabels.h1,
                        ),
                  image == null
                      ? const Text('Debe ser formato .jpg, .png o .jpeg')
                      : const Text(''),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
