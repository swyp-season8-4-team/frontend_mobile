// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../update_user_store_list_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UpdateUserStoreListState {
  String? get newListName => throw _privateConstructorUsedError;
  int get newIconColorId => throw _privateConstructorUsedError;
  Status get updateUserStoreListStatus => throw _privateConstructorUsedError;
  ExceptionModel get updateUserStoreListException =>
      throw _privateConstructorUsedError;

  /// Create a copy of UpdateUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateUserStoreListStateCopyWith<UpdateUserStoreListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUserStoreListStateCopyWith<$Res> {
  factory $UpdateUserStoreListStateCopyWith(
    UpdateUserStoreListState value,
    $Res Function(UpdateUserStoreListState) then,
  ) = _$UpdateUserStoreListStateCopyWithImpl<$Res, UpdateUserStoreListState>;
  @useResult
  $Res call({
    String? newListName,
    int newIconColorId,
    Status updateUserStoreListStatus,
    ExceptionModel updateUserStoreListException,
  });
}

/// @nodoc
class _$UpdateUserStoreListStateCopyWithImpl<
  $Res,
  $Val extends UpdateUserStoreListState
>
    implements $UpdateUserStoreListStateCopyWith<$Res> {
  _$UpdateUserStoreListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newListName = freezed,
    Object? newIconColorId = null,
    Object? updateUserStoreListStatus = null,
    Object? updateUserStoreListException = null,
  }) {
    return _then(
      _value.copyWith(
            newListName:
                freezed == newListName
                    ? _value.newListName
                    : newListName // ignore: cast_nullable_to_non_nullable
                        as String?,
            newIconColorId:
                null == newIconColorId
                    ? _value.newIconColorId
                    : newIconColorId // ignore: cast_nullable_to_non_nullable
                        as int,
            updateUserStoreListStatus:
                null == updateUserStoreListStatus
                    ? _value.updateUserStoreListStatus
                    : updateUserStoreListStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            updateUserStoreListException:
                null == updateUserStoreListException
                    ? _value.updateUserStoreListException
                    : updateUserStoreListException // ignore: cast_nullable_to_non_nullable
                        as ExceptionModel,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateUserStoreListStateImplCopyWith<$Res>
    implements $UpdateUserStoreListStateCopyWith<$Res> {
  factory _$$UpdateUserStoreListStateImplCopyWith(
    _$UpdateUserStoreListStateImpl value,
    $Res Function(_$UpdateUserStoreListStateImpl) then,
  ) = __$$UpdateUserStoreListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? newListName,
    int newIconColorId,
    Status updateUserStoreListStatus,
    ExceptionModel updateUserStoreListException,
  });
}

/// @nodoc
class __$$UpdateUserStoreListStateImplCopyWithImpl<$Res>
    extends
        _$UpdateUserStoreListStateCopyWithImpl<
          $Res,
          _$UpdateUserStoreListStateImpl
        >
    implements _$$UpdateUserStoreListStateImplCopyWith<$Res> {
  __$$UpdateUserStoreListStateImplCopyWithImpl(
    _$UpdateUserStoreListStateImpl _value,
    $Res Function(_$UpdateUserStoreListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newListName = freezed,
    Object? newIconColorId = null,
    Object? updateUserStoreListStatus = null,
    Object? updateUserStoreListException = null,
  }) {
    return _then(
      _$UpdateUserStoreListStateImpl(
        newListName:
            freezed == newListName
                ? _value.newListName
                : newListName // ignore: cast_nullable_to_non_nullable
                    as String?,
        newIconColorId:
            null == newIconColorId
                ? _value.newIconColorId
                : newIconColorId // ignore: cast_nullable_to_non_nullable
                    as int,
        updateUserStoreListStatus:
            null == updateUserStoreListStatus
                ? _value.updateUserStoreListStatus
                : updateUserStoreListStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        updateUserStoreListException:
            null == updateUserStoreListException
                ? _value.updateUserStoreListException
                : updateUserStoreListException // ignore: cast_nullable_to_non_nullable
                    as ExceptionModel,
      ),
    );
  }
}

/// @nodoc

class _$UpdateUserStoreListStateImpl implements _UpdateUserStoreListState {
  _$UpdateUserStoreListStateImpl({
    this.newListName,
    this.newIconColorId = 1,
    this.updateUserStoreListStatus = Status.initial,
    this.updateUserStoreListException = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
  });

  @override
  final String? newListName;
  @override
  @JsonKey()
  final int newIconColorId;
  @override
  @JsonKey()
  final Status updateUserStoreListStatus;
  @override
  @JsonKey()
  final ExceptionModel updateUserStoreListException;

  @override
  String toString() {
    return 'UpdateUserStoreListState(newListName: $newListName, newIconColorId: $newIconColorId, updateUserStoreListStatus: $updateUserStoreListStatus, updateUserStoreListException: $updateUserStoreListException)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserStoreListStateImpl &&
            (identical(other.newListName, newListName) ||
                other.newListName == newListName) &&
            (identical(other.newIconColorId, newIconColorId) ||
                other.newIconColorId == newIconColorId) &&
            (identical(
                  other.updateUserStoreListStatus,
                  updateUserStoreListStatus,
                ) ||
                other.updateUserStoreListStatus == updateUserStoreListStatus) &&
            (identical(
                  other.updateUserStoreListException,
                  updateUserStoreListException,
                ) ||
                other.updateUserStoreListException ==
                    updateUserStoreListException));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    newListName,
    newIconColorId,
    updateUserStoreListStatus,
    updateUserStoreListException,
  );

  /// Create a copy of UpdateUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserStoreListStateImplCopyWith<_$UpdateUserStoreListStateImpl>
  get copyWith => __$$UpdateUserStoreListStateImplCopyWithImpl<
    _$UpdateUserStoreListStateImpl
  >(this, _$identity);
}

abstract class _UpdateUserStoreListState implements UpdateUserStoreListState {
  factory _UpdateUserStoreListState({
    final String? newListName,
    final int newIconColorId,
    final Status updateUserStoreListStatus,
    final ExceptionModel updateUserStoreListException,
  }) = _$UpdateUserStoreListStateImpl;

  @override
  String? get newListName;
  @override
  int get newIconColorId;
  @override
  Status get updateUserStoreListStatus;
  @override
  ExceptionModel get updateUserStoreListException;

  /// Create a copy of UpdateUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserStoreListStateImplCopyWith<_$UpdateUserStoreListStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
