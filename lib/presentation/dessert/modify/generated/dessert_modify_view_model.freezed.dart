// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../dessert_modify_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DessertModifyState {
  Status get patchMateStatus => throw _privateConstructorUsedError;
  Status get deleteMateStatus => throw _privateConstructorUsedError;
  MatePatchModel get matePatchData => throw _privateConstructorUsedError;
  MateDeleteModel get mateDeleteData => throw _privateConstructorUsedError;
  ExceptionModel get exception => throw _privateConstructorUsedError;

  /// Create a copy of DessertModifyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DessertModifyStateCopyWith<DessertModifyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DessertModifyStateCopyWith<$Res> {
  factory $DessertModifyStateCopyWith(
    DessertModifyState value,
    $Res Function(DessertModifyState) then,
  ) = _$DessertModifyStateCopyWithImpl<$Res, DessertModifyState>;
  @useResult
  $Res call({
    Status patchMateStatus,
    Status deleteMateStatus,
    MatePatchModel matePatchData,
    MateDeleteModel mateDeleteData,
    ExceptionModel exception,
  });
}

/// @nodoc
class _$DessertModifyStateCopyWithImpl<$Res, $Val extends DessertModifyState>
    implements $DessertModifyStateCopyWith<$Res> {
  _$DessertModifyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DessertModifyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patchMateStatus = null,
    Object? deleteMateStatus = null,
    Object? matePatchData = null,
    Object? mateDeleteData = null,
    Object? exception = null,
  }) {
    return _then(
      _value.copyWith(
            patchMateStatus:
                null == patchMateStatus
                    ? _value.patchMateStatus
                    : patchMateStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            deleteMateStatus:
                null == deleteMateStatus
                    ? _value.deleteMateStatus
                    : deleteMateStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            matePatchData:
                null == matePatchData
                    ? _value.matePatchData
                    : matePatchData // ignore: cast_nullable_to_non_nullable
                        as MatePatchModel,
            mateDeleteData:
                null == mateDeleteData
                    ? _value.mateDeleteData
                    : mateDeleteData // ignore: cast_nullable_to_non_nullable
                        as MateDeleteModel,
            exception:
                null == exception
                    ? _value.exception
                    : exception // ignore: cast_nullable_to_non_nullable
                        as ExceptionModel,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DessertModifyStateImplCopyWith<$Res>
    implements $DessertModifyStateCopyWith<$Res> {
  factory _$$DessertModifyStateImplCopyWith(
    _$DessertModifyStateImpl value,
    $Res Function(_$DessertModifyStateImpl) then,
  ) = __$$DessertModifyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Status patchMateStatus,
    Status deleteMateStatus,
    MatePatchModel matePatchData,
    MateDeleteModel mateDeleteData,
    ExceptionModel exception,
  });
}

/// @nodoc
class __$$DessertModifyStateImplCopyWithImpl<$Res>
    extends _$DessertModifyStateCopyWithImpl<$Res, _$DessertModifyStateImpl>
    implements _$$DessertModifyStateImplCopyWith<$Res> {
  __$$DessertModifyStateImplCopyWithImpl(
    _$DessertModifyStateImpl _value,
    $Res Function(_$DessertModifyStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DessertModifyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patchMateStatus = null,
    Object? deleteMateStatus = null,
    Object? matePatchData = null,
    Object? mateDeleteData = null,
    Object? exception = null,
  }) {
    return _then(
      _$DessertModifyStateImpl(
        patchMateStatus:
            null == patchMateStatus
                ? _value.patchMateStatus
                : patchMateStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        deleteMateStatus:
            null == deleteMateStatus
                ? _value.deleteMateStatus
                : deleteMateStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        matePatchData:
            null == matePatchData
                ? _value.matePatchData
                : matePatchData // ignore: cast_nullable_to_non_nullable
                    as MatePatchModel,
        mateDeleteData:
            null == mateDeleteData
                ? _value.mateDeleteData
                : mateDeleteData // ignore: cast_nullable_to_non_nullable
                    as MateDeleteModel,
        exception:
            null == exception
                ? _value.exception
                : exception // ignore: cast_nullable_to_non_nullable
                    as ExceptionModel,
      ),
    );
  }
}

/// @nodoc

class _$DessertModifyStateImpl implements _DessertModifyState {
  const _$DessertModifyStateImpl({
    this.patchMateStatus = Status.initial,
    this.deleteMateStatus = Status.initial,
    this.matePatchData = const MatePatchModel(message: ''),
    this.mateDeleteData = const MateDeleteModel(message: ''),
    this.exception = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
  });

  @override
  @JsonKey()
  final Status patchMateStatus;
  @override
  @JsonKey()
  final Status deleteMateStatus;
  @override
  @JsonKey()
  final MatePatchModel matePatchData;
  @override
  @JsonKey()
  final MateDeleteModel mateDeleteData;
  @override
  @JsonKey()
  final ExceptionModel exception;

  @override
  String toString() {
    return 'DessertModifyState(patchMateStatus: $patchMateStatus, deleteMateStatus: $deleteMateStatus, matePatchData: $matePatchData, mateDeleteData: $mateDeleteData, exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DessertModifyStateImpl &&
            (identical(other.patchMateStatus, patchMateStatus) ||
                other.patchMateStatus == patchMateStatus) &&
            (identical(other.deleteMateStatus, deleteMateStatus) ||
                other.deleteMateStatus == deleteMateStatus) &&
            (identical(other.matePatchData, matePatchData) ||
                other.matePatchData == matePatchData) &&
            (identical(other.mateDeleteData, mateDeleteData) ||
                other.mateDeleteData == mateDeleteData) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    patchMateStatus,
    deleteMateStatus,
    matePatchData,
    mateDeleteData,
    exception,
  );

  /// Create a copy of DessertModifyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DessertModifyStateImplCopyWith<_$DessertModifyStateImpl> get copyWith =>
      __$$DessertModifyStateImplCopyWithImpl<_$DessertModifyStateImpl>(
        this,
        _$identity,
      );
}

abstract class _DessertModifyState implements DessertModifyState {
  const factory _DessertModifyState({
    final Status patchMateStatus,
    final Status deleteMateStatus,
    final MatePatchModel matePatchData,
    final MateDeleteModel mateDeleteData,
    final ExceptionModel exception,
  }) = _$DessertModifyStateImpl;

  @override
  Status get patchMateStatus;
  @override
  Status get deleteMateStatus;
  @override
  MatePatchModel get matePatchData;
  @override
  MateDeleteModel get mateDeleteData;
  @override
  ExceptionModel get exception;

  /// Create a copy of DessertModifyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DessertModifyStateImplCopyWith<_$DessertModifyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
