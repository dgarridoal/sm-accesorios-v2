import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingSplash extends StatelessWidget {
  const LoadingSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset('json/loading.json', fit: BoxFit.fill));
  }
}
