import 'package:inFluNinja/components/circle_image.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Check initial values of CircleImage ', () {
    final image = CircleImage(path: 1);

    expect(image.path, 1);
  });
}
