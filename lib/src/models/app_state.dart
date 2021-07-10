library app_state;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:weather/src/models/location.dart';
import 'package:weather/src/models/serializers.dart';
import 'package:weather/src/models/weather.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState([void Function(AppStateBuilder b) updates]) = _$AppState;

  factory AppState.fromJson(dynamic json) => serializers.deserializeWith(serializer, json)!;

  AppState._();

  Location? get location;

  Weather? get weather;

  Map<String, dynamic> get json => serializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<AppState> get serializer => _$appStateSerializer;
}
