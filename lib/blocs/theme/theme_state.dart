part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();
  
  @override
  List<Object> get props => [];
}

final class AppTheme extends ThemeState {

  final ThemeData theme;
  final MaterialColor color;

  const AppTheme( {required this.theme, required this.color});

  @override
  List<Object> get props => [theme ,color];

}
