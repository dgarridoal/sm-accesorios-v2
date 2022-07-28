import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:proyect_sm_accesorios/providers/index.dart';
import 'package:proyect_sm_accesorios/ui/cards/index.dart';
import 'package:proyect_sm_accesorios/ui/cards/user_info_card.dart';
import 'package:proyect_sm_accesorios/ui/modals/widgets/index.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  XFile? pickedFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: [
                  WhiteCard(
                    title: userProvider.isEditable ? 'Editando' : 'Perfil',
                    child: Center(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: userProvider.isEditable
                                ? () {
                                    _pickerImage();
                                  }
                                : () {},
                            child: CustomSelectImage(image: pickedFile),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            initialValue: user.nombre,
                            enabled: userProvider.isEditable,
                            onChanged: ((value) => user.nombre = value),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            initialValue: user.apellido,
                            enabled: userProvider.isEditable,
                            onChanged: ((value) => user.apellido = value),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            initialValue: user.email,
                            enabled: userProvider.isEditable,
                            onChanged: ((value) => user.email = value),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          //TODO: crear parte de la contraseña
                          TextFormField(
                            enabled: userProvider.isEditable,
                            onChanged: ((value) => user.email = value),
                            decoration: InputDecoration(
                              hintText: 'Contraseña nueva',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            enabled: userProvider.isEditable,
                            onChanged: ((value) => user.email = value),
                            decoration: InputDecoration(
                              hintText: 'Confirmar contraseña nueva',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          userProvider.isEditable
                              ? Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        //TODO: Guardar cambios con bdd
                                        userProvider.isEditable = false;
                                      },
                                      child: const Text('Guardar'),
                                    ),
                                    const SizedBox(width: 10),
                                    TextButton(
                                      onPressed: () {
                                        //TODO: clean fields
                                        userProvider.isEditable = false;
                                      },
                                      child: const Text('Cancelar'),
                                    ),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Imagen de perfil",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            userProvider.isEditable = true;
                          },
                          icon: !userProvider.isEditable
                              ? const Icon(Icons.edit, color: Colors.blue)
                              : const Icon(Icons.check, color: Colors.green),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Center(
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(user.imgUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const SizedBox(height: 30),
                    const Text(
                      "Datos personales",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    UserInforCard(
                        title: '${user.nombre} ${user.apellido}',
                        tipo: 'Nombre completo',
                        icon: Icons.person_outline_outlined),
                    UserInforCard(
                        title: user.email,
                        tipo: 'Email',
                        icon: Icons.email_outlined),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _pickerImage() async {
    pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }
}
