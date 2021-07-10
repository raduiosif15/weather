import 'package:flutter/material.dart';
import 'package:weather/src/presentation/location_widget.dart';
import 'package:weather/src/presentation/weather_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String backgroundImage = 'clear.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Location'),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 80.0, 0, 0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$backgroundImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            const LocationWidget(),
            const WeatherWidget(),
            Row(),
          ],
        ),
      ),
    );
  }
}
