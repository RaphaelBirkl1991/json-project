import 'dart:convert';
import 'dart:io';

import '../implementaions/helper-functions.dart';

class User {
  static int _idCounter = 0;

  int? id;
  String email;
  String password;
  String name;

  User(this.email, this.password, this.name) {
    _idCounter++;
    id = _idCounter;
  }

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(json["email"], json["password"], json["name"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
    };
  }
}
