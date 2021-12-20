part of 'pin_bloc.dart';

@freezed
class PinEvent with _$PinEvent {
  const factory PinEvent.started() = _Started;
  const factory PinEvent.onChangePIN({
    required String pin,
  }) = _OnChangePin;
}
