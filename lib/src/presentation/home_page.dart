import 'package:flutter/material.dart';
import 'package:weather/src/container/location_container.dart';
import 'package:weather/src/models/location.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),
      body: LocationContainer(
        builder: (BuildContext context, Location? location) {
          if (location == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            children: <Widget>[
              Text('Tara: ${location.country}'),
              Text('Oras: ${location.city}'),
              Text('Latitudine: ${location.lat}'),
              Text('Longitudine: ${location.lon}'),
            ],
          );
        },
      ),
    );
  }
}
