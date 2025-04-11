// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../map_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MapState {
  List<PreferenceModel> get preferences => throw _privateConstructorUsedError;
  Status get getAllPreferencesStatus => throw _privateConstructorUsedError;
  ExceptionModel get getAllPreferencesException =>
      throw _privateConstructorUsedError;
  List<StoreByLocationModel> get storesByLocation =>
      throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  double get radius => throw _privateConstructorUsedError;
  List<int> get preferenceTagIds => throw _privateConstructorUsedError;
  String get searchKeyword => throw _privateConstructorUsedError;
  Status get getStoresByLocationStatus => throw _privateConstructorUsedError;
  Status get getMyPreferencesStoresByLocationStatus =>
      throw _privateConstructorUsedError;
  ExceptionModel get getStoresByLocationExceptionModel =>
      throw _privateConstructorUsedError;
  ExceptionModel get getMyPreferencesStoresByLocationExceptionModel =>
      throw _privateConstructorUsedError;

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MapStateCopyWith<MapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapStateCopyWith<$Res> {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) then) =
      _$MapStateCopyWithImpl<$Res, MapState>;
  @useResult
  $Res call({
    List<PreferenceModel> preferences,
    Status getAllPreferencesStatus,
    ExceptionModel getAllPreferencesException,
    List<StoreByLocationModel> storesByLocation,
    double lat,
    double lng,
    double radius,
    List<int> preferenceTagIds,
    String searchKeyword,
    Status getStoresByLocationStatus,
    Status getMyPreferencesStoresByLocationStatus,
    ExceptionModel getStoresByLocationExceptionModel,
    ExceptionModel getMyPreferencesStoresByLocationExceptionModel,
  });
}

/// @nodoc
class _$MapStateCopyWithImpl<$Res, $Val extends MapState>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferences = null,
    Object? getAllPreferencesStatus = null,
    Object? getAllPreferencesException = null,
    Object? storesByLocation = null,
    Object? lat = null,
    Object? lng = null,
    Object? radius = null,
    Object? preferenceTagIds = null,
    Object? searchKeyword = null,
    Object? getStoresByLocationStatus = null,
    Object? getMyPreferencesStoresByLocationStatus = null,
    Object? getStoresByLocationExceptionModel = null,
    Object? getMyPreferencesStoresByLocationExceptionModel = null,
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
            storesByLocation:
                null == storesByLocation
                    ? _value.storesByLocation
                    : storesByLocation // ignore: cast_nullable_to_non_nullable
                        as List<StoreByLocationModel>,
            lat:
                null == lat
                    ? _value.lat
                    : lat // ignore: cast_nullable_to_non_nullable
                        as double,
            lng:
                null == lng
                    ? _value.lng
                    : lng // ignore: cast_nullable_to_non_nullable
                        as double,
            radius:
                null == radius
                    ? _value.radius
                    : radius // ignore: cast_nullable_to_non_nullable
                        as double,
            preferenceTagIds:
                null == preferenceTagIds
                    ? _value.preferenceTagIds
                    : preferenceTagIds // ignore: cast_nullable_to_non_nullable
                        as List<int>,
            searchKeyword:
                null == searchKeyword
                    ? _value.searchKeyword
                    : searchKeyword // ignore: cast_nullable_to_non_nullable
                        as String,
            getStoresByLocationStatus:
                null == getStoresByLocationStatus
                    ? _value.getStoresByLocationStatus
                    : getStoresByLocationStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            getMyPreferencesStoresByLocationStatus:
                null == getMyPreferencesStoresByLocationStatus
                    ? _value.getMyPreferencesStoresByLocationStatus
                    : getMyPreferencesStoresByLocationStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            getStoresByLocationExceptionModel:
                null == getStoresByLocationExceptionModel
                    ? _value.getStoresByLocationExceptionModel
                    : getStoresByLocationExceptionModel // ignore: cast_nullable_to_non_nullable
                        as ExceptionModel,
            getMyPreferencesStoresByLocationExceptionModel:
                null == getMyPreferencesStoresByLocationExceptionModel
                    ? _value.getMyPreferencesStoresByLocationExceptionModel
                    : getMyPreferencesStoresByLocationExceptionModel // ignore: cast_nullable_to_non_nullable
                        as ExceptionModel,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MapStateImplCopyWith<$Res>
    implements $MapStateCopyWith<$Res> {
  factory _$$MapStateImplCopyWith(
    _$MapStateImpl value,
    $Res Function(_$MapStateImpl) then,
  ) = __$$MapStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<PreferenceModel> preferences,
    Status getAllPreferencesStatus,
    ExceptionModel getAllPreferencesException,
    List<StoreByLocationModel> storesByLocation,
    double lat,
    double lng,
    double radius,
    List<int> preferenceTagIds,
    String searchKeyword,
    Status getStoresByLocationStatus,
    Status getMyPreferencesStoresByLocationStatus,
    ExceptionModel getStoresByLocationExceptionModel,
    ExceptionModel getMyPreferencesStoresByLocationExceptionModel,
  });
}

