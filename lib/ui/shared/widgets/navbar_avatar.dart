import 'package:flutter/material.dart';
import 'package:proyect_sm_accesorios/models/user_model.dart';
import 'package:proyect_sm_accesorios/services/local_storage.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = User.fromJson(LocalStorage.prefs.getString('user')!);

    return ClipOval(
      child: SizedBox(
        width: 30,
        height: 30,
        child: Image.network(user.img),
      ),
    );
  }
}
