import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_weather/service_locator.dart';
import 'package:simple_weather/src/exceptions/exceptions.dart';
import 'package:simple_weather/src/models/weather_model.dart';
import 'package:simple_weather/src/repositories/weather_repository.dart';
import 'package:simple_weather/src/services/location_service.dart';

class WeatherBloc {
  bool _isCelsius = true;

  final WeatherRepository _weatherRepository;
  final LocationService _locationService;
  final SharedPreferences _sharedPrefs;

  final _weatherFetchController = StreamController<WeatherModel>();
  final _tempFormatController = StreamController<bool>.broadcast();

  WeatherBloc()
      : _locationService = ServiceLocator.get<LocationService>(),
        _weatherRepository = WeatherRepository(),
        _sharedPrefs = ServiceLocator.get<SharedPreferences>() {
    _isCelsius = _sharedPrefs.getBool('isCelsius') ?? true;
    _tempFormatController.sink.add(_isCelsius);
  }
  Stream<WeatherModel> get currentWeather => _weatherFetchController.stream;

  Stream<bool> get isCelsius => _tempFormatController.stream;

  dispose() {
    _weatherFetchController.close();
    _tempFormatController.close();
  }

  Future fetchWeatherForLocation() async {
    WeatherModel weather;
    try {
      if (await _locationService.isLocationAvailable() ||
          await _locationService.getLocationPermission()) {
        final coords = await _locationService.getLastKnownLocation();
        if (coords != null) {
          weather = await _weatherRepository.fetchWeatherForLocation(coords);
        }
      }
      if (weather != null) {
        _weatherFetchController.sink.add(weather);
      } else {
        _weatherFetchController.sink.addError(NoWeatherException());
      }
    } catch (e) {
      _weatherFetchController.sink.addError(e);
    }
  }

  tempFormat() {
    _tempFormatController.sink.add(_isCelsius);
  }

  Future toggleCelsius() async {
    _isCelsius = !_isCelsius;
    //Whenever the Temperature Meassure is changed, we save to shared prefs
    await _sharedPrefs.setBool('isCelsius', _isCelsius);
    _tempFormatController.sink.add(_isCelsius);
  }
}
