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
  List<PreferenceModel> get preferences => throw _privateConstructorUsedError;
  Status get getAllPreferencesStatus => throw _privateConstructorUsedError;
  ExceptionModel get getAllPreferencesException =>
      throw _privateConstructorUsedError;
  UserStoreListDetailModel? get storeList => throw _privateConstructorUsedError;
  Status get getStoresByUserStoreListStatus =>
      throw _privateConstructorUsedError;
  ExceptionModel get getStoresByUserStoreListException =>
      throw _privateConstructorUsedError; // 가게들의 옵션 메뉴 표시 여부
  List<({bool isOptionMenuVisible, String storeUuid})>
  get storeOptionMenuVisibleList => throw _privateConstructorUsedError;
  Status get deleteStoreStatus => throw _privateConstructorUsedError;
  ExceptionModel get deleteStoreException => throw _privateConstructorUsedError;

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
    List<PreferenceModel> preferences,
    Status getAllPreferencesStatus,
    ExceptionModel getAllPreferencesException,
    UserStoreListDetailModel? storeList,
    Status getStoresByUserStoreListStatus,
    ExceptionModel getStoresByUserStoreListException,
    List<({bool isOptionMenuVisible, String storeUuid})>
    storeOptionMenuVisibleList,
    Status deleteStoreStatus,
    ExceptionModel deleteStoreException,
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
    Object? preferences = null,
    Object? getAllPreferencesStatus = null,
    Object? getAllPreferencesException = null,
    Object? storeList = freezed,
    Object? getStoresByUserStoreListStatus = null,
    Object? getStoresByUserStoreListException = null,
    Object? storeOptionMenuVisibleList = null,
    Object? deleteStoreStatus = null,
    Object? deleteStoreException = null,
  }) {
    return _then(
      _value.copyWith(
            preferences:
                null == preferences
                    ? _value.preferences
                    : preferences // ignore: cast_nullable_to_non_nullable
                        as List<PreferenceModel>,
            getAllPreferencesStatus:
                null == getAllPreferencesStatus
                    ? _value.getAllPreferencesStatus
                    : getAllPreferencesStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            getAllPreferencesException:
                null == getAllPreferencesException
                    ? _value.getAllPreferencesException
                    : getAllPreferencesException // ignore: cast_nullable_to_non_nullable
                        as ExceptionModel,
            storeList:
                freezed == storeList
                    ? _value.storeList
                    : storeList // ignore: cast_nullable_to_non_nullable
                        as UserStoreListDetailModel?,
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
            storeOptionMenuVisibleList:
                null == storeOptionMenuVisibleList
                    ? _value.storeOptionMenuVisibleList
                    : storeOptionMenuVisibleList // ignore: cast_nullable_to_non_nullable
                        as List<({bool isOptionMenuVisible, String storeUuid})>,
            deleteStoreStatus:
                null == deleteStoreStatus
                    ? _value.deleteStoreStatus
                    : deleteStoreStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            deleteStoreException:
                null == deleteStoreException
                    ? _value.deleteStoreException
                    : deleteStoreException // ignore: cast_nullable_to_non_nullable
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
    List<PreferenceModel> preferences,
    Status getAllPreferencesStatus,
    ExceptionModel getAllPreferencesException,
    UserStoreListDetailModel? storeList,
    Status getStoresByUserStoreListStatus,
    ExceptionModel getStoresByUserStoreListException,
    List<({bool isOptionMenuVisible, String storeUuid})>
    storeOptionMenuVisibleList,
    Status deleteStoreStatus,
    ExceptionModel deleteStoreException,
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
    Object? preferences = null,
    Object? getAllPreferencesStatus = null,
    Object? getAllPreferencesException = null,
    Object? storeList = freezed,
    Object? getStoresByUserStoreListStatus = null,
    Object? getStoresByUserStoreListException = null,
    Object? storeOptionMenuVisibleList = null,
    Object? deleteStoreStatus = null,
    Object? deleteStoreException = null,
  }) {
    return _then(
      _$StoresByUserStoreListStateImpl(
        preferences:
            null == preferences
                ? _value._preferences
                : preferences // ignore: cast_nullable_to_non_nullable
                    as List<PreferenceModel>,
        getAllPreferencesStatus:
            null == getAllPreferencesStatus
                ? _value.getAllPreferencesStatus
                : getAllPreferencesStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        getAllPreferencesException:
            null == getAllPreferencesException
                ? _value.getAllPreferencesException
                : getAllPreferencesException // ignore: cast_nullable_to_non_nullable
                    as ExceptionModel,
        storeList:
            freezed == storeList
                ? _value.storeList
                : storeList // ignore: cast_nullable_to_non_nullable
                    as UserStoreListDetailModel?,
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
        storeOptionMenuVisibleList:
            null == storeOptionMenuVisibleList
                ? _value._storeOptionMenuVisibleList
                : storeOptionMenuVisibleList // ignore: cast_nullable_to_non_nullable
                    as List<({bool isOptionMenuVisible, String storeUuid})>,
        deleteStoreStatus:
            null == deleteStoreStatus
                ? _value.deleteStoreStatus
                : deleteStoreStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        deleteStoreException:
            null == deleteStoreException
                ? _value.deleteStoreException
                : deleteStoreException // ignore: cast_nullable_to_non_nullable
                    as ExceptionModel,
      ),
    );
  }
}

