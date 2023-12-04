import 'dart:convert';
import 'dart:io';
import '../entities/faq.dart';
import '../entities/user.dart';
import 'functions.dart';

class JsonExchange {
  List<dynamic> users = [];
  List<dynamic> usersJson = [];

  List<dynamic> faqs = [];
  List<dynamic> faqsJson = [];

  void checkForUsersJson() {
    File file = File('Tut/assets/users.json');
    if (!file.existsSync()) {
      print('Die Datei users.json existiert nicht.');
      return;
    }
    usersJson = json.decode(file.readAsStringSync());
    retrieveUsers();
  }

  void checkForFaqsJason() {
    File faqFile = File('Tut/assets/faqs.json');
    if (!faqFile.existsSync()) {
      print('Die Datei faq.json existiert nicht.');
      return;
    }
    faqsJson = json.decode(faqFile.readAsStringSync());
    retrieveFaqs();
  }

  void retrieveUsers() {
    for (Map<String, dynamic> jsonUser in usersJson) {
      users.add(User.fromJSON(jsonUser));
    }
    printUsers(users);
  }

  void retrieveFaqs() {
    for (Map<String, dynamic> jsonFaq in faqsJson) {
      faqs.add(Faq.fromJSON(jsonFaq));
    }
    printFaqs(faqs);
  }
}
