import 'dart:convert';
import 'dart:io';
import '../entities/user.dart';
import '../implementaions/helper-functions.dart';
import '../repositories/user_repository.dart';

class JsonUserDataStore implements UserRepository {
  List<dynamic> users = [];
  //  List<dynamic> usersJson = [];
  final usersJs = File('Tut/assets/users.json');

  @override
  void addUser(User user) {
    users.add(user.toJson());
    usersJs.writeAsStringSync(jsonEncode(users));
  }
}

@override
void removeUserById(User user) {
  // TODO: implement removeUserById
}

@override
List<User>? showUsers() {
  // TODO: implement showUsers
  throw UnimplementedError();
}

@override
// TODO: implement users
List<User> get users => throw UnimplementedError();
