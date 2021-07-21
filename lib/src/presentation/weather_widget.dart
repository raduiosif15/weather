import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/src/container/weather_container.dart';
import 'package:weather/src/models/index.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  double _getCelsiusFromKelvin(double temp) {
    return temp - 274.15;
  }

  @override
  Widget build(BuildContext context) {
    return WeatherContainer(
      builder: (BuildContext context, Weather? weather) {
        if (weather == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Column(
          children: <Widget>[
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.wb_sunny_outlined,
                  color: Colors.black,
                  size: 40,
                ),
                Text(
                  _getCelsiusFromKelvin(weather.current.temp).toStringAsFixed(2),
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
