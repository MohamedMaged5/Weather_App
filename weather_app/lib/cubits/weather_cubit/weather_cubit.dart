import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/models/weather_model.dart';

import '../../services/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(NoWeatherState());
  WeatherModel? weatherModel;
  getWeather({required String cityname}) async {
    try {
      weatherModel = await WeatherService(Dio()).getWeather(cityName: cityname);
      emit(WeatherLoadedState(weather: weatherModel!));
    } catch (e) {
      emit(WeatherFailState());
    }
  }
}
