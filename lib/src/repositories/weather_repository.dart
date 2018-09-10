import 'dart:async';

import 'package:simple_weather/service_locator.dart';
import 'package:simple_weather/src/client/weather_api.dart';
import 'package:simple_weather/src/models/weather_model.dart';

class WeatherRepository {
  final WeatherApi _api;

  WeatherRepository() : _api = ServiceLocator.get<WeatherApi>();

  Future<WeatherModel> fetchWeatherForLocation(Coord coords) async {
    final weather = await _api.fetchWeatherForLocation(coords);
    return weather;
  }
}
