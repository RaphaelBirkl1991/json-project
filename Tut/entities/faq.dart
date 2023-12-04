class Faq {
  String? key;
  String? value;

  factory Faq.fromJSON(Map<String, dynamic> json) {
    return Faq(json["key"], json["value"]);
  }

  Faq(this.key, this.value);
}
