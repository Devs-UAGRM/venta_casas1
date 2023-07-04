import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venta_casas/src/pages/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  // const LoginPage({super.key});
  LoginController con = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        child: _textDontHaveAccount(),
      ),
      body: Stack(
        //para poner elementos encima del otro
        children: [
          _backgroudCover(context),
          _boxForm(context),
          Column(
            //posicionar elementos debajo del otro en forma vertical
            children: [
              _imageCover(),
              _textAppName(),
            ],
          )
        ],
      ),
    ));
  }

  //PRIVATE
  Widget _imageCover() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 15),
        alignment: Alignment.center,
        child: Image.asset(
          'assets/img/casa.png',
          width: 130,
          height: 130,
        ),
      ),
    );
  }

//-----------------------------------------------
  Widget _textAppName() {
    return Text(
      'Venta Casas',
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }

//-----------------------------------------------
  Widget _backgroudCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height *
          0.4, //porcentaje de lo azul atras del delivery
      color: Colors.blueAccent,
    );
  }

  //-----------------------------------------------
  Widget _textDontHaveAccount() {
    return Row(
      //ubicar elementos uno al lado del otro (Horizontal)
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿No tienes cuenta?',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        SizedBox(width: 10),
        GestureDetector(
          //para irse de una imagen a otra
          onTap: () => con.goToRegisterPage(),
          child: Text(
            'Registrate Aqui',
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
      ],
    );
  }

  //----------------------------------------------
  Widget _boxForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.33, left: 50, right: 50),
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black54, blurRadius: 15, offset: Offset(0, 0.75))
      ]),
      child: SingleChildScrollView(
        child: Column(children: [
          _textYourInfo(),
          _textFielEmail(),
          _textFielPassword(),
          _buttonLogin()
        ]),
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
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
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
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: TextField(
        controller: con.passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration:
            InputDecoration(hintText: 'Password', prefixIcon: Icon(Icons.lock)),
      ),
    );
  }

  //----------------------------------------------
  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
      child: ElevatedButton(
          onPressed: () => con.login(),
          child: Text(
            'Login',
            style: TextStyle(color: Colors.black),
          )),
    );
  }
  //PUBLIC
}
