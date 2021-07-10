import 'package:weather/src/models/weather.dart';

class GetWeather {
  GetWeather();

  @override
  String toString() {
    return 'GetWeather{}';
  }
}

class GetWeatherSuccessful {
  GetWeatherSuccessful(this.weather);

  final Weather weather;

  @override
  String toString() {
    return 'GetWeatherSuccessful{weather: $weather}';
  }
}

class GetWeatherError {
  GetWeatherError(this.error);

  final Object error;

  @override
  String toString() {
    return 'GetWeatherError{error: $error}';
  }
}
