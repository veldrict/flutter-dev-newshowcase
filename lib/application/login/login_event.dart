part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.usernameChange(String input) = _UsernameChange;
  const factory LoginEvent.passwordChange(String input) = _PasswordChange;
  const factory LoginEvent.submit() = _Submit;
}
