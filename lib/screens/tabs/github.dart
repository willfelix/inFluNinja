import 'package:flutter/material.dart';

import 'package:inFluNinja/models/git.dart';
import 'package:inFluNinja/viewmodels/github.viewmodel.dart';

class Github extends StatefulWidget {
  final GithubViewModelInterface viewmodel;

  Github({this.viewmodel});

  @override
  _GithubState createState() => _GithubState();
}

class _GithubState extends State<Github> {
  Future<List<Git>> future;

  @override
  void initState() {
    super.initState();
    this.future = widget.viewmodel.service
        .fetchByUsername(widget.viewmodel.user.username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.viewmodel.title),
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
              return Center(child: Text(widget.viewmodel.noRepositoriesTitle));
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
