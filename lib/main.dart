import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_weather/service_locator.dart';
import 'package:simple_weather/src/app.dart';
import 'package:simple_weather/src/app_config.dart';
import 'package:simple_weather/src/client/implementations/weather_api_impl.dart';
import 'package:simple_weather/src/client/weather_api.dart';
import 'package:simple_weather/src/services/implementations/location_service_impl.dart';
import 'package:simple_weather/src/services/location_service.dart';

main() async {
  await registerDependencies();
  runApp(
    AppConfig(
      environment: Environment.production,
      child: App(),
    ),
  );
}

registerDependencies() async {
  ServiceLocator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
  ServiceLocator.registerSingleton<LocationService>(LocationServiceImpl());
  ServiceLocator.registerSingleton<WeatherApi>(WeatherApiImpl());
}
