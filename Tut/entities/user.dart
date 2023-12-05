import 'dart:convert';
import 'dart:io';

import '../implementaions/helper-functions.dart';

class User {
  static int _idCounter = 0;

  int? id;
  String email;
  String password;
  String name;
  List<dynamic> users = [];
  List<dynamic> usersJson = [];

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

  void retrieveUsers() {
    File file = File('Tut/assets/users.json');
    if (!file.existsSync()) {
      print('Die Datei users.json existiert nicht.');
      return;
    }
    usersJson = json.decode(file.readAsStringSync());
    for (Map<String, dynamic> jsonUser in usersJson) {
      users.add(User.fromJSON(jsonUser));
    }
    printUsers(users);
  }

  Future<void> addUser(User newUser) async {
    try {
      final file = File('Tut/assets/users.json');
      List<User> users = [];

      if (await file.exists()) {
        final data = await file.readAsString();
        final userList = json.decode(data);

        for (var user in userList) {
          users.add(User.fromJSON(user));
        }
      }

      users.add(newUser);

      final updatedUsers = users.map((user) => user.toJson()).toList();
      await file.writeAsString(json.encode(updatedUsers));
      print('User erfolgreich hinzugefügt.');
    } catch (e) {
      print('Fehler beim Hinzufügen des Benutzers: $e');
    }
  }

  Future<void> removeUserById(int id) async {
    try {
      final file = File('Tut/assets/users.json');
      List<User> users = [];

      if (await file.exists()) {
        final data = await file.readAsString();
        final userList = json.decode(data);

        for (var user in userList) {
          users.add(User.fromJSON(user));
        }

        users.removeWhere((user) => user.id == id);

        final updatedUsers = users.map((user) => user.toJson()).toList();
        await file.writeAsString(json.encode(updatedUsers));
        print('User mit ID $id erfolgreich gelöscht.');
      } else {
        print('Datei users.json nicht gefunden.');
      }
    } catch (e) {
      print('Fehler beim Löschen des Benutzers: $e');
    }
  }
}
