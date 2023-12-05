import 'entities/user.dart';

Future<void> main() async {
  final User user = User("raphael.birkl@gmail.com", "123456", "raphael birkl");

  // await user.addUser(user);
  await user.removeUserById(2);
}
