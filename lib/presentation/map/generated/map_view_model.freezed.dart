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
  }) : _preferences = preferences;

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
  String toString() {
    return 'MapState(preferences: $preferences, getAllPreferencesStatus: $getAllPreferencesStatus, getAllPreferencesException: $getAllPreferencesException)';
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
                    getAllPreferencesException));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_preferences),
    getAllPreferencesStatus,
    getAllPreferencesException,
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
  }) = _$MapStateImpl;

  @override
  List<PreferenceModel> get preferences;
  @override
  Status get getAllPreferencesStatus;
  @override
  ExceptionModel get getAllPreferencesException;

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MapStateImplCopyWith<_$MapStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
