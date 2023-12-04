import '../entities/faq.dart';
import '../entities/user.dart';

void printUsers(List<dynamic> users) {
  for (User user in users) {
    print(
        "\nEmail: ${user.email}, Password: ${user.password}, Name: ${user.name}");
  }
}

void printFaqs(List<dynamic> faqs) {
  for (Faq faq in faqs) {
    print("\nkeyword: ${faq.key}, explanation: ${faq.value}");
  }
}
