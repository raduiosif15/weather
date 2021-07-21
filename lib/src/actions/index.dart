library actions;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'index.freezed.dart';

part 'get_location.dart';

part 'get_weather.dart';

abstract class AppAction {}

abstract class ErrorAction implements AppAction {
  Object get error;

  Object get stackTrace;
}
