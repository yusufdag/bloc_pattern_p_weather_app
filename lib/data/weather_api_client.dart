import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather.dart';

class WeatherApiClient {

  static const baseUrl = 'http://api.weatherapi.com/v1';
  final http.Client httpClient =  http.Client();

  Future<String> getLocationName(String cityName) async {
    final sehirURL = '$baseUrl/current.json?key=f5f12f59eed94bd9964191534251907&q=$cityName&aqi=no';
    final response = await httpClient.get(Uri.parse(sehirURL));

    if (response.statusCode != 200) {
      throw Exception('Failed to load location ID');
    } else {
      
      
      final responseJSON = json.decode(response.body) as Map<String, dynamic>;
      return responseJSON['location']['name'];
    }
  }

  Future<Weather> getWeather (String cityName) async {
    final weatherURL = '$baseUrl/current.json?key=f5f12f59eed94bd9964191534251907&q=$cityName&aqi=no';
    final weatherResponse = await httpClient.get(Uri.parse(weatherURL));

    if (weatherResponse.statusCode != 200) {
      throw Exception('Failed to load weather data');
    } else {
      final weatherResponseJSON = json.decode(weatherResponse.body);
      // You may want to return a Weather object here, e.g.:
      return Weather.fromJson(weatherResponseJSON);
    }
  }

  /* Future<Weather> getForecast(String cityName) async {
  final forecastURL = '$baseUrl/forecast.json?key=API_KEY&q=$cityName&days=6';
  final response = await httpClient.get(Uri.parse(forecastURL));

  if (response.statusCode != 200) {
    throw Exception('Failed to load forecast data');
  } else {
    final jsonBody = json.decode(response.body);
    return Weather.fromJson(jsonBody);
  }
} */



}