import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/src/container/location_container.dart';
import 'package:weather/src/models/location.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LocationContainer(
      builder: (BuildContext context, Location? location) {
        if (location == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.add_location_outlined,
                  color: Colors.black,
                  size: 40,
                ),
                Text(
                  '${location.city}, ${location.country}',
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.add_location_outlined,
                  color: Colors.black,
                  size: 40,
                ),
                Text(
                  '${location.lat}, ${location.lon}',
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
