import 'dart:async';

import 'package:simple_weather/src/models/weather_model.dart';
import 'package:http/http.dart' show Client;

abstract class WeatherApi {
  final Client client;
  final String url;

  WeatherApi(this.client, this.url);
  Future<WeatherModel> fetchWeatherForLocation(Coord location);
}
