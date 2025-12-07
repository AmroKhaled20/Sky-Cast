import 'dart:developer';

import 'package:ak_weather_app/models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherServices {
  final Dio dio;
  WeatherServices(this.dio);

  final String apiKey = 'e3f5bd59c4e345ca83a70648252808';
  final String baseURL = 'https://api.weatherapi.com/v1';

  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseURL/forecast.json?key=$apiKey&q=$cityName&days=1&lang=en',
      );
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ??
          'oops there was an error, try later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error, try later');
    }
  }
}
