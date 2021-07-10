import 'package:redux/redux.dart';
import 'package:weather/src/actions/get_location.dart';
import 'package:weather/src/actions/get_weather.dart';
import 'package:weather/src/data/location_api.dart';
import 'package:weather/src/data/weather_api.dart';
import 'package:weather/src/models/app_state.dart';
import 'package:weather/src/models/location.dart';
import 'package:weather/src/models/weather.dart';

class AppMiddleware {
  AppMiddleware({required LocationApi locationApi, required WeatherApi weatherApi})
      : _locationApi = locationApi,
        _weatherApi = weatherApi;

  final LocationApi _locationApi;
  final WeatherApi _weatherApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, GetLocation>(_getLocation),
      TypedMiddleware<AppState, GetWeather>(_getWeather),
    ];
  }

  Future<void> _getLocation(Store<AppState> store, GetLocation action, NextDispatcher next) async {
    next(action);

    try {
      final Location location = await _locationApi.getLocation();
      store.dispatch(GetLocationSuccessful(location));
    } catch (error) {
      store.dispatch(GetLocationError(error));
    }
  }

  Future<void> _getWeather(Store<AppState> store, GetWeather action, NextDispatcher next) async {
    next(action);

    try {
      final Weather weather = await _weatherApi.getWeather();
      store.dispatch(GetWeatherSuccessful(weather));
    } catch (error) {
      store.dispatch(GetWeatherError(error));
    }
  }
}
