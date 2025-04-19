// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../store_notice_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$StoreNoticeState {
  List<StoreNoticeModel> get storeNotices => throw _privateConstructorUsedError;
  Status get getStoreNoticesStatus => throw _privateConstructorUsedError;
  ExceptionModel get getStoreNoticesException =>
      throw _privateConstructorUsedError;

  /// Create a copy of StoreNoticeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoreNoticeStateCopyWith<StoreNoticeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreNoticeStateCopyWith<$Res> {
  factory $StoreNoticeStateCopyWith(
    StoreNoticeState value,
    $Res Function(StoreNoticeState) then,
  ) = _$StoreNoticeStateCopyWithImpl<$Res, StoreNoticeState>;
  @useResult
  $Res call({
    List<StoreNoticeModel> storeNotices,
    Status getStoreNoticesStatus,
    ExceptionModel getStoreNoticesException,
  });
}

/// @nodoc
class _$StoreNoticeStateCopyWithImpl<$Res, $Val extends StoreNoticeState>
    implements $StoreNoticeStateCopyWith<$Res> {
  _$StoreNoticeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoreNoticeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeNotices = null,
    Object? getStoreNoticesStatus = null,
    Object? getStoreNoticesException = null,
  }) {
    return _then(
      _value.copyWith(
            storeNotices:
                null == storeNotices
                    ? _value.storeNotices
                    : storeNotices // ignore: cast_nullable_to_non_nullable
                        as List<StoreNoticeModel>,
            getStoreNoticesStatus:
                null == getStoreNoticesStatus
                    ? _value.getStoreNoticesStatus
                    : getStoreNoticesStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            getStoreNoticesException:
                null == getStoreNoticesException
                    ? _value.getStoreNoticesException
                    : getStoreNoticesException // ignore: cast_nullable_to_non_nullable
                        as ExceptionModel,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StoreNoticeStateImplCopyWith<$Res>
    implements $StoreNoticeStateCopyWith<$Res> {
  factory _$$StoreNoticeStateImplCopyWith(
    _$StoreNoticeStateImpl value,
    $Res Function(_$StoreNoticeStateImpl) then,
  ) = __$$StoreNoticeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<StoreNoticeModel> storeNotices,
    Status getStoreNoticesStatus,
    ExceptionModel getStoreNoticesException,
  });
}

/// @nodoc
class __$$StoreNoticeStateImplCopyWithImpl<$Res>
    extends _$StoreNoticeStateCopyWithImpl<$Res, _$StoreNoticeStateImpl>
    implements _$$StoreNoticeStateImplCopyWith<$Res> {
  __$$StoreNoticeStateImplCopyWithImpl(
    _$StoreNoticeStateImpl _value,
    $Res Function(_$StoreNoticeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StoreNoticeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeNotices = null,
    Object? getStoreNoticesStatus = null,
    Object? getStoreNoticesException = null,
  }) {
    return _then(
      _$StoreNoticeStateImpl(
        storeNotices:
            null == storeNotices
                ? _value._storeNotices
                : storeNotices // ignore: cast_nullable_to_non_nullable
                    as List<StoreNoticeModel>,
        getStoreNoticesStatus:
            null == getStoreNoticesStatus
                ? _value.getStoreNoticesStatus
                : getStoreNoticesStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        getStoreNoticesException:
            null == getStoreNoticesException
                ? _value.getStoreNoticesException
                : getStoreNoticesException // ignore: cast_nullable_to_non_nullable
                    as ExceptionModel,
      ),
    );
  }
}

/// @nodoc

class _$StoreNoticeStateImpl implements _StoreNoticeState {
  _$StoreNoticeStateImpl({
    final List<StoreNoticeModel> storeNotices = const <StoreNoticeModel>[],
    this.getStoreNoticesStatus = Status.loading,
    this.getStoreNoticesException = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
  }) : _storeNotices = storeNotices;

  final List<StoreNoticeModel> _storeNotices;
  @override
  @JsonKey()
  List<StoreNoticeModel> get storeNotices {
    if (_storeNotices is EqualUnmodifiableListView) return _storeNotices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_storeNotices);
  }

  @override
  @JsonKey()
  final Status getStoreNoticesStatus;
  @override
  @JsonKey()
  final ExceptionModel getStoreNoticesException;

  @override
  String toString() {
    return 'StoreNoticeState(storeNotices: $storeNotices, getStoreNoticesStatus: $getStoreNoticesStatus, getStoreNoticesException: $getStoreNoticesException)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreNoticeStateImpl &&
            const DeepCollectionEquality().equals(
              other._storeNotices,
              _storeNotices,
            ) &&
            (identical(other.getStoreNoticesStatus, getStoreNoticesStatus) ||
                other.getStoreNoticesStatus == getStoreNoticesStatus) &&
            (identical(
                  other.getStoreNoticesException,
                  getStoreNoticesException,
                ) ||
                other.getStoreNoticesException == getStoreNoticesException));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_storeNotices),
    getStoreNoticesStatus,
    getStoreNoticesException,
  );

  /// Create a copy of StoreNoticeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreNoticeStateImplCopyWith<_$StoreNoticeStateImpl> get copyWith =>
      __$$StoreNoticeStateImplCopyWithImpl<_$StoreNoticeStateImpl>(
        this,
        _$identity,
      );
}

abstract class _StoreNoticeState implements StoreNoticeState {
  factory _StoreNoticeState({
    final List<StoreNoticeModel> storeNotices,
    final Status getStoreNoticesStatus,
    final ExceptionModel getStoreNoticesException,
  }) = _$StoreNoticeStateImpl;

  @override
  List<StoreNoticeModel> get storeNotices;
  @override
  Status get getStoreNoticesStatus;
  @override
  ExceptionModel get getStoreNoticesException;

  /// Create a copy of StoreNoticeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreNoticeStateImplCopyWith<_$StoreNoticeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
