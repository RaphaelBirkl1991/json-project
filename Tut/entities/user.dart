import 'dart:convert';
import 'dart:io';

class User {
  static int _idCounter = 0; // Statischer Zähler für die ID

  int? id; // ID für den Benutzer
  String email;
  String password;
  String name;

  User(this.email, this.password, this.name) {
    _idCounter++; // Inkrementiere den Zähler für jede neue Instanz
    id = _idCounter; // Weise die ID dem Benutzer zu
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

  Future<void> addUser(User newUser) async {
    try {
      final file =
          File('Tut/assets/users.json'); // Annahme: Datei heißt users.json
      List<User> users = [];

      if (await file.exists()) {
        final data = await file.readAsString();
        final userList = json.decode(data);

        for (var user in userList) {
          users.add(User.fromJSON(user));
        }
      }

      users.add(newUser); // Füge den neuen Benutzer hinzu

      final updatedUsers = users.map((user) => user.toJson()).toList();
      await file.writeAsString(json.encode(updatedUsers));
      print('User erfolgreich hinzugefügt.');
    } catch (e) {
      print('Fehler beim Hinzufügen des Benutzers: $e');
    }
  }
}
