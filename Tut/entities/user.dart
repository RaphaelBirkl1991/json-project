class User {
  String email;
  String password;
  String name;

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(json["email"], json["password"], json["name"]);
  }

  User(this.email, this.password, this.name);
}
