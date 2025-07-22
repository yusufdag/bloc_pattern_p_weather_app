import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/weather/weather_bloc.dart';

class WeatherPictureWidget extends StatelessWidget {
  const WeatherPictureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (context, WeatherState state) {
        return Column(
          children: [
            Text(
              "${(state as WeatherLoadedState).weatherData.current?.tempC?.floor()} °C",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https:${(state as WeatherLoadedState).weatherData.current?.condition?.icon ?? ''}",
              ),
              fit: BoxFit.contain,
            ),
          ),
        )
          ],
        );
      },
    );
  }
}
