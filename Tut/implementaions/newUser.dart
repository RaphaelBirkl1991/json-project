import 'dart:convert';
import 'dart:io';

class NewUser {
  void addUser(String name) async {
    File file = File("Tut/assets/newUser.json");
    bool isNameExisting = name.length > 0;

    bool isFileSync = file.existsSync();
    String content = await file.readAsString();
    bool isContentExisting = content.length > 0;

    if (isNameExisting) {
      Map<String, dynamic> jsonMap = {};

      if (!isFileSync) {
        file = await file.create(exclusive: true);
      }

      if (isContentExisting) {
        jsonMap = json.decode(content);
      }

      if (jsonMap["name"] != null) {
        List<String> names = jsonMap["name"].toList().cast<String>();
        names.add(name);
        jsonMap["name"] = names;
      } else {
        List<String> names = [name];
        jsonMap["name"] = names;
      }

      file.writeAsStringSync(json.encode(jsonMap));
    }
  }
}
