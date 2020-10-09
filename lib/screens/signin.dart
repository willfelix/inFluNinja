import 'package:flutter/material.dart';
import 'package:inFluNinja/components/background.dart';
import 'package:inFluNinja/screens/home.dart';
import 'package:inFluNinja/models/user.dart';
import 'package:inFluNinja/components/dialog.dart';
import 'package:inFluNinja/viewmodels/home.viewmodel.dart';
import 'package:inFluNinja/viewmodels/signin.viewmodel.dart';

class SignInScreen extends StatefulWidget {
  final SigninViewModelInterface viewmodel;

  SignInScreen({this.viewmodel});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.viewmodel.title)),
        body: Stack(children: [
          DefaultBackground(color: Colors.blue.withOpacity(0.1)),
          SafeArea(
              child: Container(
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: SignIn(user: widget.viewmodel.user))))
        ]));
  }
}

class SignIn extends StatelessWidget {
  final User user;
  SignIn({this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          key: Key("login_field"),
          onChanged: (value) => this.user.username = value,
          decoration: InputDecoration(
              helperText: "Enter a valid login", hintText: "Login"),
        ),
        SizedBox(height: 8),
        TextField(
          key: Key("password_field"),
          onChanged: (value) => this.user.password = value,
          obscureText: true,
          decoration: InputDecoration(
              helperText: "Enter a valid password", hintText: "Password"),
        ),
        SizedBox(height: 24),
        Container(
            width: double.infinity,
            child: FlatButton(
              key: Key("submit_field"),
              onPressed: () {
                if (this.user.isValid()) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          MyHomePage(viewmodel: HomeViewModel(user: user))));
                } else {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialog(
                            title: "Invalid fields",
                            content: "Username and/or password invalid");
                      });
                }
              },
              color: Colors.blue,
              child: Text("Sign in", style: TextStyle(color: Colors.white)),
            ))
      ],
    );
  }
}
