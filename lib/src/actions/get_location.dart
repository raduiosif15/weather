part of actions;

@freezed
class GetLocation with _$GetLocation implements AppAction {
  const factory GetLocation() = GetLocationStart;

  const factory GetLocation.successful() = GetLocationSuccessful;

  @Implements(ErrorAction)
  const factory GetLocation.error(Object error, StackTrace stackTrace) = GetLocationError;
}
