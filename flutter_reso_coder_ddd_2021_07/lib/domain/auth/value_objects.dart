import 'package:dartz/dartz.dart';

import '../core/failures.dart';
import '../core/value_objects.dart';
import '../core/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  // _ to make the default constructor private, see factory next
  const EmailAddress._(this.value);

  /// We're using a factory constructor because it's hard to have
  /// validation inside a regular constructor
  factory EmailAddress(String input) {
    return EmailAddress._(validateEmailAddress(input));
  }
}

class Password extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  const Password._(this.value);

  factory Password(String input) {
    return Password._(validatePassword(input));
  }
}
