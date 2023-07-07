import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClientProfileInfoPage extends StatelessWidget {
  const ClientProfileInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      //para poner elementos encima del otro
      children: [
        _backgroudCover(context),
        _boxForm(context),
        _imageUser(context),
        
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
         
          _buttonUpdate()
        ]),
      ),
    );
  }


  //----------------------------------------------
  Widget _imageUser(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        alignment: Alignment.topCenter,
        child: CircleAvatar(
            backgroundImage: 
             AssetImage('assets/img/user.png') ,
            radius: 60,
            backgroundColor: Colors.white,
          ),
      ),
    );
  }

//----------------------------------------------
  Widget _textYourInfo() {
    return Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Text(
          'Actualice sus Datos',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        ));
  }

  //----------------------------------------------
  Widget _buttonUpdate() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: ElevatedButton(
          onPressed: () {},
          child: Text(
            'Actualizacion de Datos',
            style: TextStyle(color: Colors.black),
          )),
    );
  }

}