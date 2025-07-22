import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/blocs/theme/theme_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/locator.dart';

import 'blocs/weather/weather_bloc.dart';
import 'widget/weather_app.dart';

void main() {
  setupLocator(); // Initialize the service locator
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized before running the app
  runApp(
    BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      bloc: BlocProvider.of<ThemeBloc>(context),
      builder: (context, ThemeState state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather App',
          theme: (state is AppTheme) ? state.theme : ThemeData.light(),
          home: BlocProvider<WeatherBloc>(
            create: (context) => WeatherBloc(),
            child: WeatherApp(),
          ),
        );
      },
    );
  }
}
