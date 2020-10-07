import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inFluNinja/components/circle_image.dart';
import 'package:inFluNinja/viewmodels/profile.viewmodel.dart';

class Profile extends StatefulWidget {
  final ProfileViewModelInterface viewmodel;

  Profile({this.viewmodel});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.viewmodel.user.username),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                widget.viewmodel.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Center(
                        child: CircleImage(path: widget.viewmodel.counter)),
              ],
            ),
            SizedBox(height: 20),
            FlatButton(
              onPressed: () {
                setState(() {
                  widget.viewmodel.isLoading = true;
                  widget.viewmodel.counter++;
                });

                Future.delayed(Duration(seconds: 4)).then((value) => {
                      setState(() {
                        widget.viewmodel.isLoading = false;
                      })
                    });
              },
              color: Colors.blue,
              child:
                  Text("Update image", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            Text(
              'You password is: ${widget.viewmodel.user.password}',
            )
          ],
        ),
      ),
    );
  }
}
