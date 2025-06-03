// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../password_reset_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PasswordResetParams {
  String get emailToken => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get newPassword => throw _privateConstructorUsedError;
  String get confirmNewPassword => throw _privateConstructorUsedError;

  /// Create a copy of PasswordResetParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PasswordResetParamsCopyWith<PasswordResetParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordResetParamsCopyWith<$Res> {
  factory $PasswordResetParamsCopyWith(
    PasswordResetParams value,
    $Res Function(PasswordResetParams) then,
  ) = _$PasswordResetParamsCopyWithImpl<$Res, PasswordResetParams>;
  @useResult
  $Res call({
    String emailToken,
    String email,
    String newPassword,
    String confirmNewPassword,
  });
}

/// @nodoc
class _$PasswordResetParamsCopyWithImpl<$Res, $Val extends PasswordResetParams>
    implements $PasswordResetParamsCopyWith<$Res> {
  _$PasswordResetParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PasswordResetParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailToken = null,
    Object? email = null,
    Object? newPassword = null,
    Object? confirmNewPassword = null,
  }) {
    return _then(
      _value.copyWith(
            emailToken:
                null == emailToken
                    ? _value.emailToken
                    : emailToken // ignore: cast_nullable_to_non_nullable
                        as String,
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            newPassword:
                null == newPassword
                    ? _value.newPassword
                    : newPassword // ignore: cast_nullable_to_non_nullable
                        as String,
            confirmNewPassword:
                null == confirmNewPassword
                    ? _value.confirmNewPassword
                    : confirmNewPassword // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PasswordResetParamsImplCopyWith<$Res>
    implements $PasswordResetParamsCopyWith<$Res> {
  factory _$$PasswordResetParamsImplCopyWith(
    _$PasswordResetParamsImpl value,
    $Res Function(_$PasswordResetParamsImpl) then,
  ) = __$$PasswordResetParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String emailToken,
    String email,
    String newPassword,
    String confirmNewPassword,
  });
}

/// @nodoc
class __$$PasswordResetParamsImplCopyWithImpl<$Res>
    extends _$PasswordResetParamsCopyWithImpl<$Res, _$PasswordResetParamsImpl>
    implements _$$PasswordResetParamsImplCopyWith<$Res> {
  __$$PasswordResetParamsImplCopyWithImpl(
    _$PasswordResetParamsImpl _value,
    $Res Function(_$PasswordResetParamsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PasswordResetParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailToken = null,
    Object? email = null,
    Object? newPassword = null,
    Object? confirmNewPassword = null,
  }) {
    return _then(
      _$PasswordResetParamsImpl(
        emailToken:
            null == emailToken
                ? _value.emailToken
                : emailToken // ignore: cast_nullable_to_non_nullable
                    as String,
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        newPassword:
            null == newPassword
                ? _value.newPassword
                : newPassword // ignore: cast_nullable_to_non_nullable
                    as String,
        confirmNewPassword:
            null == confirmNewPassword
                ? _value.confirmNewPassword
                : confirmNewPassword // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$PasswordResetParamsImpl implements _PasswordResetParams {
  const _$PasswordResetParamsImpl({
    required this.emailToken,
    required this.email,
    required this.newPassword,
    required this.confirmNewPassword,
  });

  @override
  final String emailToken;
  @override
  final String email;
  @override
  final String newPassword;
  @override
  final String confirmNewPassword;

  @override
  String toString() {
    return 'PasswordResetParams(emailToken: $emailToken, email: $email, newPassword: $newPassword, confirmNewPassword: $confirmNewPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordResetParamsImpl &&
            (identical(other.emailToken, emailToken) ||
                other.emailToken == emailToken) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.confirmNewPassword, confirmNewPassword) ||
                other.confirmNewPassword == confirmNewPassword));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    emailToken,
    email,
    newPassword,
    confirmNewPassword,
  );

  /// Create a copy of PasswordResetParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordResetParamsImplCopyWith<_$PasswordResetParamsImpl> get copyWith =>
      __$$PasswordResetParamsImplCopyWithImpl<_$PasswordResetParamsImpl>(
        this,
        _$identity,
      );
}

abstract class _PasswordResetParams implements PasswordResetParams {
  const factory _PasswordResetParams({
    required final String emailToken,
    required final String email,
    required final String newPassword,
    required final String confirmNewPassword,
  }) = _$PasswordResetParamsImpl;

  @override
  String get emailToken;
  @override
  String get email;
  @override
  String get newPassword;
  @override
  String get confirmNewPassword;

  /// Create a copy of PasswordResetParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordResetParamsImplCopyWith<_$PasswordResetParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
