import 'package:inFluNinja/models/user.dart';

abstract class HomeViewModelInterface {
  String profileTab;
  String githubTab;
  User user;
}

class HomeViewModel implements HomeViewModelInterface {
  String profileTab = "Profile";
  String githubTab = "Github";
  User user = User(username: "", password: "");

  HomeViewModel({this.user});
}
