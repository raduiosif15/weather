import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/src/container/weather_container.dart';
import 'package:weather/src/models/weather.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WeatherContainer(
      builder: (BuildContext context, Weather? weather) {
        if (weather == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Text('${weather.current.temp}');
      },
    );
  }
}
