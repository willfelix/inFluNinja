import 'package:inFluNinja/models/user.dart';

abstract class SigninViewModelInterface {
  String title;
  User user;
}

class SigninViewModel implements SigninViewModelInterface {
  String title = "inFluNinja";
  User user = User(username: "", password: "");
}
