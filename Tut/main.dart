import 'entities/user.dart';
import 'implementaions/jsonExchange.dart';

Future<void> main() async {
  final JsonExchange jsonExchange = JsonExchange();
  final User user = User("raphael.birkl@gmail.com", "123456", "raphael birkl");

  await user.addUser(user);
  await user.removeUserById(06);

  // jsonExchange.checkForUsersJson();
  // jsonExchange.checkForFaqsJason();
}
