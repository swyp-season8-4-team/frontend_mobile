// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../dessert_board_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DessertBoardState {
  Status get status => throw _privateConstructorUsedError;
  MateModel get data => throw _privateConstructorUsedError;
  MateModel get backupData => throw _privateConstructorUsedError;
  ExceptionModel get exception => throw _privateConstructorUsedError;

  /// Create a copy of DessertBoardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DessertBoardStateCopyWith<DessertBoardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DessertBoardStateCopyWith<$Res> {
  factory $DessertBoardStateCopyWith(
    DessertBoardState value,
    $Res Function(DessertBoardState) then,
  ) = _$DessertBoardStateCopyWithImpl<$Res, DessertBoardState>;
  @useResult
  $Res call({
    Status status,
    MateModel data,
    MateModel backupData,
    ExceptionModel exception,
  });
}

/// @nodoc
class _$DessertBoardStateCopyWithImpl<$Res, $Val extends DessertBoardState>
    implements $DessertBoardStateCopyWith<$Res> {
  _$DessertBoardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DessertBoardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
    Object? backupData = null,
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
                        as MateModel,
            backupData:
                null == backupData
                    ? _value.backupData
                    : backupData // ignore: cast_nullable_to_non_nullable
                        as MateModel,
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
abstract class _$$DessertBoardStateImplCopyWith<$Res>
    implements $DessertBoardStateCopyWith<$Res> {
  factory _$$DessertBoardStateImplCopyWith(
    _$DessertBoardStateImpl value,
    $Res Function(_$DessertBoardStateImpl) then,
  ) = __$$DessertBoardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Status status,
    MateModel data,
    MateModel backupData,
    ExceptionModel exception,
  });
}

/// @nodoc
class __$$DessertBoardStateImplCopyWithImpl<$Res>
    extends _$DessertBoardStateCopyWithImpl<$Res, _$DessertBoardStateImpl>
    implements _$$DessertBoardStateImplCopyWith<$Res> {
  __$$DessertBoardStateImplCopyWithImpl(
    _$DessertBoardStateImpl _value,
    $Res Function(_$DessertBoardStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DessertBoardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
    Object? backupData = null,
    Object? exception = null,
  }) {
    return _then(
      _$DessertBoardStateImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as Status,
        data:
            null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                    as MateModel,
        backupData:
            null == backupData
                ? _value.backupData
                : backupData // ignore: cast_nullable_to_non_nullable
                    as MateModel,
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

class _$DessertBoardStateImpl implements _DessertBoardState {
  const _$DessertBoardStateImpl({
    this.status = Status.initial,
    this.data = const MateModel(mates: <MateDetailModel>[], last: false),
    this.backupData = const MateModel(mates: <MateDetailModel>[], last: false),
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
  final MateModel data;
  @override
  @JsonKey()
  final MateModel backupData;
  @override
  @JsonKey()
  final ExceptionModel exception;

  @override
  String toString() {
    return 'DessertBoardState(status: $status, data: $data, backupData: $backupData, exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DessertBoardStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.backupData, backupData) ||
                other.backupData == backupData) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, data, backupData, exception);

  /// Create a copy of DessertBoardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DessertBoardStateImplCopyWith<_$DessertBoardStateImpl> get copyWith =>
      __$$DessertBoardStateImplCopyWithImpl<_$DessertBoardStateImpl>(
        this,
        _$identity,
      );
}

abstract class _DessertBoardState implements DessertBoardState {
  const factory _DessertBoardState({
    final Status status,
    final MateModel data,
    final MateModel backupData,
    final ExceptionModel exception,
  }) = _$DessertBoardStateImpl;

  @override
  Status get status;
  @override
  MateModel get data;
  @override
  MateModel get backupData;
  @override
  ExceptionModel get exception;

  /// Create a copy of DessertBoardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DessertBoardStateImplCopyWith<_$DessertBoardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
