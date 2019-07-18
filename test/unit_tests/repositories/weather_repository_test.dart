import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_weather/main_test.dart';
import 'package:simple_weather/src/models/weather_model.dart';
import 'package:simple_weather/src/repositories/weather_repository.dart';

void main() {
  group(
    'WeatherRepository Tests',
    () {
      final _weatherRepository = MockWeatherRepository();
      final torontoCoord = Coord(43.6, -79.3);
      test(
        'fetchWeatherForLocation() - Case: Success',
        () async {
          when(
            _weatherRepository.fetchWeatherForLocation(
              torontoCoord,
            ),
          ).thenAnswer(
            (_) {
              final response =
                  WeatherModel.fromJson(json.decode(weatherJsonResponse));
              return Future.value(response);
            },
          );
          final weatherInfo =
              await _weatherRepository.fetchWeatherForLocation(torontoCoord);
          expect(weatherInfo, isNotNull);
        },
      );

      test(
        'fetchWeatherForLocation() - Case: Fail',
        () async {
          when(
            _weatherRepository.fetchWeatherForLocation(
              torontoCoord,
            ),
          ).thenAnswer(
            (_) {
              WeatherModel nullWeather;
              return Future.value(nullWeather);
            },
          );
          final weatherInfo =
              await _weatherRepository.fetchWeatherForLocation(torontoCoord);
          expect(weatherInfo, isNull);
        },
      );
    },
  );
}

class MockWeatherRepository extends Mock implements WeatherRepository {}
