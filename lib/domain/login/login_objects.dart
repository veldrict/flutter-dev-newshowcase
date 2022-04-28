import 'package:code_id_flutter/code_id_flutter.dart';
import 'package:flutter_dev_newshowcase/domain/core/failures.dart';
import 'package:fpdart/fpdart.dart';

class LoginUsername extends ValueObject<ValueFailure<String>, String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const LoginUsername._(this.value);

  factory LoginUsername(String input) {
    if (input.length > 6) {
      return LoginUsername._(right(input));
    }
    return LoginUsername._(
      left(
        ValueFailure.lengthTooShort(
          failedValue: input,
          min: 6,
        ),
      ),
    );
  }
}

class LoginPassword extends ValueObject<ValueFailure<String>, String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const LoginPassword._(this.value);

  factory LoginPassword(String input) {
    if (input == '') {
      return LoginPassword._(
        left(
          ValueFailure.empty(failedValue: input),
        ),
      );
    }
    if (CommonUtils.validatePassword(input)) {
      return LoginPassword._(right(input));
    }
    return LoginPassword._(
      left(
        ValueFailure.invalidObject(failedValue: input),
      ),
    );
  }
}
