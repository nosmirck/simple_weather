import 'dart:async';

import 'package:simple_weather/src/models/weather_model.dart';

abstract class LocationService {
  LocationService();
  Future<Coord> getLastKnownLocation();
  Future<bool> getLocationPermission();
  Future<bool> isLocationAvailable();
}
