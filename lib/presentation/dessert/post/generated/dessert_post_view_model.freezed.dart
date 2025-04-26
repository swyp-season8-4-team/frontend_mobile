// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../dessert_post_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DessertPostState {
  Status get status => throw _privateConstructorUsedError;
  MateDetailModel get data => throw _privateConstructorUsedError;
  ExceptionModel get exception => throw _privateConstructorUsedError;

  /// Create a copy of DessertPostState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DessertPostStateCopyWith<DessertPostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DessertPostStateCopyWith<$Res> {
  factory $DessertPostStateCopyWith(
    DessertPostState value,
    $Res Function(DessertPostState) then,
  ) = _$DessertPostStateCopyWithImpl<$Res, DessertPostState>;
  @useResult
  $Res call({Status status, MateDetailModel data, ExceptionModel exception});
}

/// @nodoc
class _$DessertPostStateCopyWithImpl<$Res, $Val extends DessertPostState>
    implements $DessertPostStateCopyWith<$Res> {
  _$DessertPostStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DessertPostState
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
}

/// @nodoc
abstract class _$$DessertPostStateImplCopyWith<$Res>
    implements $DessertPostStateCopyWith<$Res> {
  factory _$$DessertPostStateImplCopyWith(
    _$DessertPostStateImpl value,
    $Res Function(_$DessertPostStateImpl) then,
  ) = __$$DessertPostStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, MateDetailModel data, ExceptionModel exception});
}

/// @nodoc
class __$$DessertPostStateImplCopyWithImpl<$Res>
    extends _$DessertPostStateCopyWithImpl<$Res, _$DessertPostStateImpl>
    implements _$$DessertPostStateImplCopyWith<$Res> {
  __$$DessertPostStateImplCopyWithImpl(
    _$DessertPostStateImpl _value,
    $Res Function(_$DessertPostStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DessertPostState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
    Object? exception = null,
  }) {
    return _then(
      _$DessertPostStateImpl(
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

class _$DessertPostStateImpl implements _DessertPostState {
  const _$DessertPostStateImpl({
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
    return 'DessertPostState(status: $status, data: $data, exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DessertPostStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, data, exception);

  /// Create a copy of DessertPostState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DessertPostStateImplCopyWith<_$DessertPostStateImpl> get copyWith =>
      __$$DessertPostStateImplCopyWithImpl<_$DessertPostStateImpl>(
        this,
        _$identity,
      );
}

abstract class _DessertPostState implements DessertPostState {
  const factory _DessertPostState({
    final Status status,
    final MateDetailModel data,
    final ExceptionModel exception,
  }) = _$DessertPostStateImpl;

  @override
  Status get status;
  @override
  MateDetailModel get data;
  @override
  ExceptionModel get exception;

  /// Create a copy of DessertPostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DessertPostStateImplCopyWith<_$DessertPostStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
