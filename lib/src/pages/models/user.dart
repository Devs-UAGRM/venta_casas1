// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? id;
  String? email;
  String? name;
  //String? lastname;
  //String? emai;
  String? phone;
  String? image;
  String? password;
  String? sessionToken;

  User(
      {this.id,
      this.email,
      this.name,
      //this.lastname,
      //this.emai,
      this.phone,
      this.image,
      this.password,
      this.sessionToken});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
       // lastname: json["lastname"],
        //emai: json["emai"],
        phone: json["phone"],
        image: json["image"],
        password: json["password"],
        sessionToken: json["sesseion_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
       //"lastname": lastname,
        //"emai": emai,
        "phone": phone,
        "image": image,
        "password": password,
        "session_token": sessionToken,
      };
}
