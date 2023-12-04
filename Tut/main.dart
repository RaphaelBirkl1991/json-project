import 'implementaions/jsonExchange.dart';
import 'implementaions/newUser.dart';

void main() {
  final JsonExchange jsonExchange = JsonExchange();
  final NewUser newUser = NewUser();

  jsonExchange.checkForUsersJson();
  jsonExchange.checkForFaqsJason();
  newUser.addUser("Hans Müller");
}
