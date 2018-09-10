import 'dart:async';
import 'dart:convert';

import 'package:simple_weather/src/client/weather_api.dart';
import 'package:simple_weather/src/models/weather_model.dart';
import 'package:http/testing.dart' show MockClient;

class MockWeatherApi implements WeatherApi {
  final MockClient client;
  final String url;

  MockWeatherApi(this.client, this.url);

  Future<WeatherModel> fetchWeatherForLocation(Coord location) async {
    if (location == null) {
      throw Exception(
          "Error on Location provided. Check that <param>location</param> is not null");
    }

    final response = await client.get(url);

    if (response.statusCode == 200 && response.body != null) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      final exceptionMessage =
          "Statuscode: ${response.statusCode} StatusReason: ${response.reasonPhrase} Request= Coord: (${location.lat}, ${location.lon}) Language: en.";
      throw Exception(exceptionMessage);
    }
  }
}
