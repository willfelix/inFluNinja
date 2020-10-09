import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_test/flutter_test.dart' as package;

void main() {
  package.group('Flutter driver test App', () {
    FlutterDriver driver;

    package.setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    package.tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    package.test("check health", () async {
      Health health = await driver.checkHealth();
      print(health.status);
    });

    package.test("Check is login feature", () async {
      var login = find.byValueKey("login_field");
      var password = find.byValueKey("password_field");
      var submit = find.byValueKey("submit_field");

      WaitFor(login);
      WaitFor(password);
      WaitFor(submit);

      await driver.tap(login);
      await driver.enterText("will lindo");

      await driver.tap(password);
      await driver.enterText("123123");

      await driver.tap(submit);
    });
  });
}
