// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthFailureTearOff {
  const _$AuthFailureTearOff();

  CancelByUser cancelByUser() {
    return const CancelByUser();
  }

  ServerError serverError() {
    return const ServerError();
  }

  EmailAlreadyInUse emailAlreadyInUse() {
    return const EmailAlreadyInUse();
  }

  InvalidUserPassword invalidUserPassword() {
    return const InvalidUserPassword();
  }
}

/// @nodoc
const $AuthFailure = _$AuthFailureTearOff();

/// @nodoc
mixin _$AuthFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cancelByUser,
    required TResult Function() serverError,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() invalidUserPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cancelByUser,
    TResult Function()? serverError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? invalidUserPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelByUser value) cancelByUser,
    required TResult Function(ServerError value) serverError,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(InvalidUserPassword value) invalidUserPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelByUser value)? cancelByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(InvalidUserPassword value)? invalidUserPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res> implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  final AuthFailure _value;
  // ignore: unused_field
  final $Res Function(AuthFailure) _then;
}

/// @nodoc
abstract class $CancelByUserCopyWith<$Res> {
  factory $CancelByUserCopyWith(
          CancelByUser value, $Res Function(CancelByUser) then) =
      _$CancelByUserCopyWithImpl<$Res>;
}

/// @nodoc
class _$CancelByUserCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements $CancelByUserCopyWith<$Res> {
  _$CancelByUserCopyWithImpl(
      CancelByUser _value, $Res Function(CancelByUser) _then)
      : super(_value, (v) => _then(v as CancelByUser));

  @override
  CancelByUser get _value => super._value as CancelByUser;
}

/// @nodoc

class _$CancelByUser implements CancelByUser {
  const _$CancelByUser();

  @override
  String toString() {
    return 'AuthFailure.cancelByUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CancelByUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cancelByUser,
    required TResult Function() serverError,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() invalidUserPassword,
  }) {
    return cancelByUser();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cancelByUser,
    TResult Function()? serverError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? invalidUserPassword,
    required TResult orElse(),
  }) {
    if (cancelByUser != null) {
      return cancelByUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelByUser value) cancelByUser,
    required TResult Function(ServerError value) serverError,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(InvalidUserPassword value) invalidUserPassword,
  }) {
    return cancelByUser(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelByUser value)? cancelByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(InvalidUserPassword value)? invalidUserPassword,
    required TResult orElse(),
  }) {
    if (cancelByUser != null) {
      return cancelByUser(this);
    }
    return orElse();
  }
}

abstract class CancelByUser implements AuthFailure {
  const factory CancelByUser() = _$CancelByUser;
}

/// @nodoc
abstract class $ServerErrorCopyWith<$Res> {
  factory $ServerErrorCopyWith(
          ServerError value, $Res Function(ServerError) then) =
      _$ServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$ServerErrorCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements $ServerErrorCopyWith<$Res> {
  _$ServerErrorCopyWithImpl(
      ServerError _value, $Res Function(ServerError) _then)
      : super(_value, (v) => _then(v as ServerError));

  @override
  ServerError get _value => super._value as ServerError;
}

/// @nodoc

class _$ServerError implements ServerError {
  const _$ServerError();

  @override
  String toString() {
    return 'AuthFailure.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cancelByUser,
    required TResult Function() serverError,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() invalidUserPassword,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cancelByUser,
    TResult Function()? serverError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? invalidUserPassword,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelByUser value) cancelByUser,
    required TResult Function(ServerError value) serverError,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(InvalidUserPassword value) invalidUserPassword,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelByUser value)? cancelByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(InvalidUserPassword value)? invalidUserPassword,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError implements AuthFailure {
  const factory ServerError() = _$ServerError;
}

/// @nodoc
abstract class $EmailAlreadyInUseCopyWith<$Res> {
  factory $EmailAlreadyInUseCopyWith(
          EmailAlreadyInUse value, $Res Function(EmailAlreadyInUse) then) =
      _$EmailAlreadyInUseCopyWithImpl<$Res>;
}

/// @nodoc
class _$EmailAlreadyInUseCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements $EmailAlreadyInUseCopyWith<$Res> {
  _$EmailAlreadyInUseCopyWithImpl(
      EmailAlreadyInUse _value, $Res Function(EmailAlreadyInUse) _then)
      : super(_value, (v) => _then(v as EmailAlreadyInUse));

  @override
  EmailAlreadyInUse get _value => super._value as EmailAlreadyInUse;
}

/// @nodoc

class _$EmailAlreadyInUse implements EmailAlreadyInUse {
  const _$EmailAlreadyInUse();

  @override
  String toString() {
    return 'AuthFailure.emailAlreadyInUse()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EmailAlreadyInUse);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cancelByUser,
    required TResult Function() serverError,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() invalidUserPassword,
  }) {
    return emailAlreadyInUse();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cancelByUser,
    TResult Function()? serverError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? invalidUserPassword,
    required TResult orElse(),
  }) {
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelByUser value) cancelByUser,
    required TResult Function(ServerError value) serverError,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(InvalidUserPassword value) invalidUserPassword,
  }) {
    return emailAlreadyInUse(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelByUser value)? cancelByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(InvalidUserPassword value)? invalidUserPassword,
    required TResult orElse(),
  }) {
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse(this);
    }
    return orElse();
  }
}

abstract class EmailAlreadyInUse implements AuthFailure {
  const factory EmailAlreadyInUse() = _$EmailAlreadyInUse;
}

/// @nodoc
abstract class $InvalidUserPasswordCopyWith<$Res> {
  factory $InvalidUserPasswordCopyWith(
          InvalidUserPassword value, $Res Function(InvalidUserPassword) then) =
      _$InvalidUserPasswordCopyWithImpl<$Res>;
}

/// @nodoc
class _$InvalidUserPasswordCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements $InvalidUserPasswordCopyWith<$Res> {
  _$InvalidUserPasswordCopyWithImpl(
      InvalidUserPassword _value, $Res Function(InvalidUserPassword) _then)
      : super(_value, (v) => _then(v as InvalidUserPassword));

  @override
  InvalidUserPassword get _value => super._value as InvalidUserPassword;
}

/// @nodoc

class _$InvalidUserPassword implements InvalidUserPassword {
  const _$InvalidUserPassword();

  @override
  String toString() {
    return 'AuthFailure.invalidUserPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InvalidUserPassword);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cancelByUser,
    required TResult Function() serverError,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() invalidUserPassword,
  }) {
    return invalidUserPassword();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cancelByUser,
    TResult Function()? serverError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? invalidUserPassword,
    required TResult orElse(),
  }) {
    if (invalidUserPassword != null) {
      return invalidUserPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelByUser value) cancelByUser,
    required TResult Function(ServerError value) serverError,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(InvalidUserPassword value) invalidUserPassword,
  }) {
    return invalidUserPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelByUser value)? cancelByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(InvalidUserPassword value)? invalidUserPassword,
    required TResult orElse(),
  }) {
    if (invalidUserPassword != null) {
      return invalidUserPassword(this);
    }
    return orElse();
  }
}

abstract class InvalidUserPassword implements AuthFailure {
  const factory InvalidUserPassword() = _$InvalidUserPassword;
}
