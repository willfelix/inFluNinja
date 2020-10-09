import 'package:inFluNinja/components/dialog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Check null values of CustomDialog ', () {
    final dialog = CustomDialog();

    expect(dialog.title, null);
    expect(dialog.content, null);
  });

  test('Check initial values of CustomDialog ', () {
    final dialog = CustomDialog(title: "Will", content: "Lindo");

    expect(dialog.title, "Will");
    expect(dialog.content, "Lindo");
  });

  testWidgets('Check if text title is on the screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(CustomDialog(title: "Will", content: "Lindo"));

    expect(find.text('Will'), findsOneWidget);
    expect(find.text('Ninja'), findsNothing);
  });
}
