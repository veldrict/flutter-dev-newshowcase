part of 'pin_bloc.dart';

@freezed
class PinState with _$PinState {
  const factory PinState({
    required Pin pin,
    required bool isSubmitting,
    required bool isShowError,
    required Option<Either<Unit, Unit>> options,
  }) = _PinState;

  factory PinState.initial() => PinState(
      pin: Pin(''), isSubmitting: false, isShowError: false, options: none());
}
