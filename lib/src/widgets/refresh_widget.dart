import 'package:flutter/material.dart';
import 'package:simple_weather/src/presentation/weather_provider.dart';

class Refresh extends StatelessWidget {
  final Widget child;

  Refresh({this.child});

  Widget build(context) {
    final bloc = WeatherProvider.of(context);

    return RefreshIndicator(
      child: child,
      onRefresh: () async {
        await bloc.fetchWeatherForLocation();
      },
    );
  }
}
