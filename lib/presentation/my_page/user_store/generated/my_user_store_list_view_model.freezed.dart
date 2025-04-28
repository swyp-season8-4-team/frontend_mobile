// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../my_user_store_list_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MyUserStoreListState {
  Status get deleteUserStoreListStatus => throw _privateConstructorUsedError;
  ExceptionModel get deleteUserStoreListException =>
      throw _privateConstructorUsedError;

  /// Create a copy of MyUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyUserStoreListStateCopyWith<MyUserStoreListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyUserStoreListStateCopyWith<$Res> {
  factory $MyUserStoreListStateCopyWith(
    MyUserStoreListState value,
    $Res Function(MyUserStoreListState) then,
  ) = _$MyUserStoreListStateCopyWithImpl<$Res, MyUserStoreListState>;
  @useResult
  $Res call({
    Status deleteUserStoreListStatus,
    ExceptionModel deleteUserStoreListException,
  });
}

/// @nodoc
class _$MyUserStoreListStateCopyWithImpl<
  $Res,
  $Val extends MyUserStoreListState
>
    implements $MyUserStoreListStateCopyWith<$Res> {
  _$MyUserStoreListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deleteUserStoreListStatus = null,
    Object? deleteUserStoreListException = null,
  }) {
    return _then(
      _value.copyWith(
            deleteUserStoreListStatus:
                null == deleteUserStoreListStatus
                    ? _value.deleteUserStoreListStatus
                    : deleteUserStoreListStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            deleteUserStoreListException:
                null == deleteUserStoreListException
                    ? _value.deleteUserStoreListException
                    : deleteUserStoreListException // ignore: cast_nullable_to_non_nullable
                        as ExceptionModel,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MyUserStoreListStateImplCopyWith<$Res>
    implements $MyUserStoreListStateCopyWith<$Res> {
  factory _$$MyUserStoreListStateImplCopyWith(
    _$MyUserStoreListStateImpl value,
    $Res Function(_$MyUserStoreListStateImpl) then,
  ) = __$$MyUserStoreListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Status deleteUserStoreListStatus,
    ExceptionModel deleteUserStoreListException,
  });
}

/// @nodoc
class __$$MyUserStoreListStateImplCopyWithImpl<$Res>
    extends _$MyUserStoreListStateCopyWithImpl<$Res, _$MyUserStoreListStateImpl>
    implements _$$MyUserStoreListStateImplCopyWith<$Res> {
  __$$MyUserStoreListStateImplCopyWithImpl(
    _$MyUserStoreListStateImpl _value,
    $Res Function(_$MyUserStoreListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MyUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deleteUserStoreListStatus = null,
    Object? deleteUserStoreListException = null,
  }) {
    return _then(
      _$MyUserStoreListStateImpl(
        deleteUserStoreListStatus:
            null == deleteUserStoreListStatus
                ? _value.deleteUserStoreListStatus
                : deleteUserStoreListStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        deleteUserStoreListException:
            null == deleteUserStoreListException
                ? _value.deleteUserStoreListException
                : deleteUserStoreListException // ignore: cast_nullable_to_non_nullable
                    as ExceptionModel,
      ),
    );
  }
}

/// @nodoc

class _$MyUserStoreListStateImpl implements _MyUserStoreListState {
  _$MyUserStoreListStateImpl({
    this.deleteUserStoreListStatus = Status.initial,
    this.deleteUserStoreListException = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
  });

  @override
  @JsonKey()
  final Status deleteUserStoreListStatus;
  @override
  @JsonKey()
  final ExceptionModel deleteUserStoreListException;

  @override
  String toString() {
    return 'MyUserStoreListState(deleteUserStoreListStatus: $deleteUserStoreListStatus, deleteUserStoreListException: $deleteUserStoreListException)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyUserStoreListStateImpl &&
            (identical(
                  other.deleteUserStoreListStatus,
                  deleteUserStoreListStatus,
                ) ||
                other.deleteUserStoreListStatus == deleteUserStoreListStatus) &&
            (identical(
                  other.deleteUserStoreListException,
                  deleteUserStoreListException,
                ) ||
                other.deleteUserStoreListException ==
                    deleteUserStoreListException));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    deleteUserStoreListStatus,
    deleteUserStoreListException,
  );

  /// Create a copy of MyUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyUserStoreListStateImplCopyWith<_$MyUserStoreListStateImpl>
  get copyWith =>
      __$$MyUserStoreListStateImplCopyWithImpl<_$MyUserStoreListStateImpl>(
        this,
        _$identity,
      );
}

abstract class _MyUserStoreListState implements MyUserStoreListState {
  factory _MyUserStoreListState({
    final Status deleteUserStoreListStatus,
    final ExceptionModel deleteUserStoreListException,
  }) = _$MyUserStoreListStateImpl;

  @override
  Status get deleteUserStoreListStatus;
  @override
  ExceptionModel get deleteUserStoreListException;

  /// Create a copy of MyUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyUserStoreListStateImplCopyWith<_$MyUserStoreListStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
