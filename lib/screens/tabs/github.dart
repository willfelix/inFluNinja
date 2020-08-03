import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:inFluNinja/model/user.dart';
import 'package:inFluNinja/model/git.dart';

class Github extends StatefulWidget {
  final User user;

  Github({this.user});

  @override
  _GithubState createState() => _GithubState();
}

class _GithubState extends State<Github> {
  Future<List<Git>> future;

  @override
  void initState() {
    super.initState();
    this.future = fetchGit(widget.user.username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Github"),
      ),
      body: Center(
        child: FutureBuilder<List<Git>>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Git git = snapshot.data[index];
                  return Card(
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(children: <Widget>[
                          Text(
                            git.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17.0),
                          ),
                          SizedBox(height: 10),
                          Text(git.description,
                              style: TextStyle(fontStyle: FontStyle.italic)),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("(${git.language})"),
                              Text(git.createdAt)
                            ],
                          )
                        ]),
                      ));
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            } else if (!snapshot.hasData) {
              return Center(child: Text("No repositories found"));
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Future<List<Git>> fetchGit(String username) async {
  final response =
      await http.get('https://api.github.com/users/$username/repos');

  if (response.statusCode == 200) {
    dynamic obj = json.decode(response.body);
    return Git.fromJson(obj);
  }

  return null;
}
