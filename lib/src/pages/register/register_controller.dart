//import 'dart:html';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:venta_casas/src/pages/models/user.dart';
import 'package:venta_casas/src/providers/users_provider.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  ImagePicker picker = ImagePicker();
  File? imageFile;

  void register() async {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastname = lastnameController.text;
    String phone = phoneController.text;
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    print('Email ${email}');
    print('Password ${password}');

    if (isValidForm(email, name, lastname, phone, password, confirmPassword)) {
      User user = User(
          email: email,
          name: name,
          lastname: lastname,
          phone: phone,
          password: password);

      Response response = await usersProvider.create(user);

      print('Response: ${response.body}');
      Get.snackbar(
          'formulario valido', 'Estas listo par enviar la peticion HTTP');
    }
  }

  bool isValidForm(String email, String name, String lastname, String phone,
      String password, String confirmPassword) {
    if (!GetUtils.isEmail(email)) {
      Get.snackbar('  Formulario no valido', 'El email no es valido');
      return false;
    }

    if (email.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debe ingresar el email');
      return false;
    }
    if (name.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debe ingresar tu nombre');
      return false;
    }
    if (lastname.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debe ingresar tu apellido');
      return false;
    }
    if (phone.isEmpty) {
      Get.snackbar(
          'Formulario no valido', 'Debe ingresar tu numero telefonico');
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debe ingresar la bien contraseña');
      return false;
    }
    if (confirmPassword.isEmpty) {
      Get.snackbar('Formulario no valido',
          'Debe ingresar la confirmacion de la contraseña');
      return false;
    }
    if (password != confirmPassword) {
      Get.snackbar('Formulario no valido', 'Las contraseñas no coinciden');
    }
    return true;
  }

  Future selectImage(ImageSource imageSource) async {
    XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      imageFile = File(image.path);
      update();
    }
  }

  void showAlertDialog(BuildContext context) {
    Widget galleryButton = ElevatedButton(
        onPressed: () {
          Get.back();
          selectImage(ImageSource.gallery);
        },
        child: Text('Galeria'));

    Widget cameraButton = ElevatedButton(
        onPressed: () {
          Get.back();
          selectImage(ImageSource.camera);
        },
        child: Text('Camara'));

    AlertDialog alertDialog = AlertDialog(
      title: Text('Selecciona una opcion'),
      actions: [galleryButton, cameraButton],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
