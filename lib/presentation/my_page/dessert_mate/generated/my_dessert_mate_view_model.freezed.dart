// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../my_dessert_mate_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MyDessertMateState {
  Status get getMyMateStatus => throw _privateConstructorUsedError;
  MateModel get data => throw _privateConstructorUsedError;
  ExceptionModel get getMyMateException => throw _privateConstructorUsedError;

  /// Create a copy of MyDessertMateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyDessertMateStateCopyWith<MyDessertMateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyDessertMateStateCopyWith<$Res> {
  factory $MyDessertMateStateCopyWith(
    MyDessertMateState value,
    $Res Function(MyDessertMateState) then,
  ) = _$MyDessertMateStateCopyWithImpl<$Res, MyDessertMateState>;
  @useResult
  $Res call({
    Status getMyMateStatus,
    MateModel data,
    ExceptionModel getMyMateException,
  });
}

/// @nodoc
class _$MyDessertMateStateCopyWithImpl<$Res, $Val extends MyDessertMateState>
    implements $MyDessertMateStateCopyWith<$Res> {
  _$MyDessertMateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyDessertMateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getMyMateStatus = null,
    Object? data = null,
    Object? getMyMateException = null,
  }) {
    return _then(
      _value.copyWith(
            getMyMateStatus:
                null == getMyMateStatus
                    ? _value.getMyMateStatus
                    : getMyMateStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            data:
                null == data
                    ? _value.data
                    : data // ignore: cast_nullable_to_non_nullable
                        as MateModel,
            getMyMateException:
                null == getMyMateException
                    ? _value.getMyMateException
                    : getMyMateException // ignore: cast_nullable_to_non_nullable
                        as ExceptionModel,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MyDessertMateStateImplCopyWith<$Res>
    implements $MyDessertMateStateCopyWith<$Res> {
  factory _$$MyDessertMateStateImplCopyWith(
    _$MyDessertMateStateImpl value,
    $Res Function(_$MyDessertMateStateImpl) then,
  ) = __$$MyDessertMateStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Status getMyMateStatus,
    MateModel data,
    ExceptionModel getMyMateException,
  });
}

/// @nodoc
class __$$MyDessertMateStateImplCopyWithImpl<$Res>
    extends _$MyDessertMateStateCopyWithImpl<$Res, _$MyDessertMateStateImpl>
    implements _$$MyDessertMateStateImplCopyWith<$Res> {
  __$$MyDessertMateStateImplCopyWithImpl(
    _$MyDessertMateStateImpl _value,
    $Res Function(_$MyDessertMateStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MyDessertMateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getMyMateStatus = null,
    Object? data = null,
    Object? getMyMateException = null,
  }) {
    return _then(
      _$MyDessertMateStateImpl(
        getMyMateStatus:
            null == getMyMateStatus
                ? _value.getMyMateStatus
                : getMyMateStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        data:
            null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                    as MateModel,
        getMyMateException:
            null == getMyMateException
                ? _value.getMyMateException
                : getMyMateException // ignore: cast_nullable_to_non_nullable
                    as ExceptionModel,
      ),
    );
  }
}

/// @nodoc

class _$MyDessertMateStateImpl implements _MyDessertMateState {
  _$MyDessertMateStateImpl({
    this.getMyMateStatus = Status.loading,
    this.data = const MateModel(mates: <MateDetailModel>[], last: false),
    this.getMyMateException = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
  });

  @override
  @JsonKey()
  final Status getMyMateStatus;
  @override
  @JsonKey()
  final MateModel data;
  @override
  @JsonKey()
  final ExceptionModel getMyMateException;

  @override
  String toString() {
    return 'MyDessertMateState(getMyMateStatus: $getMyMateStatus, data: $data, getMyMateException: $getMyMateException)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyDessertMateStateImpl &&
            (identical(other.getMyMateStatus, getMyMateStatus) ||
                other.getMyMateStatus == getMyMateStatus) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.getMyMateException, getMyMateException) ||
                other.getMyMateException == getMyMateException));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, getMyMateStatus, data, getMyMateException);

  /// Create a copy of MyDessertMateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyDessertMateStateImplCopyWith<_$MyDessertMateStateImpl> get copyWith =>
      __$$MyDessertMateStateImplCopyWithImpl<_$MyDessertMateStateImpl>(
        this,
        _$identity,
      );
}

abstract class _MyDessertMateState implements MyDessertMateState {
  factory _MyDessertMateState({
    final Status getMyMateStatus,
    final MateModel data,
    final ExceptionModel getMyMateException,
  }) = _$MyDessertMateStateImpl;

  @override
  Status get getMyMateStatus;
  @override
  MateModel get data;
  @override
  ExceptionModel get getMyMateException;

  /// Create a copy of MyDessertMateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyDessertMateStateImplCopyWith<_$MyDessertMateStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
