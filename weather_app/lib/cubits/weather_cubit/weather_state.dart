part of 'weather_cubit.dart';

@immutable
class WeatherState {}

class NoWeatherState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weather;
  WeatherLoadedState({required this.weather});
}

class WeatherFailState extends WeatherState {}
