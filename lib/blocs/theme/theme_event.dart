part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeChangedEvent extends ThemeEvent {
  final String weatherText;
  const ThemeChangedEvent({required this.weatherText});

  @override
  List<Object> get props => [weatherText];
}
