import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseURL = "https://api.weatherapi.com/v1";
  final String apiKey = "4f704f67f87e41cca58161758241402";
  const WeatherService(this.dio);
  Future<WeatherModel?> getWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseURL/forecast.json?key=$apiKey&q=$cityName&days=1");

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          "There was an error, please try later";
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception("There was an error, please try later");
    }
  }
}
