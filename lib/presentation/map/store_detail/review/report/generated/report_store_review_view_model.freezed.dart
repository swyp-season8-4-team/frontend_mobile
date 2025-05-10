// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../report_store_review_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ReportStoreReviewState {
  String get reportComment => throw _privateConstructorUsedError;
  int get reportCategoryId => throw _privateConstructorUsedError;
  Status get reportStoreReviewStatus => throw _privateConstructorUsedError;
  ExceptionModel get reportStoreReviewException =>
      throw _privateConstructorUsedError;

  /// Create a copy of ReportStoreReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportStoreReviewStateCopyWith<ReportStoreReviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportStoreReviewStateCopyWith<$Res> {
  factory $ReportStoreReviewStateCopyWith(
    ReportStoreReviewState value,
    $Res Function(ReportStoreReviewState) then,
  ) = _$ReportStoreReviewStateCopyWithImpl<$Res, ReportStoreReviewState>;
  @useResult
  $Res call({
    String reportComment,
    int reportCategoryId,
    Status reportStoreReviewStatus,
    ExceptionModel reportStoreReviewException,
  });
}

/// @nodoc
class _$ReportStoreReviewStateCopyWithImpl<
  $Res,
  $Val extends ReportStoreReviewState
>
    implements $ReportStoreReviewStateCopyWith<$Res> {
  _$ReportStoreReviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportStoreReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportComment = null,
    Object? reportCategoryId = null,
    Object? reportStoreReviewStatus = null,
    Object? reportStoreReviewException = null,
  }) {
    return _then(
      _value.copyWith(
            reportComment:
                null == reportComment
                    ? _value.reportComment
                    : reportComment // ignore: cast_nullable_to_non_nullable
                        as String,
            reportCategoryId:
                null == reportCategoryId
                    ? _value.reportCategoryId
                    : reportCategoryId // ignore: cast_nullable_to_non_nullable
                        as int,
            reportStoreReviewStatus:
                null == reportStoreReviewStatus
                    ? _value.reportStoreReviewStatus
                    : reportStoreReviewStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            reportStoreReviewException:
                null == reportStoreReviewException
                    ? _value.reportStoreReviewException
                    : reportStoreReviewException // ignore: cast_nullable_to_non_nullable
                        as ExceptionModel,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReportStoreReviewStateImplCopyWith<$Res>
    implements $ReportStoreReviewStateCopyWith<$Res> {
  factory _$$ReportStoreReviewStateImplCopyWith(
    _$ReportStoreReviewStateImpl value,
    $Res Function(_$ReportStoreReviewStateImpl) then,
  ) = __$$ReportStoreReviewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String reportComment,
    int reportCategoryId,
    Status reportStoreReviewStatus,
    ExceptionModel reportStoreReviewException,
  });
}

/// @nodoc
class __$$ReportStoreReviewStateImplCopyWithImpl<$Res>
    extends
        _$ReportStoreReviewStateCopyWithImpl<$Res, _$ReportStoreReviewStateImpl>
    implements _$$ReportStoreReviewStateImplCopyWith<$Res> {
  __$$ReportStoreReviewStateImplCopyWithImpl(
    _$ReportStoreReviewStateImpl _value,
    $Res Function(_$ReportStoreReviewStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReportStoreReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportComment = null,
    Object? reportCategoryId = null,
    Object? reportStoreReviewStatus = null,
    Object? reportStoreReviewException = null,
  }) {
    return _then(
      _$ReportStoreReviewStateImpl(
        reportComment:
            null == reportComment
                ? _value.reportComment
                : reportComment // ignore: cast_nullable_to_non_nullable
                    as String,
        reportCategoryId:
            null == reportCategoryId
                ? _value.reportCategoryId
                : reportCategoryId // ignore: cast_nullable_to_non_nullable
                    as int,
        reportStoreReviewStatus:
            null == reportStoreReviewStatus
                ? _value.reportStoreReviewStatus
                : reportStoreReviewStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        reportStoreReviewException:
            null == reportStoreReviewException
                ? _value.reportStoreReviewException
                : reportStoreReviewException // ignore: cast_nullable_to_non_nullable
                    as ExceptionModel,
      ),
    );
  }
}

/// @nodoc

class _$ReportStoreReviewStateImpl extends _ReportStoreReviewState {
  _$ReportStoreReviewStateImpl({
    this.reportComment = '',
    this.reportCategoryId = -1,
    this.reportStoreReviewStatus = Status.initial,
    this.reportStoreReviewException = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
  }) : super._();

  @override
  @JsonKey()
  final String reportComment;
  @override
  @JsonKey()
  final int reportCategoryId;
  @override
  @JsonKey()
  final Status reportStoreReviewStatus;
  @override
  @JsonKey()
  final ExceptionModel reportStoreReviewException;

  @override
  String toString() {
    return 'ReportStoreReviewState(reportComment: $reportComment, reportCategoryId: $reportCategoryId, reportStoreReviewStatus: $reportStoreReviewStatus, reportStoreReviewException: $reportStoreReviewException)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportStoreReviewStateImpl &&
            (identical(other.reportComment, reportComment) ||
                other.reportComment == reportComment) &&
            (identical(other.reportCategoryId, reportCategoryId) ||
                other.reportCategoryId == reportCategoryId) &&
            (identical(
                  other.reportStoreReviewStatus,
                  reportStoreReviewStatus,
                ) ||
                other.reportStoreReviewStatus == reportStoreReviewStatus) &&
            (identical(
                  other.reportStoreReviewException,
                  reportStoreReviewException,
                ) ||
                other.reportStoreReviewException ==
                    reportStoreReviewException));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    reportComment,
    reportCategoryId,
    reportStoreReviewStatus,
    reportStoreReviewException,
  );

  /// Create a copy of ReportStoreReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportStoreReviewStateImplCopyWith<_$ReportStoreReviewStateImpl>
  get copyWith =>
      __$$ReportStoreReviewStateImplCopyWithImpl<_$ReportStoreReviewStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ReportStoreReviewState extends ReportStoreReviewState {
  factory _ReportStoreReviewState({
    final String reportComment,
    final int reportCategoryId,
    final Status reportStoreReviewStatus,
    final ExceptionModel reportStoreReviewException,
  }) = _$ReportStoreReviewStateImpl;
  _ReportStoreReviewState._() : super._();

  @override
  String get reportComment;
  @override
  int get reportCategoryId;
  @override
  Status get reportStoreReviewStatus;
  @override
  ExceptionModel get reportStoreReviewException;

  /// Create a copy of ReportStoreReviewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportStoreReviewStateImplCopyWith<_$ReportStoreReviewStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
