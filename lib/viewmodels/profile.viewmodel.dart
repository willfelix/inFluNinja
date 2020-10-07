import 'package:inFluNinja/models/user.dart';

abstract class ProfileViewModelInterface {
  User user;
  bool isLoading;
  int counter;
}

class ProfileViewModel implements ProfileViewModelInterface {
  User user;
  bool isLoading = false;
  int counter = 0;

  ProfileViewModel({this.user});
}
