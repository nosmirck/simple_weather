// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coord _$CoordFromJson(Map<String, dynamic> json) {
  return new Coord(
      (json['lat'] as num)?.toDouble(), (json['lon'] as num)?.toDouble());
}

abstract class _$CoordSerializerMixin {
  double get lon;
  double get lat;
  Map<String, dynamic> toJson() => <String, dynamic>{'lon': lon, 'lat': lat};
}

Sys _$SysFromJson(Map<String, dynamic> json) {
  return new Sys(
      json['country'] as String, json['sunrise'] as int, json['sunset'] as int);
}

abstract class _$SysSerializerMixin {
  String get country;
  int get sunrise;
  int get sunset;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'country': country,
        'sunrise': sunrise,
        'sunset': sunset
      };
}

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return new Weather(json['main'] as String, json['id'] as int,
      json['description'] as String, json['icon'] as String);
}

abstract class _$WeatherSerializerMixin {
  int get id;
  String get main;
  String get description;
  String get icon;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'main': main,
        'description': description,
        'icon': icon
      };
}

Main _$MainFromJson(Map<String, dynamic> json) {
  return new Main(
      (json['humidity'] as num)?.toDouble(),
      (json['pressure'] as num)?.toDouble(),
      (json['temp'] as num)?.toDouble(),
      (json['temp_max'] as num)?.toDouble(),
      (json['temp_min'] as num)?.toDouble());
}

abstract class _$MainSerializerMixin {
  double get temp;
  double get humidity;
  double get pressure;
  double get tempMin;
  double get tempMax;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'temp': temp,
        'humidity': humidity,
        'pressure': pressure,
        'temp_min': tempMin,
        'temp_max': tempMax
      };
}

Wind _$WindFromJson(Map<String, dynamic> json) {
  return new Wind(
      (json['deg'] as num)?.toDouble(), (json['speed'] as num)?.toDouble());
}

abstract class _$WindSerializerMixin {
  double get speed;
  double get deg;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'speed': speed, 'deg': deg};
}

Rain _$RainFromJson(Map<String, dynamic> json) {
  return new Rain((json['3h'] as num)?.toDouble());
}

abstract class _$RainSerializerMixin {
  double get rain3h;
  Map<String, dynamic> toJson() => <String, dynamic>{'3h': rain3h};
}

Snow _$SnowFromJson(Map<String, dynamic> json) {
  return new Snow((json['3h'] as num)?.toDouble());
}

abstract class _$SnowSerializerMixin {
  double get snow3h;
  Map<String, dynamic> toJson() => <String, dynamic>{'3h': snow3h};
}

Clouds _$CloudsFromJson(Map<String, dynamic> json) {
  return new Clouds((json['all'] as num)?.toDouble());
}

abstract class _$CloudsSerializerMixin {
  double get all;
  Map<String, dynamic> toJson() => <String, dynamic>{'all': all};
}

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) {
  return new WeatherModel(
      json['clouds'] == null
          ? null
          : new Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
      json['cod'] as int,
      json['coord'] == null
          ? null
          : new Coord.fromJson(json['coord'] as Map<String, dynamic>),
      json['dt'] as int,
      json['id'] as int,
      json['main'] == null
          ? null
          : new Main.fromJson(json['main'] as Map<String, dynamic>),
      json['name'] as String,
      json['rain'] == null
          ? null
          : new Rain.fromJson(json['rain'] as Map<String, dynamic>),
      json['sys'] == null
          ? null
          : new Sys.fromJson(json['sys'] as Map<String, dynamic>),
      (json['weather'] as List)
          ?.map((e) => e == null
              ? null
              : new Weather.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['wind'] == null
          ? null
          : new Wind.fromJson(json['wind'] as Map<String, dynamic>));
}

abstract class _$WeatherModelSerializerMixin {
  Coord get coord;
  Sys get sys;
  List<Weather> get weather;
  Main get main;
  Wind get wind;
  Rain get rain;
  Clouds get clouds;
  int get dateInSeconds;
  int get id;
  String get name;
  int get cod;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'coord': coord,
        'sys': sys,
        'weather': weather,
        'main': main,
        'wind': wind,
        'rain': rain,
        'clouds': clouds,
        'dt': dateInSeconds,
        'id': id,
        'name': name,
        'cod': cod
      };
}