/// @nodoc
class __$$MapStateImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$MapStateImpl>
    implements _$$MapStateImplCopyWith<$Res> {
  __$$MapStateImplCopyWithImpl(
    _$MapStateImpl _value,
    $Res Function(_$MapStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferences = null,
    Object? getAllPreferencesStatus = null,
    Object? getAllPreferencesException = null,
    Object? storesByLocation = null,
    Object? lat = null,
    Object? lng = null,
    Object? radius = null,
    Object? preferenceTagIds = null,
    Object? searchKeyword = null,
    Object? getStoresByLocationStatus = null,
    Object? getMyPreferencesStoresByLocationStatus = null,
    Object? getStoresByLocationExceptionModel = null,
    Object? getMyPreferencesStoresByLocationExceptionModel = null,
  }) {
    return _then(
      _$MapStateImpl(
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
        storesByLocation:
            null == storesByLocation
                ? _value._storesByLocation
                : storesByLocation // ignore: cast_nullable_to_non_nullable
                    as List<StoreByLocationModel>,
        lat:
            null == lat
                ? _value.lat
                : lat // ignore: cast_nullable_to_non_nullable
                    as double,
        lng:
            null == lng
                ? _value.lng
                : lng // ignore: cast_nullable_to_non_nullable
                    as double,
        radius:
            null == radius
                ? _value.radius
                : radius // ignore: cast_nullable_to_non_nullable
                    as double,
        preferenceTagIds:
            null == preferenceTagIds
                ? _value._preferenceTagIds
                : preferenceTagIds // ignore: cast_nullable_to_non_nullable
                    as List<int>,
        searchKeyword:
            null == searchKeyword
                ? _value.searchKeyword
                : searchKeyword // ignore: cast_nullable_to_non_nullable
                    as String,
        getStoresByLocationStatus:
            null == getStoresByLocationStatus
                ? _value.getStoresByLocationStatus
                : getStoresByLocationStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        getMyPreferencesStoresByLocationStatus:
            null == getMyPreferencesStoresByLocationStatus
                ? _value.getMyPreferencesStoresByLocationStatus
                : getMyPreferencesStoresByLocationStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        getStoresByLocationExceptionModel:
            null == getStoresByLocationExceptionModel
                ? _value.getStoresByLocationExceptionModel
                : getStoresByLocationExceptionModel // ignore: cast_nullable_to_non_nullable
                    as ExceptionModel,
        getMyPreferencesStoresByLocationExceptionModel:
            null == getMyPreferencesStoresByLocationExceptionModel
                ? _value.getMyPreferencesStoresByLocationExceptionModel
                : getMyPreferencesStoresByLocationExceptionModel // ignore: cast_nullable_to_non_nullable
                    as ExceptionModel,
      ),
    );
  }
}

/// @nodoc

