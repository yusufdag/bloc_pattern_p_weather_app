import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/weather/weather_bloc.dart';

class RefreshWidget extends StatelessWidget {
  const RefreshWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context); // Event

    return BlocBuilder(
      // State
      bloc: _weatherBloc,
      builder: (context, WeatherState state) {
        //var lastUpdatedString = (state as WeatherLoadedState).weatherData.current?.lastUpdated;
        //var newDate = lastUpdatedString != null ? DateTime.parse(lastUpdatedString).toLocal() : null;
        return Text(
          /* newDate != null
              ? 'Last Update: ${TimeOfDay.fromDateTime(newDate).format(context)}'
              : 'Last Update: N/A', */
          'Last Update: ${TimeOfDay.now().format(context)}',
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        );
      },
    );
  }
}
