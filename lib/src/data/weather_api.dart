import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather/src/models/index.dart';

class WeatherApi {
  WeatherApi({required Client client}) : _client = client;

  final Client _client;

  Future<Weather> getWeather(Location location) async {
    final String apiUrl =
        'https://api.openweathermap.org/data/2.5/onecall?lat=${location.lat}&lon=${location.lon}&exclude=hourly,minutely&appid=503ad05f4fe3732aa3078ffcd21a3f09';
    final Uri uri = Uri.parse(apiUrl);
    final Response response = await _client.get(uri);

    if (response.statusCode >= 300) {
      throw StateError(response.body);
    }

    return Weather.fromJson(jsonDecode(response.body));
  }
}
