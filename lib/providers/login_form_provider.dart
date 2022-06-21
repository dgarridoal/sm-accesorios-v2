import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}
