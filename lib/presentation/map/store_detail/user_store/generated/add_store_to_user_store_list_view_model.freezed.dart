// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../add_store_to_user_store_list_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AddStoreToUserStoreListState {
  Status get addStoreToUserStoreListStatus =>
      throw _privateConstructorUsedError;
  ExceptionModel get addStoreToUserStoreListException =>
      throw _privateConstructorUsedError;
  int? get listId => throw _privateConstructorUsedError;

  /// Create a copy of AddStoreToUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddStoreToUserStoreListStateCopyWith<AddStoreToUserStoreListState>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddStoreToUserStoreListStateCopyWith<$Res> {
  factory $AddStoreToUserStoreListStateCopyWith(
    AddStoreToUserStoreListState value,
    $Res Function(AddStoreToUserStoreListState) then,
  ) =
      _$AddStoreToUserStoreListStateCopyWithImpl<
        $Res,
        AddStoreToUserStoreListState
      >;
  @useResult
  $Res call({
    Status addStoreToUserStoreListStatus,
    ExceptionModel addStoreToUserStoreListException,
    int? listId,
  });
}

/// @nodoc
class _$AddStoreToUserStoreListStateCopyWithImpl<
  $Res,
  $Val extends AddStoreToUserStoreListState
>
    implements $AddStoreToUserStoreListStateCopyWith<$Res> {
  _$AddStoreToUserStoreListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddStoreToUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addStoreToUserStoreListStatus = null,
    Object? addStoreToUserStoreListException = null,
    Object? listId = freezed,
  }) {
    return _then(
      _value.copyWith(
            addStoreToUserStoreListStatus:
                null == addStoreToUserStoreListStatus
                    ? _value.addStoreToUserStoreListStatus
                    : addStoreToUserStoreListStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            addStoreToUserStoreListException:
                null == addStoreToUserStoreListException
                    ? _value.addStoreToUserStoreListException
                    : addStoreToUserStoreListException // ignore: cast_nullable_to_non_nullable
                        as ExceptionModel,
            listId:
                freezed == listId
                    ? _value.listId
                    : listId // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AddStoreToUserStoreListStateImplCopyWith<$Res>
    implements $AddStoreToUserStoreListStateCopyWith<$Res> {
  factory _$$AddStoreToUserStoreListStateImplCopyWith(
    _$AddStoreToUserStoreListStateImpl value,
    $Res Function(_$AddStoreToUserStoreListStateImpl) then,
  ) = __$$AddStoreToUserStoreListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Status addStoreToUserStoreListStatus,
    ExceptionModel addStoreToUserStoreListException,
    int? listId,
  });
}

/// @nodoc
class __$$AddStoreToUserStoreListStateImplCopyWithImpl<$Res>
    extends
        _$AddStoreToUserStoreListStateCopyWithImpl<
          $Res,
          _$AddStoreToUserStoreListStateImpl
        >
    implements _$$AddStoreToUserStoreListStateImplCopyWith<$Res> {
  __$$AddStoreToUserStoreListStateImplCopyWithImpl(
    _$AddStoreToUserStoreListStateImpl _value,
    $Res Function(_$AddStoreToUserStoreListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddStoreToUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addStoreToUserStoreListStatus = null,
    Object? addStoreToUserStoreListException = null,
    Object? listId = freezed,
  }) {
    return _then(
      _$AddStoreToUserStoreListStateImpl(
        addStoreToUserStoreListStatus:
            null == addStoreToUserStoreListStatus
                ? _value.addStoreToUserStoreListStatus
                : addStoreToUserStoreListStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        addStoreToUserStoreListException:
            null == addStoreToUserStoreListException
                ? _value.addStoreToUserStoreListException
                : addStoreToUserStoreListException // ignore: cast_nullable_to_non_nullable
                    as ExceptionModel,
        listId:
            freezed == listId
                ? _value.listId
                : listId // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc

class _$AddStoreToUserStoreListStateImpl
    implements _AddStoreToUserStoreListState {
  _$AddStoreToUserStoreListStateImpl({
    this.addStoreToUserStoreListStatus = Status.initial,
    this.addStoreToUserStoreListException = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
    this.listId,
  });

  @override
  @JsonKey()
  final Status addStoreToUserStoreListStatus;
  @override
  @JsonKey()
  final ExceptionModel addStoreToUserStoreListException;
  @override
  final int? listId;

  @override
  String toString() {
    return 'AddStoreToUserStoreListState(addStoreToUserStoreListStatus: $addStoreToUserStoreListStatus, addStoreToUserStoreListException: $addStoreToUserStoreListException, listId: $listId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddStoreToUserStoreListStateImpl &&
            (identical(
                  other.addStoreToUserStoreListStatus,
                  addStoreToUserStoreListStatus,
                ) ||
                other.addStoreToUserStoreListStatus ==
                    addStoreToUserStoreListStatus) &&
            (identical(
                  other.addStoreToUserStoreListException,
                  addStoreToUserStoreListException,
                ) ||
                other.addStoreToUserStoreListException ==
                    addStoreToUserStoreListException) &&
            (identical(other.listId, listId) || other.listId == listId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    addStoreToUserStoreListStatus,
    addStoreToUserStoreListException,
    listId,
  );

  /// Create a copy of AddStoreToUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddStoreToUserStoreListStateImplCopyWith<
    _$AddStoreToUserStoreListStateImpl
  >
  get copyWith => __$$AddStoreToUserStoreListStateImplCopyWithImpl<
    _$AddStoreToUserStoreListStateImpl
  >(this, _$identity);
}

abstract class _AddStoreToUserStoreListState
    implements AddStoreToUserStoreListState {
  factory _AddStoreToUserStoreListState({
    final Status addStoreToUserStoreListStatus,
    final ExceptionModel addStoreToUserStoreListException,
    final int? listId,
  }) = _$AddStoreToUserStoreListStateImpl;

  @override
  Status get addStoreToUserStoreListStatus;
  @override
  ExceptionModel get addStoreToUserStoreListException;
  @override
  int? get listId;

  /// Create a copy of AddStoreToUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddStoreToUserStoreListStateImplCopyWith<
    _$AddStoreToUserStoreListStateImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
