import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather/src/models/weather.dart';

class WeatherApi {
  WeatherApi({required String apiUrl, required Client client})
      : _apiUrl = apiUrl,
        _client = client;

  final String _apiUrl;
  final Client _client;

  Future<Weather> getWeather() async {
    final Uri uri = Uri.parse(_apiUrl);
    final Response response = await _client.get(uri);

    if (response.statusCode >= 300) {
      throw StateError(response.body);
    }

    return Weather.fromJson(jsonDecode(response.body));
  }
}
