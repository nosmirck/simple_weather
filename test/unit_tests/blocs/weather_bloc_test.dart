import 'package:flutter_test/flutter_test.dart';
import 'package:simple_weather/main_test.dart';
import 'package:simple_weather/src/business/weather_bloc.dart';

void main() {
  setUpAll(
    () async {
      await registerDependencies();
    },
  );
  group(
    'WeatherBloc Tests',
    () {
      test(
        'fetchWeatherForLocation()',
        () async {
          final _bloc = WeatherBloc();
          await _bloc.fetchWeatherForLocation();
          _bloc.currentWeather.listen(
            expectAsync1(
              (weatherInfo) {
                expect(weatherInfo, isNotNull);
              },
              count: 1,
            ),
          );
        },
      );
    },
  );
}
