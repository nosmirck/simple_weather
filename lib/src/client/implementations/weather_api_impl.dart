import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:simple_weather/src/client/weather_api.dart';
import 'package:simple_weather/src/common/constants.dart';
import 'package:simple_weather/src/models/weather_model.dart';
import 'package:simple_weather/src/services/localization_service.dart';

class WeatherApiImpl implements WeatherApi {
  final Client client;
  final String url;
  final String lang;
  WeatherApiImpl()
      : client = Client(),
        url = 'https://api.openweathermap.org/data/2.5/weather?',
        lang = LocalizationService.locale?.languageCode ?? 'en';

  Future<WeatherModel> fetchWeatherForLocation(Coord location) async {
    if (location == null) {
      throw Exception(
          "Error on Location provided. Check that <param>location</param> is not null");
    }
    final response = await client
        .get(url +
            'lat=${location.lat}&lon=${location.lon}&appid=${AppConstants.apiKey}&lang=$lang')
        .timeout(
          Duration(seconds: 5),
        );

    if (response.statusCode == 200 && response.body != null) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      final exceptionMessage =
          "Statuscode: ${response.statusCode} StatusReason: ${response.reasonPhrase} Request= Coord: (${location.lat}, ${location.lon}) Language: $lang.";
      throw Exception(exceptionMessage);
    }
  }
}
