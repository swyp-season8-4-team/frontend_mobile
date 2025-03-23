// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_login_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LocalLoginState {
  Status get status => throw _privateConstructorUsedError;
  LocalLoginModel get data => throw _privateConstructorUsedError;
  ExceptionModel get exception => throw _privateConstructorUsedError;

  /// Create a copy of LocalLoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocalLoginStateCopyWith<LocalLoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalLoginStateCopyWith<$Res> {
  factory $LocalLoginStateCopyWith(
    LocalLoginState value,
    $Res Function(LocalLoginState) then,
  ) = _$LocalLoginStateCopyWithImpl<$Res, LocalLoginState>;
  @useResult
  $Res call({Status status, LocalLoginModel data, ExceptionModel exception});
}

/// @nodoc
class _$LocalLoginStateCopyWithImpl<$Res, $Val extends LocalLoginState>
    implements $LocalLoginStateCopyWith<$Res> {
  _$LocalLoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocalLoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
    Object? exception = null,
  }) {
    return _then(
      _value.copyWith(
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as Status,
            data:
                null == data
                    ? _value.data
                    : data // ignore: cast_nullable_to_non_nullable
                        as LocalLoginModel,
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
    implements $LocalLoginStateCopyWith<$Res> {
  factory _$$LocalLoginStateImplCopyWith(
    _$LocalLoginStateImpl value,
    $Res Function(_$LocalLoginStateImpl) then,
  ) = __$$LocalLoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, LocalLoginModel data, ExceptionModel exception});
}

/// @nodoc
class __$$LocalLoginStateImplCopyWithImpl<$Res>
    extends _$LocalLoginStateCopyWithImpl<$Res, _$LocalLoginStateImpl>
    implements _$$LocalLoginStateImplCopyWith<$Res> {
  __$$LocalLoginStateImplCopyWithImpl(
    _$LocalLoginStateImpl _value,
    $Res Function(_$LocalLoginStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocalLoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
    Object? exception = null,
  }) {
    return _then(
      _$LocalLoginStateImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as Status,
        data:
            null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                    as LocalLoginModel,
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
    this.status = Status.initial,
    this.data = const LocalLoginModel(
      accessToken: '',
      refreshToken: '',
      tokenType: '',
      expiresIn: -1,
      userUuid: '',
      email: '',
      nickname: '',
      profileImageUrl: '',
      preferenceSet: false,
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
  final Status status;
  @override
  @JsonKey()
  final LocalLoginModel data;
  @override
  @JsonKey()
  final ExceptionModel exception;

  @override
  String toString() {
    return 'LocalLoginState(status: $status, data: $data, exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalLoginStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, data, exception);

  /// Create a copy of LocalLoginState
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

abstract class _LocalLoginState implements LocalLoginState {
  const factory _LocalLoginState({
    final Status status,
    final LocalLoginModel data,
    final ExceptionModel exception,
  }) = _$LocalLoginStateImpl;

  @override
  Status get status;
  @override
  LocalLoginModel get data;
  @override
  ExceptionModel get exception;

  /// Create a copy of LocalLoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalLoginStateImplCopyWith<_$LocalLoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
