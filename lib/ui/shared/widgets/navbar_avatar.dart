import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:proyect_sm_accesorios/providers/index.dart';
import 'package:proyect_sm_accesorios/router/router.dart';
import 'package:proyect_sm_accesorios/services/index.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return InkWell(
      onTap: () => NavigatorService.navigateTo(Flurorouter.profileRoute),
      child: ClipOval(
        child: SizedBox(
          width: 30,
          height: 30,
          child: Image.network(user.imgUrl),
        ),
      ),
    );
  }
}
