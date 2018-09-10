import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class Clouds extends Object with _$CloudsSerializerMixin {
  double all;
  Clouds(this.all);
  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}

@JsonSerializable()
class Coord extends Object with _$CoordSerializerMixin {
  double lon;
  double lat;
  Coord(this.lat, this.lon);
  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);

  @override
  String toString() {
    return "($lon, $lat)";
  }
}

@JsonSerializable()
class Main extends Object with _$MainSerializerMixin {
  double temp;
  double humidity;
  double pressure;
  @JsonKey(name: 'temp_min')
  double tempMin;
  @JsonKey(name: 'temp_max')
  double tempMax;
  Main(this.humidity, this.pressure, this.temp, this.tempMax, this.tempMin);
  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@JsonSerializable()
class Rain extends Object with _$RainSerializerMixin {
  @JsonKey(name: '3h')
  double rain3h;
  Rain(this.rain3h);
  factory Rain.fromJson(Map<String, dynamic> json) => _$RainFromJson(json);
}

@JsonSerializable()
class Snow extends Object with _$SnowSerializerMixin {
  @JsonKey(name: '3h')
  double snow3h;
  Snow(this.snow3h);
  factory Snow.fromJson(Map<String, dynamic> json) => _$SnowFromJson(json);
}

@JsonSerializable()
class Sys extends Object with _$SysSerializerMixin {
  String country;
  int sunrise;
  int sunset;
  Sys(this.country, this.sunrise, this.sunset);
  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}

@JsonSerializable()
class Weather extends Object with _$WeatherSerializerMixin {
  int id;
  String main;
  String description;
  String icon;
  Weather(this.main, this.id, this.description, this.icon);
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@JsonSerializable()
class WeatherModel extends Object with _$WeatherModelSerializerMixin {
  Coord coord;
  Sys sys;
  List<Weather> weather;
  Main main;
  Wind wind;
  Rain rain;
  Clouds clouds;
  @JsonKey(name: 'dt')
  int dateInSeconds;
  int id;
  String name;
  int cod;

  WeatherModel(
    this.clouds,
    this.cod,
    this.coord,
    this.dateInSeconds,
    this.id,
    this.main,
    this.name,
    this.rain,
    this.sys,
    this.weather,
    this.wind,
  );

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}

@JsonSerializable()
class Wind extends Object with _$WindSerializerMixin {
  double speed;
  double deg;
  Wind(this.deg, this.speed);
  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}
