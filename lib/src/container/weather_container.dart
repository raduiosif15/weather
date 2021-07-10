import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:weather/src/models/app_state.dart';
import 'package:weather/src/models/weather.dart';

class WeatherContainer extends StatelessWidget {
  const WeatherContainer({Key? key, required this.builder}) : super(key: key);

  final ViewModelBuilder<Weather?> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Weather?>(
      converter: (Store<AppState> store) => store.state.weather,
      builder: builder,
    );
  }
}
