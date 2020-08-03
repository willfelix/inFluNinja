import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final int path;

  CircleImage({this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 190,
        width: 190,
        child: CircleAvatar(
            radius: 18,
            child: ClipOval(
                child: Image.network("https://source.unsplash.com/random/$path",
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity))));
  }
}
