import '../entities/user.dart';
import 'user_data_store.dart';

class MemoryUserDataStore extends UserDataStore {
  final List<User> _users = [];

  @override
  List<User> getUsers() {
    return _users;
  }

  @override
  void saveUsers(List<User> users) {
    _users.clear();
    _users.addAll(users);
  }
}
