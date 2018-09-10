import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_weather/src/models/weather_model.dart';
import 'package:simple_weather/src/services/location_service.dart';

void main() {
  group(
    'LocationService Tests',
    () {
      final _locationService = MockitoLocationService();

      test(
        'isLocationAvailable() - Case: Success',
        () async {
          when(_locationService.isLocationAvailable())
              .thenAnswer((_) => Future.value(true));
          final isAvailable = await _locationService.isLocationAvailable();
          expect(isAvailable, isTrue);
        },
      );

      test(
        'isLocationAvailable() - Case: Fail',
        () async {
          when(_locationService.isLocationAvailable())
              .thenAnswer((_) => Future.value(false));
          final isAvailable = await _locationService.isLocationAvailable();
          expect(isAvailable, isFalse);
        },
      );

      test(
        'getLastKnownLocation() - Case: Success',
        () async {
          final mockedLocation = Coord(43.6, -79.3);
          when(_locationService.getLastKnownLocation())
              .thenAnswer((_) => Future.value(mockedLocation));
          final location = await _locationService.getLastKnownLocation();
          expect(location, equals(mockedLocation));
        },
      );

      test(
        'getLastKnownLocation() - Case: Fail',
        () async {
          when(_locationService.getLastKnownLocation()).thenAnswer(
            (_) {
              Coord nullCoord;
              return Future.value(nullCoord);
            },
          );
          final location = await _locationService.getLastKnownLocation();
          expect(location, isNull);
        },
      );
    },
  );
}

class MockitoLocationService extends Mock implements LocationService {}
