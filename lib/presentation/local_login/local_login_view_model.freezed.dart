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
  Code get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  LocalLoginModel get data => throw _privateConstructorUsedError;

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
  $Res call({Status status, Code code, String message, LocalLoginModel data});
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
    Object? code = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(
      _value.copyWith(
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as Status,
            code:
                null == code
                    ? _value.code
                    : code // ignore: cast_nullable_to_non_nullable
                        as Code,
            message:
                null == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String,
            data:
                null == data
                    ? _value.data
                    : data // ignore: cast_nullable_to_non_nullable
                        as LocalLoginModel,
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
  $Res call({Status status, Code code, String message, LocalLoginModel data});
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
    Object? code = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(
      _$LocalLoginStateImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as Status,
        code:
            null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                    as Code,
        message:
            null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String,
        data:
            null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                    as LocalLoginModel,
      ),
    );
  }
}

/// @nodoc

class _$LocalLoginStateImpl implements _LocalLoginState {
  const _$LocalLoginStateImpl({
    this.status = Status.initial,
    this.code = Code.C003,
    this.message = '',
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
  });

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final Code code;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final LocalLoginModel data;

  @override
  String toString() {
    return 'LocalLoginState(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalLoginStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, code, message, data);

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
    final Code code,
    final String message,
    final LocalLoginModel data,
  }) = _$LocalLoginStateImpl;

  @override
  Status get status;
  @override
  Code get code;
  @override
  String get message;
  @override
  LocalLoginModel get data;

  /// Create a copy of LocalLoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalLoginStateImplCopyWith<_$LocalLoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
