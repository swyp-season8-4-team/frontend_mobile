// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../dessert_comment_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DessertCommentState {
  Status get status => throw _privateConstructorUsedError;
  MateReplyModel get data => throw _privateConstructorUsedError;
  ExceptionModel get exception => throw _privateConstructorUsedError;

  /// Create a copy of DessertCommentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DessertCommentStateCopyWith<DessertCommentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DessertCommentStateCopyWith<$Res> {
  factory $DessertCommentStateCopyWith(
    DessertCommentState value,
    $Res Function(DessertCommentState) then,
  ) = _$DessertCommentStateCopyWithImpl<$Res, DessertCommentState>;
  @useResult
  $Res call({Status status, MateReplyModel data, ExceptionModel exception});
}

/// @nodoc
class _$DessertCommentStateCopyWithImpl<$Res, $Val extends DessertCommentState>
    implements $DessertCommentStateCopyWith<$Res> {
  _$DessertCommentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DessertCommentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
    Object? exception = null,
  }) {
    return _then(
      _value.copyWith(
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as Status,
            data:
                null == data
                    ? _value.data
                    : data // ignore: cast_nullable_to_non_nullable
                        as MateReplyModel,
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
abstract class _$$DessertCommentStateImplCopyWith<$Res>
    implements $DessertCommentStateCopyWith<$Res> {
  factory _$$DessertCommentStateImplCopyWith(
    _$DessertCommentStateImpl value,
    $Res Function(_$DessertCommentStateImpl) then,
  ) = __$$DessertCommentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, MateReplyModel data, ExceptionModel exception});
}

/// @nodoc
class __$$DessertCommentStateImplCopyWithImpl<$Res>
    extends _$DessertCommentStateCopyWithImpl<$Res, _$DessertCommentStateImpl>
    implements _$$DessertCommentStateImplCopyWith<$Res> {
  __$$DessertCommentStateImplCopyWithImpl(
    _$DessertCommentStateImpl _value,
    $Res Function(_$DessertCommentStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DessertCommentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
    Object? exception = null,
  }) {
    return _then(
      _$DessertCommentStateImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as Status,
        data:
            null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                    as MateReplyModel,
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

class _$DessertCommentStateImpl implements _DessertCommentState {
  const _$DessertCommentStateImpl({
    this.status = Status.initial,
    this.data = const MateReplyModel(
      mateUuid: '',
      mateReplies: <MateReplyDetailModel>[],
      count: -1,
      last: false,
    ),
    this.exception = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
  });

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final MateReplyModel data;
  @override
  @JsonKey()
  final ExceptionModel exception;

  @override
  String toString() {
    return 'DessertCommentState(status: $status, data: $data, exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DessertCommentStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, data, exception);

  /// Create a copy of DessertCommentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DessertCommentStateImplCopyWith<_$DessertCommentStateImpl> get copyWith =>
      __$$DessertCommentStateImplCopyWithImpl<_$DessertCommentStateImpl>(
        this,
        _$identity,
      );
}

abstract class _DessertCommentState implements DessertCommentState {
  const factory _DessertCommentState({
    final Status status,
    final MateReplyModel data,
    final ExceptionModel exception,
  }) = _$DessertCommentStateImpl;

  @override
  Status get status;
  @override
  MateReplyModel get data;
  @override
  ExceptionModel get exception;

  /// Create a copy of DessertCommentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DessertCommentStateImplCopyWith<_$DessertCommentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
