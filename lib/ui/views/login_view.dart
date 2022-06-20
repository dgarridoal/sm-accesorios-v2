import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyect_sm_accesorios/providers/auth_provider.dart';
import 'package:proyect_sm_accesorios/providers/login_form_provider.dart';
import 'package:proyect_sm_accesorios/ui/shared/widgets/custom_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(
        builder: (BuildContext context) {
          final loginFormProvider = Provider.of<LoginFormProvider>(context);
          return Container(
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: loginFormProvider.formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  //Título
                  const Text(
                    'Inicio de sesión',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'S&M Accesorios',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50),

                  //Email
                  TextFormField(
                    validator: (value) {
                      if (!EmailValidator.validate(value ?? '')) {
                        return 'Email inválido';
                      }
                      return null;
                    },
                    onChanged: (value) => loginFormProvider.email = value,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      labelText: 'Ingrese su correo',
                      icon: Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(height: 20),

                  //Contraseña
                  TextFormField(
                    onChanged: (value) => loginFormProvider.password = value,
                    validator: (value) {
                      if (value!.isEmpty) return 'Ingrese su contraseña';
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: '********',
                      labelText: 'Contraseña',
                      icon: Icon(Icons.lock),
                    ),
                  ),
                  const SizedBox(height: 20),

                  //Botón
                  CustomButton(
                    onPressed: () {
                      var isValid = loginFormProvider.validateForm();
                      if (isValid) {
                        authProvider.login(loginFormProvider.email,
                            loginFormProvider.password);
                      }
                    },
                    text: 'Ingresar',
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
