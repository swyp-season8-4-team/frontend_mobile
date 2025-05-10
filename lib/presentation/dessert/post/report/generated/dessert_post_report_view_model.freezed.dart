// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../dessert_post_report_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DessertPostReportState {
  Status get status => throw _privateConstructorUsedError;
  MateReportModel? get data => throw _privateConstructorUsedError;
  ExceptionModel? get exception => throw _privateConstructorUsedError;

  /// Create a copy of DessertPostReportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DessertPostReportStateCopyWith<DessertPostReportState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DessertPostReportStateCopyWith<$Res> {
  factory $DessertPostReportStateCopyWith(
    DessertPostReportState value,
    $Res Function(DessertPostReportState) then,
  ) = _$DessertPostReportStateCopyWithImpl<$Res, DessertPostReportState>;
  @useResult
  $Res call({Status status, MateReportModel? data, ExceptionModel? exception});
}

/// @nodoc
class _$DessertPostReportStateCopyWithImpl<
  $Res,
  $Val extends DessertPostReportState
>
    implements $DessertPostReportStateCopyWith<$Res> {
  _$DessertPostReportStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DessertPostReportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(
      _value.copyWith(
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as Status,
            data:
                freezed == data
                    ? _value.data
                    : data // ignore: cast_nullable_to_non_nullable
                        as MateReportModel?,
            exception:
                freezed == exception
                    ? _value.exception
                    : exception // ignore: cast_nullable_to_non_nullable
                        as ExceptionModel?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DessertPostReportStateImplCopyWith<$Res>
    implements $DessertPostReportStateCopyWith<$Res> {
  factory _$$DessertPostReportStateImplCopyWith(
    _$DessertPostReportStateImpl value,
    $Res Function(_$DessertPostReportStateImpl) then,
  ) = __$$DessertPostReportStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, MateReportModel? data, ExceptionModel? exception});
}

/// @nodoc
class __$$DessertPostReportStateImplCopyWithImpl<$Res>
    extends
        _$DessertPostReportStateCopyWithImpl<$Res, _$DessertPostReportStateImpl>
    implements _$$DessertPostReportStateImplCopyWith<$Res> {
  __$$DessertPostReportStateImplCopyWithImpl(
    _$DessertPostReportStateImpl _value,
    $Res Function(_$DessertPostReportStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DessertPostReportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(
      _$DessertPostReportStateImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as Status,
        data:
            freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                    as MateReportModel?,
        exception:
            freezed == exception
                ? _value.exception
                : exception // ignore: cast_nullable_to_non_nullable
                    as ExceptionModel?,
      ),
    );
  }
}

/// @nodoc

class _$DessertPostReportStateImpl implements _DessertPostReportState {
  const _$DessertPostReportStateImpl({
    this.status = Status.initial,
    this.data,
    this.exception,
  });

  @override
  @JsonKey()
  final Status status;
  @override
  final MateReportModel? data;
  @override
  final ExceptionModel? exception;

  @override
  String toString() {
    return 'DessertPostReportState(status: $status, data: $data, exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DessertPostReportStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, data, exception);

  /// Create a copy of DessertPostReportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DessertPostReportStateImplCopyWith<_$DessertPostReportStateImpl>
  get copyWith =>
      __$$DessertPostReportStateImplCopyWithImpl<_$DessertPostReportStateImpl>(
        this,
        _$identity,
      );
}

abstract class _DessertPostReportState implements DessertPostReportState {
  const factory _DessertPostReportState({
    final Status status,
    final MateReportModel? data,
    final ExceptionModel? exception,
  }) = _$DessertPostReportStateImpl;

  @override
  Status get status;
  @override
  MateReportModel? get data;
  @override
  ExceptionModel? get exception;

  /// Create a copy of DessertPostReportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DessertPostReportStateImplCopyWith<_$DessertPostReportStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
