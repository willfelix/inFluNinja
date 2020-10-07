import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:inFluNinja/screens/tabs/github.dart';
import 'package:inFluNinja/screens/tabs/profile.dart';
import 'package:inFluNinja/services/github.service.dart';
import 'package:inFluNinja/viewmodels/github.viewmodel.dart';
import 'package:inFluNinja/viewmodels/home.viewmodel.dart';
import 'package:inFluNinja/viewmodels/profile.viewmodel.dart';

class MyHomePage extends StatefulWidget {
  final HomeViewModelInterface viewmodel;

  MyHomePage({this.viewmodel});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            title: Text(widget.viewmodel.profileTab)),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.info),
            title: Text(widget.viewmodel.githubTab)),
      ]),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(builder: (BuildContext context) {
          switch (index) {
            case 0:
              return Profile(
                  viewmodel: ProfileViewModel(user: widget.viewmodel.user));
              break;
            case 1:
              return Github(
                  viewmodel: GithubViewModel(
                      user: widget.viewmodel.user, service: GithubService()));
              break;
            default:
              return Profile(
                  viewmodel: ProfileViewModel(user: widget.viewmodel.user));
          }
        });
      },
    );
  }
}
