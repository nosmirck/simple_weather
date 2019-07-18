import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_weather/src/exceptions/exceptions.dart';
import 'package:simple_weather/src/models/weather_model.dart';
import 'package:simple_weather/src/presentation/weather_provider.dart';
import 'package:simple_weather/src/services/localization_service.dart';
import 'package:simple_weather/src/widgets/refresh_widget.dart';
import 'package:simple_weather/src/widgets/weather_widget.dart';

class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = WeatherProvider.of(context);
    bloc.fetchWeatherForLocation();
    bloc.tempFormat();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocalizationsProvider.of(context).title,
          key: Key('appbar-title'),
        ),
        actions: <Widget>[
          InkWell(
              key: Key('temp-scale-button'),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 20.0),
                child: StreamBuilder(
                  stream: bloc.isCelsius,
                  builder:
                      (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    var symbol = 'C/F';
                    var style = TextStyle(color: Colors.white, fontSize: 20.0);
                    if (snapshot.hasData) {
                      if (snapshot.data) {
                        symbol = 'C°';
                        return Text(
                          symbol,
                          key: Key('celsius-symbol'),
                          style: style,
                        );
                      } else {
                        symbol = 'F°';
                        return Text(
                          symbol,
                          key: Key('fahrenheit-symbol'),
                          style: style,
                        );
                      }
                    }
                    return Text(
                      symbol,
                      key: Key('temp-scale'),
                      style: style,
                    );
                  },
                ),
              ),
              onTap: bloc.toggleCelsius),
        ],
        elevation: 0.0,
      ),
      body: StreamBuilder(
        stream: bloc.currentWeather,
        builder: (context, AsyncSnapshot<WeatherModel> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: snapshot.error is NoWeatherException ||
                      snapshot.error is TimeoutException
                  ? Text(LocalizationsProvider.of(context).error)
                  : Text(snapshot.error.toString()),
            );
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return Refresh(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: WeatherWidget(snapshot.data, bloc),
            ),
          );
        },
      ),
    );
  }
}
