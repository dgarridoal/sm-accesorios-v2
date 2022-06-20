import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BackgroundLogin extends StatelessWidget {
  const BackgroundLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Lottie.asset(
        'json/shop-login.json',
        fit: BoxFit.contain,
      ),
    );
  }
}
