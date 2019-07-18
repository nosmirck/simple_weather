import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_weather/service_locator.dart';
import 'package:simple_weather/src/app.dart';
import 'package:simple_weather/src/app_config.dart';
import 'package:simple_weather/src/client/mocked/mock_weather_api_impl.dart';
import 'package:simple_weather/src/client/weather_api.dart';
import 'package:simple_weather/src/services/location_service.dart';
import 'package:simple_weather/src/services/mocked/mock_location_service_impl.dart';

main() async {
  await registerDependencies();
  runApp(
    AppConfig(
      environment: Environment.development,
      child: App(),
    ),
  );
}

registerDependencies() async {
  ServiceLocator.reset();
  final _mockSharedPrefs = MockSharedPreferences();

  when(_mockSharedPrefs.getBool(typed(any))).thenReturn(true);
  when(_mockSharedPrefs.setBool(typed(any), typed(any)))
      .thenAnswer((_) => Future.value(true));

  ServiceLocator.registerSingleton<SharedPreferences>(_mockSharedPrefs);
  ServiceLocator.registerSingleton<LocationService>(MockLocationService());
  ServiceLocator.registerSingleton<WeatherApi>(
    MockWeatherApi(
      MockClient(
        (request) async => Response(weatherJsonResponse, 200),
      ),
      "",
    ),
  );
}

class MockSharedPreferences extends Mock implements SharedPreferences {}

const weatherJsonResponse = '''{
    "coord": {
        "lon": -79.39,
        "lat": 43.65
    },
    "weather": [
        {
            "id": 800,
            "main": "Clear",
            "description": "clear sky",
            "icon": "01d"
        }
    ],
    "base": "stations",
    "main": {
        "temp": 297.45,
        "pressure": 1019,
        "humidity": 60,
        "temp_min": 296.15,
        "temp_max": 299.15
    },
    "visibility": 14484,
    "wind": {
        "speed": 4.1,
        "deg": 180
    },
    "clouds": {
        "all": 1
    },
    "dt": 1532019600,
    "sys": {
        "type": 1,
        "id": 3721,
        "message": 0.0046,
        "country": "CA",
        "sunrise": 1531994053,
        "sunset": 1532047985
    },
    "id": 6167863,
    "name": "Downtown Toronto",
    "cod": 200
}''';
