import 'dart:convert';
import 'dart:io';
import 'entities/faq.dart';
import 'entities/user.dart';

void main() {
  File file = File('Tut/assets/users.json');
  if (!file.existsSync()) {
    print('Die Datei users.json existiert nicht.');
    return;
  }

  File faqFile = File('Tut/assets/faqs.json');
  if (!faqFile.existsSync()) {
    print('Die Datei faq.json existiert nicht.');
    return;
  }

  List<dynamic> jsonDaten = json.decode(file.readAsStringSync());

  List<dynamic> jsonDatenFaq = json.decode(faqFile.readAsStringSync());

  List<User> users = [];
  List<Faq> faqs = [];

  for (Map<String, dynamic> json in jsonDaten) {
    users.add(User.fromJSON(json));
  }

  for (Map<String, dynamic> jsonFaq in jsonDatenFaq) {
    faqs.add(Faq.fromJSON(jsonFaq));
  }

  for (User user in users) {
    print(
        "\nEmail: ${user.email}, Password: ${user.password}, Name: ${user.name}");
  }

  for (Faq faq in faqs) {
    print("\nkeyword: ${faq.key}, explanation: ${faq.value}");
  }
}
