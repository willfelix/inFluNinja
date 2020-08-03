import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inFluNinja/components/circle_image.dart';
import 'package:inFluNinja/model/user.dart';

class Profile extends StatefulWidget {
  final User user;

  Profile({this.user});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLoading = false;
  int counter = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.username),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Center(child: CircleImage(path: counter)),
              ],
            ),
            SizedBox(height: 20),
            FlatButton(
              onPressed: () {
                setState(() {
                  isLoading = true;
                  counter++;
                });

                Future.delayed(Duration(seconds: 4)).then((value) => {
                      setState(() {
                        isLoading = false;
                      })
                    });
              },
              color: Colors.blue,
              child:
                  Text("Update image", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            Text(
              'You password is: ${widget.user.password}',
            )
          ],
        ),
      ),
    );
  }
}
