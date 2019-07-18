// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_weather/main_test.dart';
import 'package:simple_weather/src/app.dart';
import 'package:simple_weather/src/app_config.dart';
import 'package:simple_weather/src/helpers/conversion_helper.dart';
import 'package:simple_weather/src/widgets/weather_widget.dart';

void main() {
  setUpAll(
    () async {
      await registerDependencies();
    },
  );
  group(
    'Weather Page Tests - Widgets',
    () {
      final tempInKelvin = 297.45;
      final tempInCelsius = kelvinToCelsius(tempInKelvin);
      final tempInFahrenheit = kelvinToFahrenheit(tempInKelvin);
      testWidgets(
        'Changes from Celsius to Fahrenheit and vicerversa',
        (WidgetTester tester) async {
          // Build our app and trigger a frame.
          await tester.pumpWidget(AppConfig(
            environment: Environment.tests,
            child: App(),
          ));
          await tester.pump();
          // Expect to all elements of the AppBar
          expect(find.byKey(Key('appbar-title')), findsOneWidget);
          expect(find.byKey(Key('temp-scale-button')), findsOneWidget);
          await tester.pump();
          // Expect to show at least one WeaterTile
          expect(find.byType(WeatherWidget), findsWidgets);
          // Expect Temperature in Celsius
          expect(find.text('$tempInCelsius°'), findsWidgets);
          // Tap Temperature Icon and expect to change the temperature to Fahrenheit
          await tester.tap(find.byKey(Key('temp-scale-button')));
          await tester.pump();

          expect(find.text('$tempInFahrenheit°'), findsWidgets);
          // Tap Temperature Icon again and expect to change the temperature to Celsius
          await tester.tap(find.byKey(Key('temp-scale-button')));
          await tester.pump();
          expect(find.text('$tempInCelsius°'), findsWidgets);
        },
      );

      testWidgets(
        'App Loads and shows mocked Data',
        (WidgetTester tester) async {
          // Build our app and trigger a frame.
          await tester.pumpWidget(AppConfig(
            environment: Environment.tests,
            child: App(),
          ));
          // Expect to all elements of the AppBar
          expect(find.byKey(Key('appbar-title')), findsOneWidget);
          expect(find.byKey(Key('temp-scale-button')), findsOneWidget);
          await tester.pump();

          // Expect to show at least one WeaterTile
          expect(find.byType(WeatherWidget), findsWidgets);
        },
      );
    },
  );
}
