import 'package:flutter_weatherapp_with_bloc/data/weather_api_client.dart';
import 'package:flutter_weatherapp_with_bloc/locator.dart';

import '../models/weather.dart';

class WeatherRepository {

  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();

  Future<Weather> getWeather(String city) async {
    final String sehirName = await weatherApiClient.getLocationName(city);
    return await weatherApiClient.getWeather(sehirName);
  }


}