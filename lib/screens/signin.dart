import 'package:flutter/material.dart';
import 'package:inFluNinja/components/background.dart';
import 'package:inFluNinja/screens/home.dart';
import 'package:inFluNinja/model/user.dart';
import 'package:inFluNinja/components/dialog.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignInScreen> {
  User user = User(username: "", password: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("inFluNinja")),
        body: Stack(children: [
          DefaultBackground(),
          SafeArea(
              child: Container(
                  child: Padding(
                      padding: EdgeInsets.all(20), child: SignIn(user: user))))
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
          onChanged: (value) => this.user.username = value,
          decoration: InputDecoration(
              helperText: "Enter a valid login", hintText: "Login"),
        ),
        SizedBox(height: 8),
        TextField(
          onChanged: (value) => this.user.password = value,
          obscureText: true,
          decoration: InputDecoration(
              helperText: "Enter a valid password", hintText: "Password"),
        ),
        SizedBox(height: 24),
        Container(
            width: double.infinity,
            child: FlatButton(
              onPressed: () {
                if (this.user.isValid()) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyHomePage(user: user)));
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
