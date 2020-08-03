import 'package:flutter/material.dart';

class DefaultBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue.withOpacity(0.1));
  }
}