/// @nodoc

class _$StoresByUserStoreListStateImpl extends _StoresByUserStoreListState {
  _$StoresByUserStoreListStateImpl({
    final List<PreferenceModel> preferences = const <PreferenceModel>[],
    this.getAllPreferencesStatus = Status.loading,
    this.getAllPreferencesException = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
    this.storeList,
    this.getStoresByUserStoreListStatus = Status.loading,
    this.getStoresByUserStoreListException = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
    final List<({bool isOptionMenuVisible, String storeUuid})>
        storeOptionMenuVisibleList =
        const <StoreOptionMenuVisible>[],
    this.deleteStoreStatus = Status.initial,
    this.deleteStoreException = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
  }) : _preferences = preferences,
       _storeOptionMenuVisibleList = storeOptionMenuVisibleList,
       super._();

  final List<PreferenceModel> _preferences;
  @override
  @JsonKey()
  List<PreferenceModel> get preferences {
    if (_preferences is EqualUnmodifiableListView) return _preferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferences);
  }

  @override
  @JsonKey()
  final Status getAllPreferencesStatus;
  @override
  @JsonKey()
  final ExceptionModel getAllPreferencesException;
  @override
  final UserStoreListDetailModel? storeList;
  @override
  @JsonKey()
  final Status getStoresByUserStoreListStatus;
  @override
  @JsonKey()
  final ExceptionModel getStoresByUserStoreListException;
  // 가게들의 옵션 메뉴 표시 여부
  final List<({bool isOptionMenuVisible, String storeUuid})>
  _storeOptionMenuVisibleList;
  // 가게들의 옵션 메뉴 표시 여부
  @override
  @JsonKey()
  List<({bool isOptionMenuVisible, String storeUuid})>
  get storeOptionMenuVisibleList {
    if (_storeOptionMenuVisibleList is EqualUnmodifiableListView)
      return _storeOptionMenuVisibleList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_storeOptionMenuVisibleList);
  }

  @override
  @JsonKey()
  final Status deleteStoreStatus;
  @override
  @JsonKey()
  final ExceptionModel deleteStoreException;

  @override
  String toString() {
    return 'StoresByUserStoreListState(preferences: $preferences, getAllPreferencesStatus: $getAllPreferencesStatus, getAllPreferencesException: $getAllPreferencesException, storeList: $storeList, getStoresByUserStoreListStatus: $getStoresByUserStoreListStatus, getStoresByUserStoreListException: $getStoresByUserStoreListException, storeOptionMenuVisibleList: $storeOptionMenuVisibleList, deleteStoreStatus: $deleteStoreStatus, deleteStoreException: $deleteStoreException)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoresByUserStoreListStateImpl &&
            const DeepCollectionEquality().equals(
              other._preferences,
              _preferences,
            ) &&
            (identical(
                  other.getAllPreferencesStatus,
                  getAllPreferencesStatus,
                ) ||
                other.getAllPreferencesStatus == getAllPreferencesStatus) &&
            (identical(
                  other.getAllPreferencesException,
                  getAllPreferencesException,
                ) ||
                other.getAllPreferencesException ==
                    getAllPreferencesException) &&
            (identical(other.storeList, storeList) ||
                other.storeList == storeList) &&
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
                    getStoresByUserStoreListException) &&
            const DeepCollectionEquality().equals(
              other._storeOptionMenuVisibleList,
              _storeOptionMenuVisibleList,
            ) &&
            (identical(other.deleteStoreStatus, deleteStoreStatus) ||
                other.deleteStoreStatus == deleteStoreStatus) &&
            (identical(other.deleteStoreException, deleteStoreException) ||
                other.deleteStoreException == deleteStoreException));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_preferences),
    getAllPreferencesStatus,
    getAllPreferencesException,
    storeList,
    getStoresByUserStoreListStatus,
    getStoresByUserStoreListException,
    const DeepCollectionEquality().hash(_storeOptionMenuVisibleList),
    deleteStoreStatus,
    deleteStoreException,
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
    final List<PreferenceModel> preferences,
    final Status getAllPreferencesStatus,
    final ExceptionModel getAllPreferencesException,
    final UserStoreListDetailModel? storeList,
    final Status getStoresByUserStoreListStatus,
    final ExceptionModel getStoresByUserStoreListException,
    final List<({bool isOptionMenuVisible, String storeUuid})>
    storeOptionMenuVisibleList,
    final Status deleteStoreStatus,
    final ExceptionModel deleteStoreException,
  }) = _$StoresByUserStoreListStateImpl;
  _StoresByUserStoreListState._() : super._();

  @override
  List<PreferenceModel> get preferences;
  @override
  Status get getAllPreferencesStatus;
  @override
  ExceptionModel get getAllPreferencesException;
  @override
  UserStoreListDetailModel? get storeList;
  @override
  Status get getStoresByUserStoreListStatus;
  @override
  ExceptionModel get getStoresByUserStoreListException; // 가게들의 옵션 메뉴 표시 여부
  @override
  List<({bool isOptionMenuVisible, String storeUuid})>
  get storeOptionMenuVisibleList;
  @override
  Status get deleteStoreStatus;
  @override
  ExceptionModel get deleteStoreException;

  /// Create a copy of StoresByUserStoreListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoresByUserStoreListStateImplCopyWith<_$StoresByUserStoreListStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
