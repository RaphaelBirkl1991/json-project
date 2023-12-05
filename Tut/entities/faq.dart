import 'dart:convert';
import 'dart:io';

import '../implementaions/helper-functions.dart';

class Faq {
  String? key;
  String? value;
  List<dynamic> faqs = [];
  List<dynamic> faqsJson = [];

  factory Faq.fromJSON(Map<String, dynamic> json) {
    return Faq(json["key"], json["value"]);
  }

  Faq(this.key, this.value);

  void retrieveFaqs() {
    File faqFile = File('Tut/assets/faqs.json');
    if (!faqFile.existsSync()) {
      print('Die Datei faq.json existiert nicht.');
      return;
    }
    faqsJson = json.decode(faqFile.readAsStringSync());
    for (Map<String, dynamic> jsonFaq in faqsJson) {
      faqs.add(Faq.fromJSON(jsonFaq));
    }
    printFaqs(faqs);
  }
}
