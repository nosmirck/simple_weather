import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test_api/test_api.dart';

void main() {
  group(
    'Automated UI Tests',
    () {
      FlutterDriver driver;

      setUpAll(
        () async {
          // Connects to the app
          driver = await FlutterDriver.connect();
        },
      );

      tearDownAll(
        () async {
          if (driver != null) {
            // Closes the connection
            driver.close();
          }
        },
      );

      test(
        'Change Temperature',
        () async {
          // Record the performance timeline of things that happen inside the closure
          Timeline timeline = await driver.traceAction(
            () async {
              await driver.waitFor(find.byValueKey('temp-scale-button'));
              expect(find.byValueKey('temp-scale-button'), isNotNull);
              expect(find.byValueKey('celsius-symbol'), isNotNull);
              await driver.tap(find.byValueKey('temp-scale-button'));
              expect(find.byValueKey('fahrenheit-symbol'), isNotNull);
              await grabScreenshot(driver, 'screenshots/fahrenheit.png');
              await driver.tap(find.byValueKey('temp-scale-button'));
              expect(find.byValueKey('celsius-symbol'), isNotNull);
              await grabScreenshot(driver, 'screenshots/celsius.png');
            },
          );

          // The `timeline` object contains all the performance data recorded during
          // the scrolling session. It can be digested into a handful of useful
          // aggregate numbers, such as "average frame build time".
          TimelineSummary summary = TimelineSummary.summarize(timeline);

          // The following line saves the timeline summary to a JSON file.
          summary.writeSummaryToFile('change_temp_scale', pretty: true);

          // The following line saves the raw timeline data as JSON.
          summary.writeTimelineToFile('change_temp_scale', pretty: true);
        },
      );
    },
  );
}

grabScreenshot(FlutterDriver driver, String filePath) async {
  final List<int> pixels = await driver.screenshot();
  File file;
  await File('${Directory.current.path}/$filePath')
      .create(recursive: true)
      .then((f) => file = f);
  await file.writeAsBytes(pixels);
  print('wrote $file');
}
