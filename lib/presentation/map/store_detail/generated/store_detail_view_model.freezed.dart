// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../store_detail_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$StoreDetailState {
  StoreDetailModel? get storeDetail => throw _privateConstructorUsedError;
  Status get getStoreDetailStatus => throw _privateConstructorUsedError;
  ExceptionModel get getStoreDetailException =>
      throw _privateConstructorUsedError;

  /// Create a copy of StoreDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoreDetailStateCopyWith<StoreDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreDetailStateCopyWith<$Res> {
  factory $StoreDetailStateCopyWith(
    StoreDetailState value,
    $Res Function(StoreDetailState) then,
  ) = _$StoreDetailStateCopyWithImpl<$Res, StoreDetailState>;
  @useResult
  $Res call({
    StoreDetailModel? storeDetail,
    Status getStoreDetailStatus,
    ExceptionModel getStoreDetailException,
  });
}

/// @nodoc
class _$StoreDetailStateCopyWithImpl<$Res, $Val extends StoreDetailState>
    implements $StoreDetailStateCopyWith<$Res> {
  _$StoreDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoreDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeDetail = freezed,
    Object? getStoreDetailStatus = null,
    Object? getStoreDetailException = null,
  }) {
    return _then(
      _value.copyWith(
            storeDetail:
                freezed == storeDetail
                    ? _value.storeDetail
                    : storeDetail // ignore: cast_nullable_to_non_nullable
                        as StoreDetailModel?,
            getStoreDetailStatus:
                null == getStoreDetailStatus
                    ? _value.getStoreDetailStatus
                    : getStoreDetailStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            getStoreDetailException:
                null == getStoreDetailException
                    ? _value.getStoreDetailException
                    : getStoreDetailException // ignore: cast_nullable_to_non_nullable
                        as ExceptionModel,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StoreDetailStateImplCopyWith<$Res>
    implements $StoreDetailStateCopyWith<$Res> {
  factory _$$StoreDetailStateImplCopyWith(
    _$StoreDetailStateImpl value,
    $Res Function(_$StoreDetailStateImpl) then,
  ) = __$$StoreDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    StoreDetailModel? storeDetail,
    Status getStoreDetailStatus,
    ExceptionModel getStoreDetailException,
  });
}

/// @nodoc
class __$$StoreDetailStateImplCopyWithImpl<$Res>
    extends _$StoreDetailStateCopyWithImpl<$Res, _$StoreDetailStateImpl>
    implements _$$StoreDetailStateImplCopyWith<$Res> {
  __$$StoreDetailStateImplCopyWithImpl(
    _$StoreDetailStateImpl _value,
    $Res Function(_$StoreDetailStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StoreDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeDetail = freezed,
    Object? getStoreDetailStatus = null,
    Object? getStoreDetailException = null,
  }) {
    return _then(
      _$StoreDetailStateImpl(
        storeDetail:
            freezed == storeDetail
                ? _value.storeDetail
                : storeDetail // ignore: cast_nullable_to_non_nullable
                    as StoreDetailModel?,
        getStoreDetailStatus:
            null == getStoreDetailStatus
                ? _value.getStoreDetailStatus
                : getStoreDetailStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        getStoreDetailException:
            null == getStoreDetailException
                ? _value.getStoreDetailException
                : getStoreDetailException // ignore: cast_nullable_to_non_nullable
                    as ExceptionModel,
      ),
    );
  }
}

/// @nodoc

class _$StoreDetailStateImpl extends _StoreDetailState {
  _$StoreDetailStateImpl({
    this.storeDetail,
    this.getStoreDetailStatus = Status.loading,
    this.getStoreDetailException = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
  }) : super._();

  @override
  final StoreDetailModel? storeDetail;
  @override
  @JsonKey()
  final Status getStoreDetailStatus;
  @override
  @JsonKey()
  final ExceptionModel getStoreDetailException;

  @override
  String toString() {
    return 'StoreDetailState(storeDetail: $storeDetail, getStoreDetailStatus: $getStoreDetailStatus, getStoreDetailException: $getStoreDetailException)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreDetailStateImpl &&
            (identical(other.storeDetail, storeDetail) ||
                other.storeDetail == storeDetail) &&
            (identical(other.getStoreDetailStatus, getStoreDetailStatus) ||
                other.getStoreDetailStatus == getStoreDetailStatus) &&
            (identical(
                  other.getStoreDetailException,
                  getStoreDetailException,
                ) ||
                other.getStoreDetailException == getStoreDetailException));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    storeDetail,
    getStoreDetailStatus,
    getStoreDetailException,
  );

  /// Create a copy of StoreDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreDetailStateImplCopyWith<_$StoreDetailStateImpl> get copyWith =>
      __$$StoreDetailStateImplCopyWithImpl<_$StoreDetailStateImpl>(
        this,
        _$identity,
      );
}

abstract class _StoreDetailState extends StoreDetailState {
  factory _StoreDetailState({
    final StoreDetailModel? storeDetail,
    final Status getStoreDetailStatus,
    final ExceptionModel getStoreDetailException,
  }) = _$StoreDetailStateImpl;
  _StoreDetailState._() : super._();

  @override
  StoreDetailModel? get storeDetail;
  @override
  Status get getStoreDetailStatus;
  @override
  ExceptionModel get getStoreDetailException;

  /// Create a copy of StoreDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreDetailStateImplCopyWith<_$StoreDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
