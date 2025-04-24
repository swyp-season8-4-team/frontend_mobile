// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../my_page_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MyPageState {
  List<UserStoreListModel> get userStoreLists =>
      throw _privateConstructorUsedError;
  Status get getUserStoreListAllStatus => throw _privateConstructorUsedError;
  ExceptionModel get getUserStoreListAllException =>
      throw _privateConstructorUsedError;

  /// Create a copy of MyPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyPageStateCopyWith<MyPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPageStateCopyWith<$Res> {
  factory $MyPageStateCopyWith(
    MyPageState value,
    $Res Function(MyPageState) then,
  ) = _$MyPageStateCopyWithImpl<$Res, MyPageState>;
  @useResult
  $Res call({
    List<UserStoreListModel> userStoreLists,
    Status getUserStoreListAllStatus,
    ExceptionModel getUserStoreListAllException,
  });
}

/// @nodoc
class _$MyPageStateCopyWithImpl<$Res, $Val extends MyPageState>
    implements $MyPageStateCopyWith<$Res> {
  _$MyPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userStoreLists = null,
    Object? getUserStoreListAllStatus = null,
    Object? getUserStoreListAllException = null,
  }) {
    return _then(
      _value.copyWith(
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
abstract class _$$MyPageStateImplCopyWith<$Res>
    implements $MyPageStateCopyWith<$Res> {
  factory _$$MyPageStateImplCopyWith(
    _$MyPageStateImpl value,
    $Res Function(_$MyPageStateImpl) then,
  ) = __$$MyPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<UserStoreListModel> userStoreLists,
    Status getUserStoreListAllStatus,
    ExceptionModel getUserStoreListAllException,
  });
}

/// @nodoc
class __$$MyPageStateImplCopyWithImpl<$Res>
    extends _$MyPageStateCopyWithImpl<$Res, _$MyPageStateImpl>
    implements _$$MyPageStateImplCopyWith<$Res> {
  __$$MyPageStateImplCopyWithImpl(
    _$MyPageStateImpl _value,
    $Res Function(_$MyPageStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MyPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userStoreLists = null,
    Object? getUserStoreListAllStatus = null,
    Object? getUserStoreListAllException = null,
  }) {
    return _then(
      _$MyPageStateImpl(
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

class _$MyPageStateImpl extends _MyPageState {
  _$MyPageStateImpl({
    final List<UserStoreListModel> userStoreLists =
        const <UserStoreListModel>[],
    this.getUserStoreListAllStatus = Status.loading,
    this.getUserStoreListAllException = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
  }) : _userStoreLists = userStoreLists,
       super._();

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
    return 'MyPageState(userStoreLists: $userStoreLists, getUserStoreListAllStatus: $getUserStoreListAllStatus, getUserStoreListAllException: $getUserStoreListAllException)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyPageStateImpl &&
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
    const DeepCollectionEquality().hash(_userStoreLists),
    getUserStoreListAllStatus,
    getUserStoreListAllException,
  );

  /// Create a copy of MyPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyPageStateImplCopyWith<_$MyPageStateImpl> get copyWith =>
      __$$MyPageStateImplCopyWithImpl<_$MyPageStateImpl>(this, _$identity);
}

abstract class _MyPageState extends MyPageState {
  factory _MyPageState({
    final List<UserStoreListModel> userStoreLists,
    final Status getUserStoreListAllStatus,
    final ExceptionModel getUserStoreListAllException,
  }) = _$MyPageStateImpl;
  _MyPageState._() : super._();

  @override
  List<UserStoreListModel> get userStoreLists;
  @override
  Status get getUserStoreListAllStatus;
  @override
  ExceptionModel get getUserStoreListAllException;

  /// Create a copy of MyPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyPageStateImplCopyWith<_$MyPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
