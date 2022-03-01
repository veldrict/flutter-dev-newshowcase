import 'package:code_id_flutter/code_id_flutter.dart';
import 'package:flutter_dev_newshowcase/domain/core/failures.dart';
import 'package:fpdart/fpdart.dart';

class Pin extends ValueObject<ValueFailure<String>, String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const Pin._(this.value);

  factory Pin(String input) {
    if (input.length == 6) {
      return Pin._(right(input));
    }
    return Pin._(left(ValueFailure.lengthTooShort(failedValue: input, min: 6)));
  }
}
