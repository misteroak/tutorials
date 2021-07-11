part of 'sign_in_form_bloc.dart';

@freezed
abstract class SignInFormState with _$SignInFormState {
  // This is how you used freezed to create a data class (a class that has equality)
  const factory SignInFormState({
    required EmailAddress emailAddress,
    required Password password,
    required bool isSubmitting,
    // Error message should only show after the user presses a button for the first time
    required bool showErrorMessages,

    /// Option because there could be no response at all from the authentication backend, so it will be:
    /// none() - no response from server
    /// left<failure> - some error
    /// right(Unit) - response with no error
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        isSubmitting: false,
        showErrorMessages: false,
        authFailureOrSuccessOption: none(),
      );
}
