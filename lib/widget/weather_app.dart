import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/widget/transitive_background_color.dart';

import '../blocs/theme/theme_bloc.dart';
import '../blocs/weather/bloc.dart';
import 'location.dart';
import 'humidity_and_cloud.dart';
import 'refresh.dart';
import 'select_city.dart';
import 'weather_picture.dart';

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});

  String userSelectedCity = "Ankara"; // Default city

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Weather App',style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              userSelectedCity = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SelectCityWidget(),
                ),
              );
              // debugPrint("Selected City: $userSelectedCity");

              if (userSelectedCity.isNotEmpty) {
                _weatherBloc.add(FetchWeatherEvent(cityName: userSelectedCity));
                debugPrint("Weather data fetched for: $userSelectedCity");
              }

            },
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder(
          bloc: _weatherBloc,
          builder: (context,  state) {

            if (state is InitialWeatherState) {
              return const Center(child: Text("Please select a city"));
            } else if (state is WeatherLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WeatherLoadedState) {

              final broughtWeather = state.weatherData;
              // final _weatherText = broughtWeather.current?.condition?.text;
              /* final _themeBloc = BlocProvider.of<ThemeBloc>(context);

              _themeBloc.add(
                ThemeChangedEvent(weatherText: broughtWeather.current?.weatherText ?? "Unknown"),
              ); */
              
              userSelectedCity = broughtWeather.location?.name ?? "Unknown City";

              BlocProvider.of<ThemeBloc>(context).add(ThemeChangedEvent(
                weatherText: broughtWeather.current?.condition?.text ?? "Unknown",
              ));

              broughtWeather.current?.cloud ??= 0; // Ensure cloud is not null
              

              return BlocBuilder(
                bloc: BlocProvider.of<ThemeBloc>(context),
                builder: (context, state) {
                  return TransitiveColorContainer(
                              color: (state is AppTheme) ? state.color : Colors.blue,
                              child: RefreshIndicator(
                              onRefresh: () async {
                                _weatherBloc.add(RefreshWeatherEvent(cityName: userSelectedCity));
                              },
                                child: ListView(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: LocationWidget(selectedCity: broughtWeather.location?.name ?? "Unknown City"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: RefreshWidget()), //Last Update Widget
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: WeatherPictureWidget(),
                                    ), //Weather Picture Widget
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: HumidityAndCloudWidget(),
                                    ), //Max and Min Temperature Widget
                                  ),
                                ],
                                            ),
                              ),
                            );
                },
              );

              //debugPrint("Weather data loaded for: ${state.weatherData.current}");
            } else if (state is WeatherErrorState) {
              return const Center(child: Text("Error fetching weather data"));
            } 

            // Always return a widget as a fallback
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
