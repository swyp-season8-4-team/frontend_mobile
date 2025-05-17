// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../blocked_user_list_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BlockedUserListState {
  BlockedUserListModel get blockedList => throw _privateConstructorUsedError;
  Status get getBlockedUsersStatus => throw _privateConstructorUsedError;
  ExceptionModel get getBlockedUsersException =>
      throw _privateConstructorUsedError;
  Status get unblockUserStatus => throw _privateConstructorUsedError;
  ExceptionModel get unblockUserException => throw _privateConstructorUsedError;

  /// Create a copy of BlockedUserListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BlockedUserListStateCopyWith<BlockedUserListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockedUserListStateCopyWith<$Res> {
  factory $BlockedUserListStateCopyWith(
    BlockedUserListState value,
    $Res Function(BlockedUserListState) then,
  ) = _$BlockedUserListStateCopyWithImpl<$Res, BlockedUserListState>;
  @useResult
  $Res call({
    BlockedUserListModel blockedList,
    Status getBlockedUsersStatus,
    ExceptionModel getBlockedUsersException,
    Status unblockUserStatus,
    ExceptionModel unblockUserException,
  });
}

/// @nodoc
class _$BlockedUserListStateCopyWithImpl<
  $Res,
  $Val extends BlockedUserListState
>
    implements $BlockedUserListStateCopyWith<$Res> {
  _$BlockedUserListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BlockedUserListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockedList = null,
    Object? getBlockedUsersStatus = null,
    Object? getBlockedUsersException = null,
    Object? unblockUserStatus = null,
    Object? unblockUserException = null,
  }) {
    return _then(
      _value.copyWith(
            blockedList:
                null == blockedList
                    ? _value.blockedList
                    : blockedList // ignore: cast_nullable_to_non_nullable
                        as BlockedUserListModel,
            getBlockedUsersStatus:
                null == getBlockedUsersStatus
                    ? _value.getBlockedUsersStatus
                    : getBlockedUsersStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            getBlockedUsersException:
                null == getBlockedUsersException
                    ? _value.getBlockedUsersException
                    : getBlockedUsersException // ignore: cast_nullable_to_non_nullable
                        as ExceptionModel,
            unblockUserStatus:
                null == unblockUserStatus
                    ? _value.unblockUserStatus
                    : unblockUserStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            unblockUserException:
                null == unblockUserException
                    ? _value.unblockUserException
                    : unblockUserException // ignore: cast_nullable_to_non_nullable
                        as ExceptionModel,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BlockedUserListStateImplCopyWith<$Res>
    implements $BlockedUserListStateCopyWith<$Res> {
  factory _$$BlockedUserListStateImplCopyWith(
    _$BlockedUserListStateImpl value,
    $Res Function(_$BlockedUserListStateImpl) then,
  ) = __$$BlockedUserListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    BlockedUserListModel blockedList,
    Status getBlockedUsersStatus,
    ExceptionModel getBlockedUsersException,
    Status unblockUserStatus,
    ExceptionModel unblockUserException,
  });
}

/// @nodoc
class __$$BlockedUserListStateImplCopyWithImpl<$Res>
    extends _$BlockedUserListStateCopyWithImpl<$Res, _$BlockedUserListStateImpl>
    implements _$$BlockedUserListStateImplCopyWith<$Res> {
  __$$BlockedUserListStateImplCopyWithImpl(
    _$BlockedUserListStateImpl _value,
    $Res Function(_$BlockedUserListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BlockedUserListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockedList = null,
    Object? getBlockedUsersStatus = null,
    Object? getBlockedUsersException = null,
    Object? unblockUserStatus = null,
    Object? unblockUserException = null,
  }) {
    return _then(
      _$BlockedUserListStateImpl(
        blockedList:
            null == blockedList
                ? _value.blockedList
                : blockedList // ignore: cast_nullable_to_non_nullable
                    as BlockedUserListModel,
        getBlockedUsersStatus:
            null == getBlockedUsersStatus
                ? _value.getBlockedUsersStatus
                : getBlockedUsersStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        getBlockedUsersException:
            null == getBlockedUsersException
                ? _value.getBlockedUsersException
                : getBlockedUsersException // ignore: cast_nullable_to_non_nullable
                    as ExceptionModel,
        unblockUserStatus:
            null == unblockUserStatus
                ? _value.unblockUserStatus
                : unblockUserStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        unblockUserException:
            null == unblockUserException
                ? _value.unblockUserException
                : unblockUserException // ignore: cast_nullable_to_non_nullable
                    as ExceptionModel,
      ),
    );
  }
}

/// @nodoc

class _$BlockedUserListStateImpl implements _BlockedUserListState {
  _$BlockedUserListStateImpl({
    this.blockedList = const BlockedUserListModel(
      blockedUsers: <BlockedUserModel>[],
      totalCount: -1,
    ),
    this.getBlockedUsersStatus = Status.loading,
    this.getBlockedUsersException = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
    this.unblockUserStatus = Status.initial,
    this.unblockUserException = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
  });

  @override
  @JsonKey()
  final BlockedUserListModel blockedList;
  @override
  @JsonKey()
  final Status getBlockedUsersStatus;
  @override
  @JsonKey()
  final ExceptionModel getBlockedUsersException;
  @override
  @JsonKey()
  final Status unblockUserStatus;
  @override
  @JsonKey()
  final ExceptionModel unblockUserException;

  @override
  String toString() {
    return 'BlockedUserListState(blockedList: $blockedList, getBlockedUsersStatus: $getBlockedUsersStatus, getBlockedUsersException: $getBlockedUsersException, unblockUserStatus: $unblockUserStatus, unblockUserException: $unblockUserException)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockedUserListStateImpl &&
            (identical(other.blockedList, blockedList) ||
                other.blockedList == blockedList) &&
            (identical(other.getBlockedUsersStatus, getBlockedUsersStatus) ||
                other.getBlockedUsersStatus == getBlockedUsersStatus) &&
            (identical(
                  other.getBlockedUsersException,
                  getBlockedUsersException,
                ) ||
                other.getBlockedUsersException == getBlockedUsersException) &&
            (identical(other.unblockUserStatus, unblockUserStatus) ||
                other.unblockUserStatus == unblockUserStatus) &&
            (identical(other.unblockUserException, unblockUserException) ||
                other.unblockUserException == unblockUserException));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    blockedList,
    getBlockedUsersStatus,
    getBlockedUsersException,
    unblockUserStatus,
    unblockUserException,
  );

  /// Create a copy of BlockedUserListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockedUserListStateImplCopyWith<_$BlockedUserListStateImpl>
  get copyWith =>
      __$$BlockedUserListStateImplCopyWithImpl<_$BlockedUserListStateImpl>(
        this,
        _$identity,
      );
}

abstract class _BlockedUserListState implements BlockedUserListState {
  factory _BlockedUserListState({
    final BlockedUserListModel blockedList,
    final Status getBlockedUsersStatus,
    final ExceptionModel getBlockedUsersException,
    final Status unblockUserStatus,
    final ExceptionModel unblockUserException,
  }) = _$BlockedUserListStateImpl;

  @override
  BlockedUserListModel get blockedList;
  @override
  Status get getBlockedUsersStatus;
  @override
  ExceptionModel get getBlockedUsersException;
  @override
  Status get unblockUserStatus;
  @override
  ExceptionModel get unblockUserException;

  /// Create a copy of BlockedUserListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlockedUserListStateImplCopyWith<_$BlockedUserListStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
