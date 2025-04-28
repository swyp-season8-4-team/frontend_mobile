// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../update_store_to_user_store_list_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UpdateStoreToUserStoreListState {
  List<int> get listIds => throw _privateConstructorUsedError;
  Status get updateStoreToUserStoreListStatus =>
      throw _privateConstructorUsedError;
  ExceptionModel get updateStoreToUserStoreListException =>
      throw _privateConstructorUsedError;

  /// Create a copy of UpdateStoreToUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateStoreToUserStoreListStateCopyWith<UpdateStoreToUserStoreListState>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateStoreToUserStoreListStateCopyWith<$Res> {
  factory $UpdateStoreToUserStoreListStateCopyWith(
    UpdateStoreToUserStoreListState value,
    $Res Function(UpdateStoreToUserStoreListState) then,
  ) =
      _$UpdateStoreToUserStoreListStateCopyWithImpl<
        $Res,
        UpdateStoreToUserStoreListState
      >;
  @useResult
  $Res call({
    List<int> listIds,
    Status updateStoreToUserStoreListStatus,
    ExceptionModel updateStoreToUserStoreListException,
  });
}

/// @nodoc
class _$UpdateStoreToUserStoreListStateCopyWithImpl<
  $Res,
  $Val extends UpdateStoreToUserStoreListState
>
    implements $UpdateStoreToUserStoreListStateCopyWith<$Res> {
  _$UpdateStoreToUserStoreListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateStoreToUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listIds = null,
    Object? updateStoreToUserStoreListStatus = null,
    Object? updateStoreToUserStoreListException = null,
  }) {
    return _then(
      _value.copyWith(
            listIds:
                null == listIds
                    ? _value.listIds
                    : listIds // ignore: cast_nullable_to_non_nullable
                        as List<int>,
            updateStoreToUserStoreListStatus:
                null == updateStoreToUserStoreListStatus
                    ? _value.updateStoreToUserStoreListStatus
                    : updateStoreToUserStoreListStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            updateStoreToUserStoreListException:
                null == updateStoreToUserStoreListException
                    ? _value.updateStoreToUserStoreListException
                    : updateStoreToUserStoreListException // ignore: cast_nullable_to_non_nullable
                        as ExceptionModel,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateStoreToUserStoreListStateImplCopyWith<$Res>
    implements $UpdateStoreToUserStoreListStateCopyWith<$Res> {
  factory _$$UpdateStoreToUserStoreListStateImplCopyWith(
    _$UpdateStoreToUserStoreListStateImpl value,
    $Res Function(_$UpdateStoreToUserStoreListStateImpl) then,
  ) = __$$UpdateStoreToUserStoreListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<int> listIds,
    Status updateStoreToUserStoreListStatus,
    ExceptionModel updateStoreToUserStoreListException,
  });
}

/// @nodoc
class __$$UpdateStoreToUserStoreListStateImplCopyWithImpl<$Res>
    extends
        _$UpdateStoreToUserStoreListStateCopyWithImpl<
          $Res,
          _$UpdateStoreToUserStoreListStateImpl
        >
    implements _$$UpdateStoreToUserStoreListStateImplCopyWith<$Res> {
  __$$UpdateStoreToUserStoreListStateImplCopyWithImpl(
    _$UpdateStoreToUserStoreListStateImpl _value,
    $Res Function(_$UpdateStoreToUserStoreListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateStoreToUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listIds = null,
    Object? updateStoreToUserStoreListStatus = null,
    Object? updateStoreToUserStoreListException = null,
  }) {
    return _then(
      _$UpdateStoreToUserStoreListStateImpl(
        listIds:
            null == listIds
                ? _value._listIds
                : listIds // ignore: cast_nullable_to_non_nullable
                    as List<int>,
        updateStoreToUserStoreListStatus:
            null == updateStoreToUserStoreListStatus
                ? _value.updateStoreToUserStoreListStatus
                : updateStoreToUserStoreListStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        updateStoreToUserStoreListException:
            null == updateStoreToUserStoreListException
                ? _value.updateStoreToUserStoreListException
                : updateStoreToUserStoreListException // ignore: cast_nullable_to_non_nullable
                    as ExceptionModel,
      ),
    );
  }
}

/// @nodoc

class _$UpdateStoreToUserStoreListStateImpl
    extends _UpdateStoreToUserStoreListState {
  _$UpdateStoreToUserStoreListStateImpl({
    final List<int> listIds = const <int>[],
    this.updateStoreToUserStoreListStatus = Status.initial,
    this.updateStoreToUserStoreListException = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
  }) : _listIds = listIds,
       super._();

  final List<int> _listIds;
  @override
  @JsonKey()
  List<int> get listIds {
    if (_listIds is EqualUnmodifiableListView) return _listIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listIds);
  }

  @override
  @JsonKey()
  final Status updateStoreToUserStoreListStatus;
  @override
  @JsonKey()
  final ExceptionModel updateStoreToUserStoreListException;

  @override
  String toString() {
    return 'UpdateStoreToUserStoreListState(listIds: $listIds, updateStoreToUserStoreListStatus: $updateStoreToUserStoreListStatus, updateStoreToUserStoreListException: $updateStoreToUserStoreListException)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateStoreToUserStoreListStateImpl &&
            const DeepCollectionEquality().equals(other._listIds, _listIds) &&
            (identical(
                  other.updateStoreToUserStoreListStatus,
                  updateStoreToUserStoreListStatus,
                ) ||
                other.updateStoreToUserStoreListStatus ==
                    updateStoreToUserStoreListStatus) &&
            (identical(
                  other.updateStoreToUserStoreListException,
                  updateStoreToUserStoreListException,
                ) ||
                other.updateStoreToUserStoreListException ==
                    updateStoreToUserStoreListException));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_listIds),
    updateStoreToUserStoreListStatus,
    updateStoreToUserStoreListException,
  );

  /// Create a copy of UpdateStoreToUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateStoreToUserStoreListStateImplCopyWith<
    _$UpdateStoreToUserStoreListStateImpl
  >
  get copyWith => __$$UpdateStoreToUserStoreListStateImplCopyWithImpl<
    _$UpdateStoreToUserStoreListStateImpl
  >(this, _$identity);
}

abstract class _UpdateStoreToUserStoreListState
    extends UpdateStoreToUserStoreListState {
  factory _UpdateStoreToUserStoreListState({
    final List<int> listIds,
    final Status updateStoreToUserStoreListStatus,
    final ExceptionModel updateStoreToUserStoreListException,
  }) = _$UpdateStoreToUserStoreListStateImpl;
  _UpdateStoreToUserStoreListState._() : super._();

  @override
  List<int> get listIds;
  @override
  Status get updateStoreToUserStoreListStatus;
  @override
  ExceptionModel get updateStoreToUserStoreListException;

  /// Create a copy of UpdateStoreToUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateStoreToUserStoreListStateImplCopyWith<
    _$UpdateStoreToUserStoreListStateImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
