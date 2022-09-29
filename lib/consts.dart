import 'package:flutter_weather_bg/utils/weather_type.dart';

const Map<String, WeatherType>  kWeatherTypes = {
  'clear': WeatherType.sunny,
  'clouds': WeatherType.cloudy,
  'rain': WeatherType.middleRainy,
  'snow': WeatherType.middleSnow,
  'drizzle': WeatherType.foggy,
  'thunderstorm': WeatherType.middleRainy,
  'clearNight': WeatherType.sunnyNight,
  'cloudsNight': WeatherType.cloudyNight,
};

const Map<String, WeatherType>  kWeatherNTypes = {
  'clear': WeatherType.sunnyNight,
  'clouds': WeatherType.cloudyNight,
  'rain': WeatherType.middleRainy,
  'snow': WeatherType.middleSnow,
  'drizzle': WeatherType.foggy,
  'thunderstorm': WeatherType.middleRainy
};