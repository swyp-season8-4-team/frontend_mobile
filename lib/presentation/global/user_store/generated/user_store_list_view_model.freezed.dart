// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../user_store_list_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UserStoreListState {
  List<({bool isOptionMenuVisible, int listId})>
  get userStoreListOptionMenuVisible => throw _privateConstructorUsedError;
  List<UserStoreListModel> get userStoreLists =>
      throw _privateConstructorUsedError;
  Status get getUserStoreListAllStatus => throw _privateConstructorUsedError;
  ExceptionModel get getUserStoreListAllException =>
      throw _privateConstructorUsedError;

  /// Create a copy of UserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStoreListStateCopyWith<UserStoreListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStoreListStateCopyWith<$Res> {
  factory $UserStoreListStateCopyWith(
    UserStoreListState value,
    $Res Function(UserStoreListState) then,
  ) = _$UserStoreListStateCopyWithImpl<$Res, UserStoreListState>;
  @useResult
  $Res call({
    List<({bool isOptionMenuVisible, int listId})>
    userStoreListOptionMenuVisible,
    List<UserStoreListModel> userStoreLists,
    Status getUserStoreListAllStatus,
    ExceptionModel getUserStoreListAllException,
  });
}

/// @nodoc
class _$UserStoreListStateCopyWithImpl<$Res, $Val extends UserStoreListState>
    implements $UserStoreListStateCopyWith<$Res> {
  _$UserStoreListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userStoreListOptionMenuVisible = null,
    Object? userStoreLists = null,
    Object? getUserStoreListAllStatus = null,
    Object? getUserStoreListAllException = null,
  }) {
    return _then(
      _value.copyWith(
            userStoreListOptionMenuVisible:
                null == userStoreListOptionMenuVisible
                    ? _value.userStoreListOptionMenuVisible
                    : userStoreListOptionMenuVisible // ignore: cast_nullable_to_non_nullable
                        as List<({bool isOptionMenuVisible, int listId})>,
            userStoreLists:
                null == userStoreLists
                    ? _value.userStoreLists
                    : userStoreLists // ignore: cast_nullable_to_non_nullable
                        as List<UserStoreListModel>,
            getUserStoreListAllStatus:
                null == getUserStoreListAllStatus
                    ? _value.getUserStoreListAllStatus
                    : getUserStoreListAllStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            getUserStoreListAllException:
                null == getUserStoreListAllException
                    ? _value.getUserStoreListAllException
                    : getUserStoreListAllException // ignore: cast_nullable_to_non_nullable
                        as ExceptionModel,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserStoreListStateImplCopyWith<$Res>
    implements $UserStoreListStateCopyWith<$Res> {
  factory _$$UserStoreListStateImplCopyWith(
    _$UserStoreListStateImpl value,
    $Res Function(_$UserStoreListStateImpl) then,
  ) = __$$UserStoreListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<({bool isOptionMenuVisible, int listId})>
    userStoreListOptionMenuVisible,
    List<UserStoreListModel> userStoreLists,
    Status getUserStoreListAllStatus,
    ExceptionModel getUserStoreListAllException,
  });
}

/// @nodoc
class __$$UserStoreListStateImplCopyWithImpl<$Res>
    extends _$UserStoreListStateCopyWithImpl<$Res, _$UserStoreListStateImpl>
    implements _$$UserStoreListStateImplCopyWith<$Res> {
  __$$UserStoreListStateImplCopyWithImpl(
    _$UserStoreListStateImpl _value,
    $Res Function(_$UserStoreListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userStoreListOptionMenuVisible = null,
    Object? userStoreLists = null,
    Object? getUserStoreListAllStatus = null,
    Object? getUserStoreListAllException = null,
  }) {
    return _then(
      _$UserStoreListStateImpl(
        userStoreListOptionMenuVisible:
            null == userStoreListOptionMenuVisible
                ? _value._userStoreListOptionMenuVisible
                : userStoreListOptionMenuVisible // ignore: cast_nullable_to_non_nullable
                    as List<({bool isOptionMenuVisible, int listId})>,
        userStoreLists:
            null == userStoreLists
                ? _value._userStoreLists
                : userStoreLists // ignore: cast_nullable_to_non_nullable
                    as List<UserStoreListModel>,
        getUserStoreListAllStatus:
            null == getUserStoreListAllStatus
                ? _value.getUserStoreListAllStatus
                : getUserStoreListAllStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        getUserStoreListAllException:
            null == getUserStoreListAllException
                ? _value.getUserStoreListAllException
                : getUserStoreListAllException // ignore: cast_nullable_to_non_nullable
                    as ExceptionModel,
      ),
    );
  }
}

/// @nodoc

class _$UserStoreListStateImpl extends _UserStoreListState {
  _$UserStoreListStateImpl({
    final List<({bool isOptionMenuVisible, int listId})>
        userStoreListOptionMenuVisible =
        const <UserStoreListOptionMenuVisible>[],
    final List<UserStoreListModel> userStoreLists =
        const <UserStoreListModel>[],
    this.getUserStoreListAllStatus = Status.initial,
    this.getUserStoreListAllException = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
  }) : _userStoreListOptionMenuVisible = userStoreListOptionMenuVisible,
       _userStoreLists = userStoreLists,
       super._();

  final List<({bool isOptionMenuVisible, int listId})>
  _userStoreListOptionMenuVisible;
  @override
  @JsonKey()
  List<({bool isOptionMenuVisible, int listId})>
  get userStoreListOptionMenuVisible {
    if (_userStoreListOptionMenuVisible is EqualUnmodifiableListView)
      return _userStoreListOptionMenuVisible;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userStoreListOptionMenuVisible);
  }

  final List<UserStoreListModel> _userStoreLists;
  @override
  @JsonKey()
  List<UserStoreListModel> get userStoreLists {
    if (_userStoreLists is EqualUnmodifiableListView) return _userStoreLists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userStoreLists);
  }

  @override
  @JsonKey()
  final Status getUserStoreListAllStatus;
  @override
  @JsonKey()
  final ExceptionModel getUserStoreListAllException;

  @override
  String toString() {
    return 'UserStoreListState(userStoreListOptionMenuVisible: $userStoreListOptionMenuVisible, userStoreLists: $userStoreLists, getUserStoreListAllStatus: $getUserStoreListAllStatus, getUserStoreListAllException: $getUserStoreListAllException)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStoreListStateImpl &&
            const DeepCollectionEquality().equals(
              other._userStoreListOptionMenuVisible,
              _userStoreListOptionMenuVisible,
            ) &&
            const DeepCollectionEquality().equals(
              other._userStoreLists,
              _userStoreLists,
            ) &&
            (identical(
                  other.getUserStoreListAllStatus,
                  getUserStoreListAllStatus,
                ) ||
                other.getUserStoreListAllStatus == getUserStoreListAllStatus) &&
            (identical(
                  other.getUserStoreListAllException,
                  getUserStoreListAllException,
                ) ||
                other.getUserStoreListAllException ==
                    getUserStoreListAllException));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_userStoreListOptionMenuVisible),
    const DeepCollectionEquality().hash(_userStoreLists),
    getUserStoreListAllStatus,
    getUserStoreListAllException,
  );

  /// Create a copy of UserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStoreListStateImplCopyWith<_$UserStoreListStateImpl> get copyWith =>
      __$$UserStoreListStateImplCopyWithImpl<_$UserStoreListStateImpl>(
        this,
        _$identity,
      );
}

abstract class _UserStoreListState extends UserStoreListState {
  factory _UserStoreListState({
    final List<({bool isOptionMenuVisible, int listId})>
    userStoreListOptionMenuVisible,
    final List<UserStoreListModel> userStoreLists,
    final Status getUserStoreListAllStatus,
    final ExceptionModel getUserStoreListAllException,
  }) = _$UserStoreListStateImpl;
  _UserStoreListState._() : super._();

  @override
  List<({bool isOptionMenuVisible, int listId})>
  get userStoreListOptionMenuVisible;
  @override
  List<UserStoreListModel> get userStoreLists;
  @override
  Status get getUserStoreListAllStatus;
  @override
  ExceptionModel get getUserStoreListAllException;

  /// Create a copy of UserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStoreListStateImplCopyWith<_$UserStoreListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
