import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:simple_weather/src/models/weather_model.dart';
import 'package:simple_weather/src/services/location_service.dart';

class LocationServiceImpl implements LocationService {
  LocationServiceImpl();
  Future<Coord> getLastKnownLocation() async {
    final currentLocation =
        await Geolocator().getCurrentPosition(LocationAccuracy.high);

    return currentLocation == null
        ? null
        : Coord(currentLocation.latitude, currentLocation.longitude);
  }

  Future<bool> getLocationPermission() async {
    final loc = await Geolocator().getCurrentPosition();

    return loc != null;
  }

  Future<bool> isLocationAvailable() async {
    final result = await Geolocator().checkGeolocationPermissionStatus();

    return result == GeolocationStatus.granted;
  }
}
