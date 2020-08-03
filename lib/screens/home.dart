import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inFluNinja/model/user.dart';
import 'package:inFluNinja/screens/tabs/github.dart';
import 'package:inFluNinja/screens/tabs/profile.dart';

class MyHomePage extends StatefulWidget {
  final User user;

  MyHomePage({this.user});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled), title: Text("Profile")),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.info), title: Text("Github")),
      ]),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(builder: (BuildContext context) {
          switch (index) {
            case 0:
              return Profile(user: widget.user);
              break;
            case 1:
              return Github(user: widget.user);
              break;
            default:
              return Profile(user: widget.user);
          }
        });
      },
    );
  }
}
