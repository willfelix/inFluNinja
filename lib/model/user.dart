class User {
  String username;
  String password;

  User({this.username, this.password});

  isValid() {
    if (this.username == null || this.username.isEmpty) return false;
    if (this.password == null || this.password.isEmpty) return false;

    return true;
  }
}
