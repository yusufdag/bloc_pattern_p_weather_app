import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(AppTheme(color: Colors.blue, theme: ThemeData.light())) {
    on<ThemeEvent>((event, emit) {
      if (event is ThemeChangedEvent) {
        switch (event.weatherText) {
          case 'Partly cloudy':
          case 'Rainy':
          case 'Cloudy':
          case 'Overcast':
          case 'Drizzle':
          case 'Mist':
          case 'Fog':
          case 'Haze':
          case 'Smoke':
          case 'Dust':
          case 'Sand':
          case 'Ash':
          case 'Squalls':
          case 'Tornado':
          case 'Blowing snow':
          case 'Snow':
          case 'Sleet':
          case 'Freezing rain':
          case 'Ice pellets':
          case 'Light rain':
          case 'Heavy rain':
          case 'Light snow':
          case 'Heavy snow':
          case 'Light sleet':
          case 'Heavy sleet':
          case 'Light freezing rain':
            emit(
              AppTheme(
                color: Colors.blueGrey,
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
                  useMaterial3: true,
                  appBarTheme: AppBarTheme(
                    backgroundColor: Colors.blueGrey,
                  ),
                ),
              ),
            );
            break;

          case 'Sunny':
          case 'Clear':
          case 'Fair':
          case 'Hot':
            emit(
              AppTheme(
                color: Colors.yellow,
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: Colors.orangeAccent,
                  ),
                  useMaterial3: true,
                  appBarTheme: AppBarTheme(
                    backgroundColor: Colors.orangeAccent,
                  ),
                ),
              ),
            );
            break;
        }
      }

      /* if (event is ThemeChangedEvent) {
        switch (event.weatherText) {
          case 'Partly cloudy': // Partly cloud weather
          emit(AppTheme(
            color: Colors.blueGrey,
            theme: ThemeData.light().copyWith(
              primaryColor: Colors.blueGrey,
              hintColor: Colors.blueGrey,
            ),
          ));
            break;    
          case 'Rainy': // Rainy weather
          emit(AppTheme(
            color: Colors.blueGrey,
            theme: ThemeData.light().copyWith(
              primaryColor: Colors.blueGrey,
              hintColor: Colors.blueGrey,
            ),
          ));
            break; 
          case 'Cloudy': // Cloudy weather
            emit(AppTheme(
            color: Colors.blueGrey,
            theme: ThemeData.light().copyWith(
              primaryColor: Colors.blueGrey,
              hintColor: Colors.blueGrey,
            ),
          ));
            break; 
          /////////////////////////////////////
          
          case 'Sunny': // Sunny weather
          emit(AppTheme(
            color: Colors.yellow,
            theme: ThemeData.light().copyWith(
              primaryColor: Colors.orangeAccent,
              hintColor: Colors.orangeAccent,
            ),
          ));
            break;
          case 'Clear': // Clear weather
            emit(AppTheme(
            color: Colors.yellow,
            theme: ThemeData.light().copyWith(
              primaryColor: Colors.orangeAccent,
              hintColor: Colors.orangeAccent,
            ),
          ));
            break;
        }
        
      } */

      /* if (event is ThemeChangedEvent) {
        switch (event.weatherText) {
          case 'Partly cloudy': // Partly cloud weather
          case 'Rainy': // Rainy weather
          case 'Cloudy': // Cloudy weather
            appTheme = AppTheme(
              color: Colors.blueGrey,
              theme: ThemeData.light().copyWith(
                primaryColor: Colors.blueGrey,
                hintColor: Colors.blueGrey,
              ),
            );
            break;

          case 'Sunny': // Sunny weather
          case 'Clear': // Clear weather
            appTheme = AppTheme(
              color: Colors.yellow,
              theme: ThemeData.light().copyWith(
                primaryColor: Colors.orangeAccent,
                hintColor: Colors.orangeAccent,
              ),
            );
            break;
        }
        emit(appTheme);
      } */
    });
  }
}
