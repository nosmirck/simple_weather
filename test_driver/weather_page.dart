import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:simple_weather/main_test.dart';
import 'package:simple_weather/src/app.dart';
import 'package:simple_weather/src/app_config.dart';

main() async {
  enableFlutterDriverExtension();
  await registerDependencies();
  runApp(
    AppConfig(
      environment: Environment.tests,
      child: App(),
    ),
  );
}
