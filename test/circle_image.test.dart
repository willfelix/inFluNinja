import 'package:flutter/material.dart';
import 'package:inFluNinja/components/circle_image.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Check null value of CircleImage ', () {
    final image = CircleImage();

    expect(image.path, null);
  });

  test('Check initial values of CircleImage ', () {
    final image = CircleImage(path: 145);

    expect(image.path, 145);
  });

  testWidgets('Check if exists image with specifc path',
      (WidgetTester tester) async {
    await tester.pumpWidget(CircleImage(path: 123));

    expect(find.byKey(Key('123')), findsOneWidget);
  });
}
