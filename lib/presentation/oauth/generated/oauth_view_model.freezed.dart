// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../oauth_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OauthState {
  Status get kakaoStatus => throw _privateConstructorUsedError;
  Status get appleStatus => throw _privateConstructorUsedError;
  KakaoModel? get kakaoData => throw _privateConstructorUsedError;
  AppleModel? get appleData => throw _privateConstructorUsedError;
  ExceptionModel get exception => throw _privateConstructorUsedError;

  /// Create a copy of OauthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OauthStateCopyWith<OauthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OauthStateCopyWith<$Res> {
  factory $OauthStateCopyWith(
    OauthState value,
    $Res Function(OauthState) then,
  ) = _$OauthStateCopyWithImpl<$Res, OauthState>;
  @useResult
  $Res call({
    Status kakaoStatus,
    Status appleStatus,
    KakaoModel? kakaoData,
    AppleModel? appleData,
    ExceptionModel exception,
  });
}

/// @nodoc
class _$OauthStateCopyWithImpl<$Res, $Val extends OauthState>
    implements $OauthStateCopyWith<$Res> {
  _$OauthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OauthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kakaoStatus = null,
    Object? appleStatus = null,
    Object? kakaoData = freezed,
    Object? appleData = freezed,
    Object? exception = null,
  }) {
    return _then(
      _value.copyWith(
            kakaoStatus:
                null == kakaoStatus
                    ? _value.kakaoStatus
                    : kakaoStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            appleStatus:
                null == appleStatus
                    ? _value.appleStatus
                    : appleStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            kakaoData:
                freezed == kakaoData
                    ? _value.kakaoData
                    : kakaoData // ignore: cast_nullable_to_non_nullable
                        as KakaoModel?,
            appleData:
                freezed == appleData
                    ? _value.appleData
                    : appleData // ignore: cast_nullable_to_non_nullable
                        as AppleModel?,
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
abstract class _$$OauthStateImplCopyWith<$Res>
    implements $OauthStateCopyWith<$Res> {
  factory _$$OauthStateImplCopyWith(
    _$OauthStateImpl value,
    $Res Function(_$OauthStateImpl) then,
  ) = __$$OauthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Status kakaoStatus,
    Status appleStatus,
    KakaoModel? kakaoData,
    AppleModel? appleData,
    ExceptionModel exception,
  });
}

/// @nodoc
class __$$OauthStateImplCopyWithImpl<$Res>
    extends _$OauthStateCopyWithImpl<$Res, _$OauthStateImpl>
    implements _$$OauthStateImplCopyWith<$Res> {
  __$$OauthStateImplCopyWithImpl(
    _$OauthStateImpl _value,
    $Res Function(_$OauthStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OauthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kakaoStatus = null,
    Object? appleStatus = null,
    Object? kakaoData = freezed,
    Object? appleData = freezed,
    Object? exception = null,
  }) {
    return _then(
      _$OauthStateImpl(
        kakaoStatus:
            null == kakaoStatus
                ? _value.kakaoStatus
                : kakaoStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        appleStatus:
            null == appleStatus
                ? _value.appleStatus
                : appleStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        kakaoData:
            freezed == kakaoData
                ? _value.kakaoData
                : kakaoData // ignore: cast_nullable_to_non_nullable
                    as KakaoModel?,
        appleData:
            freezed == appleData
                ? _value.appleData
                : appleData // ignore: cast_nullable_to_non_nullable
                    as AppleModel?,
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

class _$OauthStateImpl implements _OauthState {
  const _$OauthStateImpl({
    this.kakaoStatus = Status.initial,
    this.appleStatus = Status.initial,
    this.kakaoData,
    this.appleData,
    this.exception = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
  });

  @override
  @JsonKey()
  final Status kakaoStatus;
  @override
  @JsonKey()
  final Status appleStatus;
  @override
  final KakaoModel? kakaoData;
  @override
  final AppleModel? appleData;
  @override
  @JsonKey()
  final ExceptionModel exception;

  @override
  String toString() {
    return 'OauthState(kakaoStatus: $kakaoStatus, appleStatus: $appleStatus, kakaoData: $kakaoData, appleData: $appleData, exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OauthStateImpl &&
            (identical(other.kakaoStatus, kakaoStatus) ||
                other.kakaoStatus == kakaoStatus) &&
            (identical(other.appleStatus, appleStatus) ||
                other.appleStatus == appleStatus) &&
            (identical(other.kakaoData, kakaoData) ||
                other.kakaoData == kakaoData) &&
            (identical(other.appleData, appleData) ||
                other.appleData == appleData) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    kakaoStatus,
    appleStatus,
    kakaoData,
    appleData,
    exception,
  );

  /// Create a copy of OauthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OauthStateImplCopyWith<_$OauthStateImpl> get copyWith =>
      __$$OauthStateImplCopyWithImpl<_$OauthStateImpl>(this, _$identity);
}

abstract class _OauthState implements OauthState {
  const factory _OauthState({
    final Status kakaoStatus,
    final Status appleStatus,
    final KakaoModel? kakaoData,
    final AppleModel? appleData,
    final ExceptionModel exception,
  }) = _$OauthStateImpl;

  @override
  Status get kakaoStatus;
  @override
  Status get appleStatus;
  @override
  KakaoModel? get kakaoData;
  @override
  AppleModel? get appleData;
  @override
  ExceptionModel get exception;

  /// Create a copy of OauthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OauthStateImplCopyWith<_$OauthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
