import 'package:flutter/material.dart';

class DefaultBackground extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  DefaultBackground(
      {this.width = double.infinity,
      this.height = double.infinity,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(width: this.width, height: this.height, color: this.color);
  }
}
