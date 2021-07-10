import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';
import 'package:weather/src/actions/get_location.dart';
import 'package:weather/src/actions/get_weather.dart';
import 'package:weather/src/data/location_api.dart';
import 'package:weather/src/data/weather_api.dart';
import 'package:weather/src/middleware/middleware.dart';
import 'package:weather/src/models/app_state.dart';
import 'package:weather/src/presentation/home_page.dart';
import 'package:weather/src/reducer/reducer.dart';

void main() {
  const String locationApiUrl = 'http://ip-api.com/json/?fields=61439';
  const String weatherApiUrl =
      'https://api.openweathermap.org/data/2.5/onecall?lat=47.0317&lon=23.9092&exclude=hourly,minutely&appid=503ad05f4fe3732aa3078ffcd21a3f09';
  final Client client = Client();
  final LocationApi locationApi = LocationApi(apiUrl: locationApiUrl, client: client);
  final WeatherApi weatherApi = WeatherApi(apiUrl: weatherApiUrl, client: client);
  final AppMiddleware appMiddleware = AppMiddleware(locationApi: locationApi, weatherApi: weatherApi);
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: AppState(),
    middleware: appMiddleware.middleware,
  );
  store.dispatch(GetLocation());
  store.dispatch(GetWeather());

  runApp(WeatherApp(store: store));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key, required this.store}) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