class _$MapStateImpl implements _MapState {
  _$MapStateImpl({
    final List<PreferenceModel> preferences = const <PreferenceModel>[],
    this.getAllPreferencesStatus = Status.loading,
    this.getAllPreferencesException = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
    final List<StoreByLocationModel> storesByLocation =
        const <StoreByLocationModel>[],
    this.lat = 37.514575,
    this.lng = 127.0495556,
    this.radius = 5,
    final List<int> preferenceTagIds = const <int>[],
    this.searchKeyword = '',
    this.getStoresByLocationStatus = Status.loading,
    this.getMyPreferencesStoresByLocationStatus = Status.loading,
    this.getStoresByLocationExceptionModel = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
    this.getMyPreferencesStoresByLocationExceptionModel = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
  }) : _preferences = preferences,
       _storesByLocation = storesByLocation,
       _preferenceTagIds = preferenceTagIds;

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
  final List<StoreByLocationModel> _storesByLocation;
  @override
  @JsonKey()
  List<StoreByLocationModel> get storesByLocation {
    if (_storesByLocation is EqualUnmodifiableListView)
      return _storesByLocation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_storesByLocation);
  }

  @override
  @JsonKey()
  final double lat;
  @override
  @JsonKey()
  final double lng;
  @override
  @JsonKey()
  final double radius;
  final List<int> _preferenceTagIds;
  @override
  @JsonKey()
  List<int> get preferenceTagIds {
    if (_preferenceTagIds is EqualUnmodifiableListView)
      return _preferenceTagIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferenceTagIds);
  }

  @override
  @JsonKey()
  final String searchKeyword;
  @override
  @JsonKey()
  final Status getStoresByLocationStatus;
  @override
  @JsonKey()
  final Status getMyPreferencesStoresByLocationStatus;
  @override
  @JsonKey()
  final ExceptionModel getStoresByLocationExceptionModel;
  @override
  @JsonKey()
  final ExceptionModel getMyPreferencesStoresByLocationExceptionModel;

  @override
  String toString() {
    return 'MapState(preferences: $preferences, getAllPreferencesStatus: $getAllPreferencesStatus, getAllPreferencesException: $getAllPreferencesException, storesByLocation: $storesByLocation, lat: $lat, lng: $lng, radius: $radius, preferenceTagIds: $preferenceTagIds, searchKeyword: $searchKeyword, getStoresByLocationStatus: $getStoresByLocationStatus, getMyPreferencesStoresByLocationStatus: $getMyPreferencesStoresByLocationStatus, getStoresByLocationExceptionModel: $getStoresByLocationExceptionModel, getMyPreferencesStoresByLocationExceptionModel: $getMyPreferencesStoresByLocationExceptionModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapStateImpl &&
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
            const DeepCollectionEquality().equals(
              other._storesByLocation,
              _storesByLocation,
            ) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.radius, radius) || other.radius == radius) &&
            const DeepCollectionEquality().equals(
              other._preferenceTagIds,
              _preferenceTagIds,
            ) &&
            (identical(other.searchKeyword, searchKeyword) ||
                other.searchKeyword == searchKeyword) &&
            (identical(
                  other.getStoresByLocationStatus,
                  getStoresByLocationStatus,
                ) ||
                other.getStoresByLocationStatus == getStoresByLocationStatus) &&
            (identical(
                  other.getMyPreferencesStoresByLocationStatus,
                  getMyPreferencesStoresByLocationStatus,
                ) ||
                other.getMyPreferencesStoresByLocationStatus ==
                    getMyPreferencesStoresByLocationStatus) &&
            (identical(
                  other.getStoresByLocationExceptionModel,
                  getStoresByLocationExceptionModel,
                ) ||
                other.getStoresByLocationExceptionModel ==
                    getStoresByLocationExceptionModel) &&
            (identical(
                  other.getMyPreferencesStoresByLocationExceptionModel,
                  getMyPreferencesStoresByLocationExceptionModel,
                ) ||
                other.getMyPreferencesStoresByLocationExceptionModel ==
                    getMyPreferencesStoresByLocationExceptionModel));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_preferences),
    getAllPreferencesStatus,
    getAllPreferencesException,
    const DeepCollectionEquality().hash(_storesByLocation),
    lat,
    lng,
    radius,
    const DeepCollectionEquality().hash(_preferenceTagIds),
    searchKeyword,
    getStoresByLocationStatus,
    getMyPreferencesStoresByLocationStatus,
    getStoresByLocationExceptionModel,
    getMyPreferencesStoresByLocationExceptionModel,
  );

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MapStateImplCopyWith<_$MapStateImpl> get copyWith =>
      __$$MapStateImplCopyWithImpl<_$MapStateImpl>(this, _$identity);
}

abstract class _MapState implements MapState {
  factory _MapState({
    final List<PreferenceModel> preferences,
    final Status getAllPreferencesStatus,
    final ExceptionModel getAllPreferencesException,
    final List<StoreByLocationModel> storesByLocation,
    final double lat,
    final double lng,
    final double radius,
    final List<int> preferenceTagIds,
    final String searchKeyword,
    final Status getStoresByLocationStatus,
    final Status getMyPreferencesStoresByLocationStatus,
    final ExceptionModel getStoresByLocationExceptionModel,
    final ExceptionModel getMyPreferencesStoresByLocationExceptionModel,
  }) = _$MapStateImpl;

  @override
  List<PreferenceModel> get preferences;
  @override
  Status get getAllPreferencesStatus;
  @override
  ExceptionModel get getAllPreferencesException;
  @override
  List<StoreByLocationModel> get storesByLocation;
  @override
  double get lat;
  @override
  double get lng;
  @override
  double get radius;
  @override
  List<int> get preferenceTagIds;
  @override
  String get searchKeyword;
  @override
  Status get getStoresByLocationStatus;
  @override
  Status get getMyPreferencesStoresByLocationStatus;
  @override
  ExceptionModel get getStoresByLocationExceptionModel;
  @override
  ExceptionModel get getMyPreferencesStoresByLocationExceptionModel;

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MapStateImplCopyWith<_$MapStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
