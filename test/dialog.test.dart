import 'package:inFluNinja/components/dialog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Check initial values of CustomDialog ', () {
    final dialog = CustomDialog(title: "Will", content: "Lindo");

    expect(dialog.title, "Will");
    expect(dialog.content, "Lindo");
  });
}
