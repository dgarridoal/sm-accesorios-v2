import 'package:flutter/material.dart';
import 'package:proyect_sm_accesorios/providers/auth_provider.dart';

class LoginFormProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      print(email + ' ' + password);
      //TODO: Logged
      notifyListeners();
      return true;
    } else {
      //TODO: Show error with AwesomeDialog
      return false;
    }
  }
}
