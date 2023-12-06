import '../entities/user.dart';

/// Holt und speichert [User].
abstract class UserDataStore {
  List<User> getUsers();
  void saveUsers(List<User> users);
}
