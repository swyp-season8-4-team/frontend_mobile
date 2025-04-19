// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../add_user_store_list_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AddUserStoreListState {
  String? get listName => throw _privateConstructorUsedError;
  int get iconColorId => throw _privateConstructorUsedError;
  Status get addUserStoreListStatus => throw _privateConstructorUsedError;
  ExceptionModel get addUserStoreListException =>
      throw _privateConstructorUsedError;

  /// Create a copy of AddUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddUserStoreListStateCopyWith<AddUserStoreListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddUserStoreListStateCopyWith<$Res> {
  factory $AddUserStoreListStateCopyWith(
    AddUserStoreListState value,
    $Res Function(AddUserStoreListState) then,
  ) = _$AddUserStoreListStateCopyWithImpl<$Res, AddUserStoreListState>;
  @useResult
  $Res call({
    String? listName,
    int iconColorId,
    Status addUserStoreListStatus,
    ExceptionModel addUserStoreListException,
  });
}

/// @nodoc
class _$AddUserStoreListStateCopyWithImpl<
  $Res,
  $Val extends AddUserStoreListState
>
    implements $AddUserStoreListStateCopyWith<$Res> {
  _$AddUserStoreListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listName = freezed,
    Object? iconColorId = null,
    Object? addUserStoreListStatus = null,
    Object? addUserStoreListException = null,
  }) {
    return _then(
      _value.copyWith(
            listName:
                freezed == listName
                    ? _value.listName
                    : listName // ignore: cast_nullable_to_non_nullable
                        as String?,
            iconColorId:
                null == iconColorId
                    ? _value.iconColorId
                    : iconColorId // ignore: cast_nullable_to_non_nullable
                        as int,
            addUserStoreListStatus:
                null == addUserStoreListStatus
                    ? _value.addUserStoreListStatus
                    : addUserStoreListStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            addUserStoreListException:
                null == addUserStoreListException
                    ? _value.addUserStoreListException
                    : addUserStoreListException // ignore: cast_nullable_to_non_nullable
                        as ExceptionModel,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AddUserStoreListStateImplCopyWith<$Res>
    implements $AddUserStoreListStateCopyWith<$Res> {
  factory _$$AddUserStoreListStateImplCopyWith(
    _$AddUserStoreListStateImpl value,
    $Res Function(_$AddUserStoreListStateImpl) then,
  ) = __$$AddUserStoreListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? listName,
    int iconColorId,
    Status addUserStoreListStatus,
    ExceptionModel addUserStoreListException,
  });
}

/// @nodoc
class __$$AddUserStoreListStateImplCopyWithImpl<$Res>
    extends
        _$AddUserStoreListStateCopyWithImpl<$Res, _$AddUserStoreListStateImpl>
    implements _$$AddUserStoreListStateImplCopyWith<$Res> {
  __$$AddUserStoreListStateImplCopyWithImpl(
    _$AddUserStoreListStateImpl _value,
    $Res Function(_$AddUserStoreListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listName = freezed,
    Object? iconColorId = null,
    Object? addUserStoreListStatus = null,
    Object? addUserStoreListException = null,
  }) {
    return _then(
      _$AddUserStoreListStateImpl(
        listName:
            freezed == listName
                ? _value.listName
                : listName // ignore: cast_nullable_to_non_nullable
                    as String?,
        iconColorId:
            null == iconColorId
                ? _value.iconColorId
                : iconColorId // ignore: cast_nullable_to_non_nullable
                    as int,
        addUserStoreListStatus:
            null == addUserStoreListStatus
                ? _value.addUserStoreListStatus
                : addUserStoreListStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        addUserStoreListException:
            null == addUserStoreListException
                ? _value.addUserStoreListException
                : addUserStoreListException // ignore: cast_nullable_to_non_nullable
                    as ExceptionModel,
      ),
    );
  }
}

/// @nodoc

class _$AddUserStoreListStateImpl implements _AddUserStoreListState {
  _$AddUserStoreListStateImpl({
    this.listName,
    this.iconColorId = 1,
    this.addUserStoreListStatus = Status.initial,
    this.addUserStoreListException = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
  });

  @override
  final String? listName;
  @override
  @JsonKey()
  final int iconColorId;
  @override
  @JsonKey()
  final Status addUserStoreListStatus;
  @override
  @JsonKey()
  final ExceptionModel addUserStoreListException;

  @override
  String toString() {
    return 'AddUserStoreListState(listName: $listName, iconColorId: $iconColorId, addUserStoreListStatus: $addUserStoreListStatus, addUserStoreListException: $addUserStoreListException)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddUserStoreListStateImpl &&
            (identical(other.listName, listName) ||
                other.listName == listName) &&
            (identical(other.iconColorId, iconColorId) ||
                other.iconColorId == iconColorId) &&
            (identical(other.addUserStoreListStatus, addUserStoreListStatus) ||
                other.addUserStoreListStatus == addUserStoreListStatus) &&
            (identical(
                  other.addUserStoreListException,
                  addUserStoreListException,
                ) ||
                other.addUserStoreListException == addUserStoreListException));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    listName,
    iconColorId,
    addUserStoreListStatus,
    addUserStoreListException,
  );

  /// Create a copy of AddUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddUserStoreListStateImplCopyWith<_$AddUserStoreListStateImpl>
  get copyWith =>
      __$$AddUserStoreListStateImplCopyWithImpl<_$AddUserStoreListStateImpl>(
        this,
        _$identity,
      );
}

abstract class _AddUserStoreListState implements AddUserStoreListState {
  factory _AddUserStoreListState({
    final String? listName,
    final int iconColorId,
    final Status addUserStoreListStatus,
    final ExceptionModel addUserStoreListException,
  }) = _$AddUserStoreListStateImpl;

  @override
  String? get listName;
  @override
  int get iconColorId;
  @override
  Status get addUserStoreListStatus;
  @override
  ExceptionModel get addUserStoreListException;

  /// Create a copy of AddUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddUserStoreListStateImplCopyWith<_$AddUserStoreListStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
