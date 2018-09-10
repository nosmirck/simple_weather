import 'dart:async';

import 'package:simple_weather/src/models/weather_model.dart';
import 'package:simple_weather/src/services/location_service.dart';

class MockLocationService implements LocationService {
  MockLocationService();

  Future<Coord> getLastKnownLocation() async {
    return Coord(43.6, -79.3);
  }

  Future<bool> getLocationPermission() async {
    return true;
  }

  Future<bool> isLocationAvailable() async {
    return true;
  }
}
