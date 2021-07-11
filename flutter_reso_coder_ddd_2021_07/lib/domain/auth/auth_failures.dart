/// This failures will be true for our app regardless of the authentication method we use in the end

import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failures.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.cancelByUser() = CancelByUser; // User taps out of 3 party SSO (Google)
  const factory AuthFailure.serverError() = ServerError; // Catch all when we don't know what when wrong
  const factory AuthFailure.emailAlreadyInUse() =
      EmailAlreadyInUse; // User tries to sign in with an email that already exists
  const factory AuthFailure.invalidUserPassword() = InvalidUserPassword; // Invalid User/Pass combination
}
