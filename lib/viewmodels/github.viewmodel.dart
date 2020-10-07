import 'package:inFluNinja/models/user.dart';
import 'package:inFluNinja/services/github.service.dart';

abstract class GithubViewModelInterface {
  User user;
  GithubServiceInteface service;
  String title;
  String noRepositoriesTitle;
}

class GithubViewModel implements GithubViewModelInterface {
  String title = "Github";
  User user;
  GithubServiceInteface service;
  String noRepositoriesTitle = "No repositories found";

  GithubViewModel({this.user, this.service});
}
