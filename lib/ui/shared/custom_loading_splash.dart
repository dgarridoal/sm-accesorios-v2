import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class CustomLoadingSplash extends StatelessWidget {
  const CustomLoadingSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset('json/loading.json', fit: BoxFit.fill));
  }
}
