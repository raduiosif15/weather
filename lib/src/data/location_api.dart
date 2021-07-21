import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather/src/models/index.dart';

class LocationApi {
  LocationApi({required String apiUrl, required Client client})
      : _apiUrl = apiUrl,
        _client = client;

  final String _apiUrl;
  final Client _client;

  Future<Location> getLocation() async {
    final Uri uri = Uri.parse(_apiUrl);
    final Response response = await _client.get(uri);

    if (response.statusCode >= 300) {
      throw StateError(response.body);
    }

    return Location.fromJson(jsonDecode(response.body));
  }
}
