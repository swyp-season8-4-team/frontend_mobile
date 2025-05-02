// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../dessert_write_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DessertWriteState {
  Status get status => throw _privateConstructorUsedError;
  MateDetailModel get data => throw _privateConstructorUsedError;
  ExceptionModel get exception => throw _privateConstructorUsedError;

  /// Create a copy of DessertWriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DessertWriteStateCopyWith<DessertWriteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DessertWriteStateCopyWith<$Res> {
  factory $DessertWriteStateCopyWith(
    DessertWriteState value,
    $Res Function(DessertWriteState) then,
  ) = _$DessertWriteStateCopyWithImpl<$Res, DessertWriteState>;
  @useResult
  $Res call({Status status, MateDetailModel data, ExceptionModel exception});

  $MateDetailModelCopyWith<$Res> get data;
}

/// @nodoc
class _$DessertWriteStateCopyWithImpl<$Res, $Val extends DessertWriteState>
    implements $DessertWriteStateCopyWith<$Res> {
  _$DessertWriteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DessertWriteState
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
                        as MateDetailModel,
            exception:
                null == exception
                    ? _value.exception
                    : exception // ignore: cast_nullable_to_non_nullable
                        as ExceptionModel,
          )
          as $Val,
    );
  }

  /// Create a copy of DessertWriteState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MateDetailModelCopyWith<$Res> get data {
    return $MateDetailModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DessertWriteStateImplCopyWith<$Res>
    implements $DessertWriteStateCopyWith<$Res> {
  factory _$$DessertWriteStateImplCopyWith(
    _$DessertWriteStateImpl value,
    $Res Function(_$DessertWriteStateImpl) then,
  ) = __$$DessertWriteStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, MateDetailModel data, ExceptionModel exception});

  @override
  $MateDetailModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$DessertWriteStateImplCopyWithImpl<$Res>
    extends _$DessertWriteStateCopyWithImpl<$Res, _$DessertWriteStateImpl>
    implements _$$DessertWriteStateImplCopyWith<$Res> {
  __$$DessertWriteStateImplCopyWithImpl(
    _$DessertWriteStateImpl _value,
    $Res Function(_$DessertWriteStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DessertWriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
    Object? exception = null,
  }) {
    return _then(
      _$DessertWriteStateImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as Status,
        data:
            null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                    as MateDetailModel,
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

class _$DessertWriteStateImpl implements _DessertWriteState {
  const _$DessertWriteStateImpl({
    this.status = Status.initial,
    this.data = const MateDetailModel(
      mateUuid: '',
      storeId: -1,
      userUuid: '',
      capacity: -1,
      currentMemberCount: -1,
      nickname: '',
      title: '',
      content: '',
      recruitYn: false,
      mateImage: '',
      profileImage: '',
      place: PlaceModel(
        placeName: null,
        address: null,
        latitude: null,
        longitude: null,
      ),
      createdAt: '',
      updatedAt: '',
      saved: false,
      applyStatus: '',
      gender: '',
      mateCategory: '',
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
  final MateDetailModel data;
  @override
  @JsonKey()
  final ExceptionModel exception;

  @override
  String toString() {
    return 'DessertWriteState(status: $status, data: $data, exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DessertWriteStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, data, exception);

  /// Create a copy of DessertWriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DessertWriteStateImplCopyWith<_$DessertWriteStateImpl> get copyWith =>
      __$$DessertWriteStateImplCopyWithImpl<_$DessertWriteStateImpl>(
        this,
        _$identity,
      );
}

abstract class _DessertWriteState implements DessertWriteState {
  const factory _DessertWriteState({
    final Status status,
    final MateDetailModel data,
    final ExceptionModel exception,
  }) = _$DessertWriteStateImpl;

  @override
  Status get status;
  @override
  MateDetailModel get data;
  @override
  ExceptionModel get exception;

  /// Create a copy of DessertWriteState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DessertWriteStateImplCopyWith<_$DessertWriteStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
