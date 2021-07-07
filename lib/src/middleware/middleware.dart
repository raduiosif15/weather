import 'package:redux/redux.dart';
import 'package:weather/src/actions/get_location.dart';
import 'package:weather/src/data/location_api.dart';
import 'package:weather/src/models/app_state.dart';
import 'package:weather/src/models/location.dart';

class AppMiddleware {
  AppMiddleware({required LocationApi locationApi}) : _locationApi = locationApi;

  final LocationApi _locationApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, GetLocation>(_getLocation),
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
}
