// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../auth_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthState {
  Status get statusRefreshToken => throw _privateConstructorUsedError;
  RefreshTokenModel get refreshTokenData => throw _privateConstructorUsedError;
  ExceptionModel get exception => throw _privateConstructorUsedError;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call({
    Status statusRefreshToken,
    RefreshTokenModel refreshTokenData,
    ExceptionModel exception,
  });
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusRefreshToken = null,
    Object? refreshTokenData = null,
    Object? exception = null,
  }) {
    return _then(
      _value.copyWith(
            statusRefreshToken:
                null == statusRefreshToken
                    ? _value.statusRefreshToken
                    : statusRefreshToken // ignore: cast_nullable_to_non_nullable
                        as Status,
            refreshTokenData:
                null == refreshTokenData
                    ? _value.refreshTokenData
                    : refreshTokenData // ignore: cast_nullable_to_non_nullable
                        as RefreshTokenModel,
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
abstract class _$$LocalLoginStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$LocalLoginStateImplCopyWith(
    _$LocalLoginStateImpl value,
    $Res Function(_$LocalLoginStateImpl) then,
  ) = __$$LocalLoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Status statusRefreshToken,
    RefreshTokenModel refreshTokenData,
    ExceptionModel exception,
  });
}

/// @nodoc
class __$$LocalLoginStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LocalLoginStateImpl>
    implements _$$LocalLoginStateImplCopyWith<$Res> {
  __$$LocalLoginStateImplCopyWithImpl(
    _$LocalLoginStateImpl _value,
    $Res Function(_$LocalLoginStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusRefreshToken = null,
    Object? refreshTokenData = null,
    Object? exception = null,
  }) {
    return _then(
      _$LocalLoginStateImpl(
        statusRefreshToken:
            null == statusRefreshToken
                ? _value.statusRefreshToken
                : statusRefreshToken // ignore: cast_nullable_to_non_nullable
                    as Status,
        refreshTokenData:
            null == refreshTokenData
                ? _value.refreshTokenData
                : refreshTokenData // ignore: cast_nullable_to_non_nullable
                    as RefreshTokenModel,
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

class _$LocalLoginStateImpl implements _LocalLoginState {
  const _$LocalLoginStateImpl({
    this.statusRefreshToken = Status.initial,
    this.refreshTokenData = const RefreshTokenModel(
      accessToken: '',
      tokenType: '',
      expiresIn: -1,
      deviceId: null,
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
  final Status statusRefreshToken;
  @override
  @JsonKey()
  final RefreshTokenModel refreshTokenData;
  @override
  @JsonKey()
  final ExceptionModel exception;

  @override
  String toString() {
    return 'AuthState(statusRefreshToken: $statusRefreshToken, refreshTokenData: $refreshTokenData, exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalLoginStateImpl &&
            (identical(other.statusRefreshToken, statusRefreshToken) ||
                other.statusRefreshToken == statusRefreshToken) &&
            (identical(other.refreshTokenData, refreshTokenData) ||
                other.refreshTokenData == refreshTokenData) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, statusRefreshToken, refreshTokenData, exception);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalLoginStateImplCopyWith<_$LocalLoginStateImpl> get copyWith =>
      __$$LocalLoginStateImplCopyWithImpl<_$LocalLoginStateImpl>(
        this,
        _$identity,
      );
}

abstract class _LocalLoginState implements AuthState {
  const factory _LocalLoginState({
    final Status statusRefreshToken,
    final RefreshTokenModel refreshTokenData,
    final ExceptionModel exception,
  }) = _$LocalLoginStateImpl;

  @override
  Status get statusRefreshToken;
  @override
  RefreshTokenModel get refreshTokenData;
  @override
  ExceptionModel get exception;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalLoginStateImplCopyWith<_$LocalLoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
