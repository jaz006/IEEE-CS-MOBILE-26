import 'package:dio/dio.dart';
import 'package:weatherapp/models/weather_model.dart';

class ApiHelper {
  Future<WeatherModel> getData(String cityName) async {
    String apiKey = 'f92417adebf74911ae6223847231204';
    final response = await Dio().get(
      'https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$cityName&days=7',
    );
    WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    return weatherModel;
  }
}
