// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../find_password_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FindPasswordState {
  Status get postVerificationRequestStatus =>
      throw _privateConstructorUsedError;
  Status get postVerifyStatus => throw _privateConstructorUsedError;

  /// TODO: 비밀번호 변경 api 만들어지면 제대로 변수명 짓기
  Status get passwordStatus => throw _privateConstructorUsedError;
  EmailVerificationRequestModel get verificationRequestData =>
      throw _privateConstructorUsedError;
  EmailVerifyModel get verifyData => throw _privateConstructorUsedError;
  ExceptionModel get exception => throw _privateConstructorUsedError;

  /// Create a copy of FindPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FindPasswordStateCopyWith<FindPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindPasswordStateCopyWith<$Res> {
  factory $FindPasswordStateCopyWith(
    FindPasswordState value,
    $Res Function(FindPasswordState) then,
  ) = _$FindPasswordStateCopyWithImpl<$Res, FindPasswordState>;
  @useResult
  $Res call({
    Status postVerificationRequestStatus,
    Status postVerifyStatus,
    Status passwordStatus,
    EmailVerificationRequestModel verificationRequestData,
    EmailVerifyModel verifyData,
    ExceptionModel exception,
  });
}

/// @nodoc
class _$FindPasswordStateCopyWithImpl<$Res, $Val extends FindPasswordState>
    implements $FindPasswordStateCopyWith<$Res> {
  _$FindPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FindPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postVerificationRequestStatus = null,
    Object? postVerifyStatus = null,
    Object? passwordStatus = null,
    Object? verificationRequestData = null,
    Object? verifyData = null,
    Object? exception = null,
  }) {
    return _then(
      _value.copyWith(
            postVerificationRequestStatus:
                null == postVerificationRequestStatus
                    ? _value.postVerificationRequestStatus
                    : postVerificationRequestStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            postVerifyStatus:
                null == postVerifyStatus
                    ? _value.postVerifyStatus
                    : postVerifyStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            passwordStatus:
                null == passwordStatus
                    ? _value.passwordStatus
                    : passwordStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            verificationRequestData:
                null == verificationRequestData
                    ? _value.verificationRequestData
                    : verificationRequestData // ignore: cast_nullable_to_non_nullable
                        as EmailVerificationRequestModel,
            verifyData:
                null == verifyData
                    ? _value.verifyData
                    : verifyData // ignore: cast_nullable_to_non_nullable
                        as EmailVerifyModel,
            exception:
                null == exception
                    ? _value.exception
                    : exception // ignore: cast_nullable_to_non_nullable
                        as ExceptionModel,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FindPasswordStateImplCopyWith<$Res>
    implements $FindPasswordStateCopyWith<$Res> {
  factory _$$FindPasswordStateImplCopyWith(
    _$FindPasswordStateImpl value,
    $Res Function(_$FindPasswordStateImpl) then,
  ) = __$$FindPasswordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Status postVerificationRequestStatus,
    Status postVerifyStatus,
    Status passwordStatus,
    EmailVerificationRequestModel verificationRequestData,
    EmailVerifyModel verifyData,
    ExceptionModel exception,
  });
}

/// @nodoc
class __$$FindPasswordStateImplCopyWithImpl<$Res>
    extends _$FindPasswordStateCopyWithImpl<$Res, _$FindPasswordStateImpl>
    implements _$$FindPasswordStateImplCopyWith<$Res> {
  __$$FindPasswordStateImplCopyWithImpl(
    _$FindPasswordStateImpl _value,
    $Res Function(_$FindPasswordStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FindPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postVerificationRequestStatus = null,
    Object? postVerifyStatus = null,
    Object? passwordStatus = null,
    Object? verificationRequestData = null,
    Object? verifyData = null,
    Object? exception = null,
  }) {
    return _then(
      _$FindPasswordStateImpl(
        postVerificationRequestStatus:
            null == postVerificationRequestStatus
                ? _value.postVerificationRequestStatus
                : postVerificationRequestStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        postVerifyStatus:
            null == postVerifyStatus
                ? _value.postVerifyStatus
                : postVerifyStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        passwordStatus:
            null == passwordStatus
                ? _value.passwordStatus
                : passwordStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        verificationRequestData:
            null == verificationRequestData
                ? _value.verificationRequestData
                : verificationRequestData // ignore: cast_nullable_to_non_nullable
                    as EmailVerificationRequestModel,
        verifyData:
            null == verifyData
                ? _value.verifyData
                : verifyData // ignore: cast_nullable_to_non_nullable
                    as EmailVerifyModel,
        exception:
            null == exception
                ? _value.exception
                : exception // ignore: cast_nullable_to_non_nullable
                    as ExceptionModel,
      ),
    );
  }
}

/// @nodoc

class _$FindPasswordStateImpl implements _FindPasswordState {
  const _$FindPasswordStateImpl({
    this.postVerificationRequestStatus = Status.initial,
    this.postVerifyStatus = Status.initial,
    this.passwordStatus = Status.initial,
    this.verificationRequestData = const EmailVerificationRequestModel(
      message: '',
      expirationMinutes: -1,
    ),
    this.verifyData = const EmailVerifyModel(
      verificationToken: '',
      verified: false,
    ),
    this.exception = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
  });

  @override
  @JsonKey()
  final Status postVerificationRequestStatus;
  @override
  @JsonKey()
  final Status postVerifyStatus;

  /// TODO: 비밀번호 변경 api 만들어지면 제대로 변수명 짓기
  @override
  @JsonKey()
  final Status passwordStatus;
  @override
  @JsonKey()
  final EmailVerificationRequestModel verificationRequestData;
  @override
  @JsonKey()
  final EmailVerifyModel verifyData;
  @override
  @JsonKey()
  final ExceptionModel exception;

  @override
  String toString() {
    return 'FindPasswordState(postVerificationRequestStatus: $postVerificationRequestStatus, postVerifyStatus: $postVerifyStatus, passwordStatus: $passwordStatus, verificationRequestData: $verificationRequestData, verifyData: $verifyData, exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindPasswordStateImpl &&
            (identical(
                  other.postVerificationRequestStatus,
                  postVerificationRequestStatus,
                ) ||
                other.postVerificationRequestStatus ==
                    postVerificationRequestStatus) &&
            (identical(other.postVerifyStatus, postVerifyStatus) ||
                other.postVerifyStatus == postVerifyStatus) &&
            (identical(other.passwordStatus, passwordStatus) ||
                other.passwordStatus == passwordStatus) &&
            (identical(
                  other.verificationRequestData,
                  verificationRequestData,
                ) ||
                other.verificationRequestData == verificationRequestData) &&
            (identical(other.verifyData, verifyData) ||
                other.verifyData == verifyData) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    postVerificationRequestStatus,
    postVerifyStatus,
    passwordStatus,
    verificationRequestData,
    verifyData,
    exception,
  );

  /// Create a copy of FindPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FindPasswordStateImplCopyWith<_$FindPasswordStateImpl> get copyWith =>
      __$$FindPasswordStateImplCopyWithImpl<_$FindPasswordStateImpl>(
        this,
        _$identity,
      );
}

abstract class _FindPasswordState implements FindPasswordState {
  const factory _FindPasswordState({
    final Status postVerificationRequestStatus,
    final Status postVerifyStatus,
    final Status passwordStatus,
    final EmailVerificationRequestModel verificationRequestData,
    final EmailVerifyModel verifyData,
    final ExceptionModel exception,
  }) = _$FindPasswordStateImpl;

  @override
  Status get postVerificationRequestStatus;
  @override
  Status get postVerifyStatus;

  /// TODO: 비밀번호 변경 api 만들어지면 제대로 변수명 짓기
  @override
  Status get passwordStatus;
  @override
  EmailVerificationRequestModel get verificationRequestData;
  @override
  EmailVerifyModel get verifyData;
  @override
  ExceptionModel get exception;

  /// Create a copy of FindPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FindPasswordStateImplCopyWith<_$FindPasswordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
