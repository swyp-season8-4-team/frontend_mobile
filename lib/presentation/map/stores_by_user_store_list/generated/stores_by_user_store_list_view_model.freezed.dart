// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../stores_by_user_store_list_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$StoresByUserStoreListState {
  UserStoreListModel? get stores => throw _privateConstructorUsedError;
  Status get getStoresByUserStoreListStatus =>
      throw _privateConstructorUsedError;
  ExceptionModel get getStoresByUserStoreListException =>
      throw _privateConstructorUsedError;

  /// Create a copy of StoresByUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoresByUserStoreListStateCopyWith<StoresByUserStoreListState>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoresByUserStoreListStateCopyWith<$Res> {
  factory $StoresByUserStoreListStateCopyWith(
    StoresByUserStoreListState value,
    $Res Function(StoresByUserStoreListState) then,
  ) =
      _$StoresByUserStoreListStateCopyWithImpl<
        $Res,
        StoresByUserStoreListState
      >;
  @useResult
  $Res call({
    UserStoreListModel? stores,
    Status getStoresByUserStoreListStatus,
    ExceptionModel getStoresByUserStoreListException,
  });
}

/// @nodoc
class _$StoresByUserStoreListStateCopyWithImpl<
  $Res,
  $Val extends StoresByUserStoreListState
>
    implements $StoresByUserStoreListStateCopyWith<$Res> {
  _$StoresByUserStoreListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoresByUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stores = freezed,
    Object? getStoresByUserStoreListStatus = null,
    Object? getStoresByUserStoreListException = null,
  }) {
    return _then(
      _value.copyWith(
            stores:
                freezed == stores
                    ? _value.stores
                    : stores // ignore: cast_nullable_to_non_nullable
                        as UserStoreListModel?,
            getStoresByUserStoreListStatus:
                null == getStoresByUserStoreListStatus
                    ? _value.getStoresByUserStoreListStatus
                    : getStoresByUserStoreListStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            getStoresByUserStoreListException:
                null == getStoresByUserStoreListException
                    ? _value.getStoresByUserStoreListException
                    : getStoresByUserStoreListException // ignore: cast_nullable_to_non_nullable
                        as ExceptionModel,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StoresByUserStoreListStateImplCopyWith<$Res>
    implements $StoresByUserStoreListStateCopyWith<$Res> {
  factory _$$StoresByUserStoreListStateImplCopyWith(
    _$StoresByUserStoreListStateImpl value,
    $Res Function(_$StoresByUserStoreListStateImpl) then,
  ) = __$$StoresByUserStoreListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    UserStoreListModel? stores,
    Status getStoresByUserStoreListStatus,
    ExceptionModel getStoresByUserStoreListException,
  });
}

/// @nodoc
class __$$StoresByUserStoreListStateImplCopyWithImpl<$Res>
    extends
        _$StoresByUserStoreListStateCopyWithImpl<
          $Res,
          _$StoresByUserStoreListStateImpl
        >
    implements _$$StoresByUserStoreListStateImplCopyWith<$Res> {
  __$$StoresByUserStoreListStateImplCopyWithImpl(
    _$StoresByUserStoreListStateImpl _value,
    $Res Function(_$StoresByUserStoreListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StoresByUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stores = freezed,
    Object? getStoresByUserStoreListStatus = null,
    Object? getStoresByUserStoreListException = null,
  }) {
    return _then(
      _$StoresByUserStoreListStateImpl(
        stores:
            freezed == stores
                ? _value.stores
                : stores // ignore: cast_nullable_to_non_nullable
                    as UserStoreListModel?,
        getStoresByUserStoreListStatus:
            null == getStoresByUserStoreListStatus
                ? _value.getStoresByUserStoreListStatus
                : getStoresByUserStoreListStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        getStoresByUserStoreListException:
            null == getStoresByUserStoreListException
                ? _value.getStoresByUserStoreListException
                : getStoresByUserStoreListException // ignore: cast_nullable_to_non_nullable
                    as ExceptionModel,
      ),
    );
  }
}

/// @nodoc

class _$StoresByUserStoreListStateImpl extends _StoresByUserStoreListState {
  _$StoresByUserStoreListStateImpl({
    this.stores,
    this.getStoresByUserStoreListStatus = Status.loading,
    this.getStoresByUserStoreListException = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
  }) : super._();

  @override
  final UserStoreListModel? stores;
  @override
  @JsonKey()
  final Status getStoresByUserStoreListStatus;
  @override
  @JsonKey()
  final ExceptionModel getStoresByUserStoreListException;

  @override
  String toString() {
    return 'StoresByUserStoreListState(stores: $stores, getStoresByUserStoreListStatus: $getStoresByUserStoreListStatus, getStoresByUserStoreListException: $getStoresByUserStoreListException)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoresByUserStoreListStateImpl &&
            (identical(other.stores, stores) || other.stores == stores) &&
            (identical(
                  other.getStoresByUserStoreListStatus,
                  getStoresByUserStoreListStatus,
                ) ||
                other.getStoresByUserStoreListStatus ==
                    getStoresByUserStoreListStatus) &&
            (identical(
                  other.getStoresByUserStoreListException,
                  getStoresByUserStoreListException,
                ) ||
                other.getStoresByUserStoreListException ==
                    getStoresByUserStoreListException));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    stores,
    getStoresByUserStoreListStatus,
    getStoresByUserStoreListException,
  );

  /// Create a copy of StoresByUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoresByUserStoreListStateImplCopyWith<_$StoresByUserStoreListStateImpl>
  get copyWith => __$$StoresByUserStoreListStateImplCopyWithImpl<
    _$StoresByUserStoreListStateImpl
  >(this, _$identity);
}

abstract class _StoresByUserStoreListState extends StoresByUserStoreListState {
  factory _StoresByUserStoreListState({
    final UserStoreListModel? stores,
    final Status getStoresByUserStoreListStatus,
    final ExceptionModel getStoresByUserStoreListException,
  }) = _$StoresByUserStoreListStateImpl;
  _StoresByUserStoreListState._() : super._();

  @override
  UserStoreListModel? get stores;
  @override
  Status get getStoresByUserStoreListStatus;
  @override
  ExceptionModel get getStoresByUserStoreListException;

  /// Create a copy of StoresByUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoresByUserStoreListStateImplCopyWith<_$StoresByUserStoreListStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
