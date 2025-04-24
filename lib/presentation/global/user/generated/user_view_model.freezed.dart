// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../user_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UserState {
  Status get status => throw _privateConstructorUsedError;
  UserDetailModel get data => throw _privateConstructorUsedError;
  ExceptionModel get exception => throw _privateConstructorUsedError;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
  @useResult
  $Res call({Status status, UserDetailModel data, ExceptionModel exception});
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserState
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
                        as UserDetailModel,
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
    implements $UserStateCopyWith<$Res> {
  factory _$$LocalLoginStateImplCopyWith(
    _$LocalLoginStateImpl value,
    $Res Function(_$LocalLoginStateImpl) then,
  ) = __$$LocalLoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, UserDetailModel data, ExceptionModel exception});
}

/// @nodoc
class __$$LocalLoginStateImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$LocalLoginStateImpl>
    implements _$$LocalLoginStateImplCopyWith<$Res> {
  __$$LocalLoginStateImplCopyWithImpl(
    _$LocalLoginStateImpl _value,
    $Res Function(_$LocalLoginStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserState
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
                    as UserDetailModel,
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

class _$LocalLoginStateImpl extends _LocalLoginState {
  const _$LocalLoginStateImpl({
    this.status = Status.initial,
    this.data = const UserDetailModel(
      userUuid: '',
      nickname: '',
      gender: null,
      profileImageUrl: null,
      preferences: <int>[],
      mbti: null,
      email: '',
      name: null,
      phoneNumber: null,
      address: null,
      isPreferencesSet: false,
    ),
    this.exception = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
  }) : super._();

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final UserDetailModel data;
  @override
  @JsonKey()
  final ExceptionModel exception;

  @override
  String toString() {
    return 'UserState(status: $status, data: $data, exception: $exception)';
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

  /// Create a copy of UserState
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

abstract class _LocalLoginState extends UserState {
  const factory _LocalLoginState({
    final Status status,
    final UserDetailModel data,
    final ExceptionModel exception,
  }) = _$LocalLoginStateImpl;
  const _LocalLoginState._() : super._();

  @override
  Status get status;
  @override
  UserDetailModel get data;
  @override
  ExceptionModel get exception;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalLoginStateImplCopyWith<_$LocalLoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
