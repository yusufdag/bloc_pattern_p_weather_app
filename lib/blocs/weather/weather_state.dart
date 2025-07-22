part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();
  
  @override
  List<Object> get props => [];
}

final class InitialWeatherState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final Weather weatherData;

  const WeatherLoadedState({required this.weatherData});

  @override
  List<Object> get props => [weatherData];
}

class WeatherErrorState extends WeatherState {}
