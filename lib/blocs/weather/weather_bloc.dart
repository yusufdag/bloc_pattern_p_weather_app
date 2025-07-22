import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weatherapp_with_bloc/data/weather_repository.dart';
import 'package:flutter_weatherapp_with_bloc/locator.dart';
import 'package:flutter_weatherapp_with_bloc/models/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(InitialWeatherState()) {

    final WeatherRepository weatherRepository = locator<WeatherRepository>();
    // final WeatherRepository weatherRepository2 = locator.get<WeatherRepository>();

    on<WeatherEvent>((event, emit) async {
      if (event is FetchWeatherEvent) {
        emit(WeatherLoadingState());

        try {
          //hava durumu getirme kodları burada olacak
          final Weather introducedWeather = await weatherRepository.getWeather(event.cityName);

          emit(WeatherLoadedState(weatherData: introducedWeather));
        } catch (e) {
          debugPrint("Weather fetch error: $e");
          emit(WeatherErrorState());
        } 
      } else if (event is RefreshWeatherEvent) {

        try {
          //hava durumu getirme kodları burada olacak
          final Weather introducedWeather = await weatherRepository.getWeather(event.cityName);

          emit(WeatherLoadedState(weatherData: introducedWeather));
        } catch (e) {
          debugPrint("Weather fetch error: $e");
          emit(state);
        } 
      }
    });
  }
}
