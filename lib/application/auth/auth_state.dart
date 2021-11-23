part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.eitherAuthOrNot(
      {required Either<Unit, Unit> either}) = _EitherAuthOrNot;
}
