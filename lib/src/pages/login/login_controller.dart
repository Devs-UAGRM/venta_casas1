import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:venta_casas/src/pages/models/response_api.dart';
import 'package:venta_casas/src/providers/users_provider.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UsersProvider usersProvider = UsersProvider();
  void goToRegisterPage() {
    Get.toNamed('/register');
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    print('Email ${email}');
    print('Password ${password}');

    if (isValidForm(email, password)) {
      ResponseApi responseApi = await usersProvider.login(email, password);
      print('Response Api: ${responseApi.toJson()}');

      if (responseApi.success == true) {
        GetStorage()
            .write('user', responseApi.data); //DATOS DEL USUARIO EN SESION

        goToHomePage();
      } else {
        Get.snackbar('Login fallido', responseApi.message ?? '');
      }
    }
  }

  void goToHomePage() {
    Get.offNamedUntil('/home', ((route) => false));
  }

  bool isValidForm(String email, String password) {
    if (!GetUtils.isEmail(email)) {
      Get.snackbar('  Formulario no valido', 'El email no es valido');
      return false;
    }

    if (email.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debe ingresar el email');
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debe ingresar la bien contraseña');
      return false;
    }
    return true;
  }
}
