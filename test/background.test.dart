import 'package:flutter/material.dart';
import 'package:inFluNinja/components/background.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Check initial values of DefaultBackground', () {
    final background = DefaultBackground(color: Colors.blue.withOpacity(0.1));

    expect(background.width, double.infinity);
    expect(background.height, double.infinity);
    expect(background.color, Colors.blue.withOpacity(0.1));
  });

  test('Check null color value in DefaultBackground', () {
    final background = DefaultBackground();
    expect(background.color, null);
  });
}
