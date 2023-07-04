import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venta_casas/src/pages/register/register_controller.dart';

class RegisterPage extends StatelessWidget {
  RegisterController con = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      //para poner elementos encima del otro
      children: [
        _backgroudCover(context),
        _boxForm(context),
        _imageUser(context),
        _buttomBack()
      ],
    ));
  }

  //-----------------------------------------------
  Widget _backgroudCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height *
          0.35, //porcentaje de lo azul atras del delivery
      color: Colors.blueAccent,
    );
  }

  //----------------------------------------------
  Widget _boxForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.30, left: 50, right: 50),
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black54, blurRadius: 15, offset: Offset(0, 0.75))
      ]),
      child: SingleChildScrollView(
        child: Column(children: [
          _textYourInfo(),
          _textFielEmail(),
          _textFielName(),
          _textFielLastName(),
          _textFielPhone(),
          _textFielPassword(),
          _textFielConfirmPassword(),
          _buttonRegister()
        ]),
      ),
    );
  }

//----------------------------------------------
  Widget _buttomBack() {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.only(left: 20),
      child: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
      ),
    ));
  }

  //----------------------------------------------
  Widget _imageUser(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        alignment: Alignment.topCenter,
        child: GestureDetector(
          onTap: () => con.showAlertDialog(context),
          child: GetBuilder<RegisterController>(builder: (value) =>CircleAvatar(
            backgroundImage: con.imageFile != null
            ? FileImage(con.imageFile!)
            : AssetImage('assets/img/user.png') as ImageProvider,
            radius: 60,
            backgroundColor: Colors.white,
          ),)
        ),
      ),
    );
  }

//----------------------------------------------
  Widget _textYourInfo() {
    return Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Text(
          'Ingresa esta informacion',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        ));
  }

  //----------------------------------------------
  Widget _textFielEmail() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
      child: TextField(
        controller: con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Correo Electronico', prefixIcon: Icon(Icons.email)),
      ),
    );
  }

  //----------------------------------------------
  Widget _textFielPassword() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
      child: TextField(
        controller: con.passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Contraseña', prefixIcon: Icon(Icons.lock)),
      ),
    );
  }

  //----------------------------------------------
  Widget _buttonRegister() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: ElevatedButton(
          onPressed: () => con.register(),
          child: Text(
            'Registrarse',
            style: TextStyle(color: Colors.black),
          )),
    );
  }

  //----------------------------------------------
  Widget _textFielName() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
      child: TextField(
        controller: con.nameController,
        keyboardType: TextInputType.text,
        decoration:
            InputDecoration(hintText: 'Nombre', prefixIcon: Icon(Icons.person)),
      ),
    );
  }

  //----------------------------------------------
  Widget _textFielLastName() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
      child: TextField(
        controller: con.lastnameController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            hintText: 'Apellido',
            prefixIcon: Icon(Icons.person_outline_outlined)),
      ),
    );
  }

  //----------------------------------------------
  Widget _textFielPhone() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
      child: TextField(
        controller: con.phoneController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            hintText: 'Telefono', prefixIcon: Icon(Icons.phone)),
      ),
    );
  }

  Widget _textFielConfirmPassword() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
      child: TextField(
        controller: con.confirmPasswordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
            hintText: ' Confirmar Contraseña', prefixIcon: Icon(Icons.lock)),
      ),
    );
  }
}
