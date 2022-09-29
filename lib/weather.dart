import 'package:flutter_weather_bg/utils/weather_type.dart';

class Weather {
  final String city;
  final num temp;
  final String desc;
  final WeatherType mainType;

  Weather(
      {required this.city,
      required this.temp,
      required this.desc,
      required this.mainType});
}
