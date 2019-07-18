import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:simple_weather/src/business/weather_bloc.dart';
import 'package:simple_weather/src/common/constants.dart';
import 'package:simple_weather/src/helpers/conversion_helper.dart';
import 'package:simple_weather/src/models/weather_model.dart';

class WeatherWidget extends StatelessWidget {
  final WeatherModel weatherInfo;
  final WeatherBloc bloc;
  WeatherWidget(this.weatherInfo, this.bloc);
  @override
  Widget build(BuildContext context) {
    String iconName = weatherInfo.weather.first.icon;
    bloc.tempFormat();
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 80.0,
              width: 80.0,
              child: CachedNetworkImage(
                imageUrl: '${AppConstants.imageUrl}$iconName.png',
                fit: BoxFit.fill,
                placeholder: (context, url) => Padding(
                  padding: EdgeInsets.all(25.0),
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Container(
                  child: Icon(Icons.wb_sunny),
                  height: 80.0,
                  width: 80.0,
                ),
              ),
            ),
            Text(
              weatherInfo.name.toUpperCase(),
              style: TextStyle(fontSize: 25.0),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(25.0),
        ),
        Text(
          '${weatherInfo.weather.first.description.toUpperCase()}',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 20.0),
        ),
        Padding(
          padding: EdgeInsets.all(25.0),
        ),
        StreamBuilder(
          stream: bloc.isCelsius,
          builder: (BuildContext contex, AsyncSnapshot<bool> snapshot) {
            int temp, min, max;
            //This probably can be changed to a better approach using higher operators
            if (!snapshot.hasData || snapshot.data) {
              temp = kelvinToCelsius(weatherInfo.main.temp);
              min = kelvinToCelsius(weatherInfo.main.tempMin);
              max = kelvinToCelsius(weatherInfo.main.tempMax);
            } else {
              temp = kelvinToFahrenheit(weatherInfo.main.temp);
              min = kelvinToFahrenheit(weatherInfo.main.tempMin);
              max = kelvinToFahrenheit(weatherInfo.main.tempMax);
            }
            return Column(
              children: <Widget>[
                Text(
                  '$temp°',
                  style: TextStyle(fontSize: 80.0),
                ),
                Padding(
                  padding: EdgeInsets.all(25.0),
                ),
                Text(
                  'min: $min° max: $max°',
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            );
          },
        ),
        Container(
          height: 100.0,
        ),
      ],
    );
  }
}
