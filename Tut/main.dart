import 'data_stores/memory_user_data_store.dart';
import 'entities/user.dart';
import 'repositories/user_repository.dart';

Future<void> main() async {
  final UserRepository userRepository = UserRepository();

  final User user = User("raphael.birkl@gmail.com", "123456", "raphael birkl");

  userRepository.addUser(user);

  // Verwaltet alle User.
  // UserRepository userRepository = UserRepository();
  // await user.addUser(user);
  // await user.removeUserById(2);
}
