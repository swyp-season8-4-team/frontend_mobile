// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../delete_my_info_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DeleteMyInfoState {
  Status get deleteMyInfoStatus => throw _privateConstructorUsedError;
  ExceptionModel get deleteMyInfoException =>
      throw _privateConstructorUsedError;

  /// Create a copy of DeleteMyInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeleteMyInfoStateCopyWith<DeleteMyInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteMyInfoStateCopyWith<$Res> {
  factory $DeleteMyInfoStateCopyWith(
    DeleteMyInfoState value,
    $Res Function(DeleteMyInfoState) then,
  ) = _$DeleteMyInfoStateCopyWithImpl<$Res, DeleteMyInfoState>;
  @useResult
  $Res call({Status deleteMyInfoStatus, ExceptionModel deleteMyInfoException});
}

/// @nodoc
class _$DeleteMyInfoStateCopyWithImpl<$Res, $Val extends DeleteMyInfoState>
    implements $DeleteMyInfoStateCopyWith<$Res> {
  _$DeleteMyInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteMyInfoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deleteMyInfoStatus = null,
    Object? deleteMyInfoException = null,
  }) {
    return _then(
      _value.copyWith(
            deleteMyInfoStatus:
                null == deleteMyInfoStatus
                    ? _value.deleteMyInfoStatus
                    : deleteMyInfoStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            deleteMyInfoException:
                null == deleteMyInfoException
                    ? _value.deleteMyInfoException
                    : deleteMyInfoException // ignore: cast_nullable_to_non_nullable
                        as ExceptionModel,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DeleteMyInfoStateImplCopyWith<$Res>
    implements $DeleteMyInfoStateCopyWith<$Res> {
  factory _$$DeleteMyInfoStateImplCopyWith(
    _$DeleteMyInfoStateImpl value,
    $Res Function(_$DeleteMyInfoStateImpl) then,
  ) = __$$DeleteMyInfoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status deleteMyInfoStatus, ExceptionModel deleteMyInfoException});
}

/// @nodoc
class __$$DeleteMyInfoStateImplCopyWithImpl<$Res>
    extends _$DeleteMyInfoStateCopyWithImpl<$Res, _$DeleteMyInfoStateImpl>
    implements _$$DeleteMyInfoStateImplCopyWith<$Res> {
  __$$DeleteMyInfoStateImplCopyWithImpl(
    _$DeleteMyInfoStateImpl _value,
    $Res Function(_$DeleteMyInfoStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeleteMyInfoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deleteMyInfoStatus = null,
    Object? deleteMyInfoException = null,
  }) {
    return _then(
      _$DeleteMyInfoStateImpl(
        deleteMyInfoStatus:
            null == deleteMyInfoStatus
                ? _value.deleteMyInfoStatus
                : deleteMyInfoStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        deleteMyInfoException:
            null == deleteMyInfoException
                ? _value.deleteMyInfoException
                : deleteMyInfoException // ignore: cast_nullable_to_non_nullable
                    as ExceptionModel,
      ),
    );
  }
}

/// @nodoc

class _$DeleteMyInfoStateImpl implements _DeleteMyInfoState {
  _$DeleteMyInfoStateImpl({
    this.deleteMyInfoStatus = Status.initial,
    this.deleteMyInfoException = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
  });

  @override
  @JsonKey()
  final Status deleteMyInfoStatus;
  @override
  @JsonKey()
  final ExceptionModel deleteMyInfoException;

  @override
  String toString() {
    return 'DeleteMyInfoState(deleteMyInfoStatus: $deleteMyInfoStatus, deleteMyInfoException: $deleteMyInfoException)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteMyInfoStateImpl &&
            (identical(other.deleteMyInfoStatus, deleteMyInfoStatus) ||
                other.deleteMyInfoStatus == deleteMyInfoStatus) &&
            (identical(other.deleteMyInfoException, deleteMyInfoException) ||
                other.deleteMyInfoException == deleteMyInfoException));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, deleteMyInfoStatus, deleteMyInfoException);

  /// Create a copy of DeleteMyInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteMyInfoStateImplCopyWith<_$DeleteMyInfoStateImpl> get copyWith =>
      __$$DeleteMyInfoStateImplCopyWithImpl<_$DeleteMyInfoStateImpl>(
        this,
        _$identity,
      );
}

abstract class _DeleteMyInfoState implements DeleteMyInfoState {
  factory _DeleteMyInfoState({
    final Status deleteMyInfoStatus,
    final ExceptionModel deleteMyInfoException,
  }) = _$DeleteMyInfoStateImpl;

  @override
  Status get deleteMyInfoStatus;
  @override
  ExceptionModel get deleteMyInfoException;

  /// Create a copy of DeleteMyInfoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteMyInfoStateImplCopyWith<_$DeleteMyInfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
