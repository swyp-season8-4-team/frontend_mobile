// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../update_short_review_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UpdateShortReviewState {
  int get rating => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  File? get image => throw _privateConstructorUsedError;
  Status get updateShortReviewStatus => throw _privateConstructorUsedError;
  ExceptionModel get updateShortReviewException =>
      throw _privateConstructorUsedError;

  /// Create a copy of UpdateShortReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateShortReviewStateCopyWith<UpdateShortReviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateShortReviewStateCopyWith<$Res> {
  factory $UpdateShortReviewStateCopyWith(
    UpdateShortReviewState value,
    $Res Function(UpdateShortReviewState) then,
  ) = _$UpdateShortReviewStateCopyWithImpl<$Res, UpdateShortReviewState>;
  @useResult
  $Res call({
    int rating,
    String content,
    File? image,
    Status updateShortReviewStatus,
    ExceptionModel updateShortReviewException,
  });
}

/// @nodoc
class _$UpdateShortReviewStateCopyWithImpl<
  $Res,
  $Val extends UpdateShortReviewState
>
    implements $UpdateShortReviewStateCopyWith<$Res> {
  _$UpdateShortReviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateShortReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = null,
    Object? content = null,
    Object? image = freezed,
    Object? updateShortReviewStatus = null,
    Object? updateShortReviewException = null,
  }) {
    return _then(
      _value.copyWith(
            rating:
                null == rating
                    ? _value.rating
                    : rating // ignore: cast_nullable_to_non_nullable
                        as int,
            content:
                null == content
                    ? _value.content
                    : content // ignore: cast_nullable_to_non_nullable
                        as String,
            image:
                freezed == image
                    ? _value.image
                    : image // ignore: cast_nullable_to_non_nullable
                        as File?,
            updateShortReviewStatus:
                null == updateShortReviewStatus
                    ? _value.updateShortReviewStatus
                    : updateShortReviewStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            updateShortReviewException:
                null == updateShortReviewException
                    ? _value.updateShortReviewException
                    : updateShortReviewException // ignore: cast_nullable_to_non_nullable
                        as ExceptionModel,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateShortReviewStateImplCopyWith<$Res>
    implements $UpdateShortReviewStateCopyWith<$Res> {
  factory _$$UpdateShortReviewStateImplCopyWith(
    _$UpdateShortReviewStateImpl value,
    $Res Function(_$UpdateShortReviewStateImpl) then,
  ) = __$$UpdateShortReviewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int rating,
    String content,
    File? image,
    Status updateShortReviewStatus,
    ExceptionModel updateShortReviewException,
  });
}

/// @nodoc
class __$$UpdateShortReviewStateImplCopyWithImpl<$Res>
    extends
        _$UpdateShortReviewStateCopyWithImpl<$Res, _$UpdateShortReviewStateImpl>
    implements _$$UpdateShortReviewStateImplCopyWith<$Res> {
  __$$UpdateShortReviewStateImplCopyWithImpl(
    _$UpdateShortReviewStateImpl _value,
    $Res Function(_$UpdateShortReviewStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateShortReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = null,
    Object? content = null,
    Object? image = freezed,
    Object? updateShortReviewStatus = null,
    Object? updateShortReviewException = null,
  }) {
    return _then(
      _$UpdateShortReviewStateImpl(
        rating:
            null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                    as int,
        content:
            null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                    as String,
        image:
            freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                    as File?,
        updateShortReviewStatus:
            null == updateShortReviewStatus
                ? _value.updateShortReviewStatus
                : updateShortReviewStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        updateShortReviewException:
            null == updateShortReviewException
                ? _value.updateShortReviewException
                : updateShortReviewException // ignore: cast_nullable_to_non_nullable
                    as ExceptionModel,
      ),
    );
  }
}

/// @nodoc

class _$UpdateShortReviewStateImpl extends _UpdateShortReviewState {
  _$UpdateShortReviewStateImpl({
    this.rating = 3,
    this.content = '',
    this.image,
    this.updateShortReviewStatus = Status.initial,
    this.updateShortReviewException = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
  }) : super._();

  @override
  @JsonKey()
  final int rating;
  @override
  @JsonKey()
  final String content;
  @override
  final File? image;
  @override
  @JsonKey()
  final Status updateShortReviewStatus;
  @override
  @JsonKey()
  final ExceptionModel updateShortReviewException;

  @override
  String toString() {
    return 'UpdateShortReviewState(rating: $rating, content: $content, image: $image, updateShortReviewStatus: $updateShortReviewStatus, updateShortReviewException: $updateShortReviewException)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateShortReviewStateImpl &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(
                  other.updateShortReviewStatus,
                  updateShortReviewStatus,
                ) ||
                other.updateShortReviewStatus == updateShortReviewStatus) &&
            (identical(
                  other.updateShortReviewException,
                  updateShortReviewException,
                ) ||
                other.updateShortReviewException ==
                    updateShortReviewException));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    rating,
    content,
    image,
    updateShortReviewStatus,
    updateShortReviewException,
  );

  /// Create a copy of UpdateShortReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateShortReviewStateImplCopyWith<_$UpdateShortReviewStateImpl>
  get copyWith =>
      __$$UpdateShortReviewStateImplCopyWithImpl<_$UpdateShortReviewStateImpl>(
        this,
        _$identity,
      );
}

abstract class _UpdateShortReviewState extends UpdateShortReviewState {
  factory _UpdateShortReviewState({
    final int rating,
    final String content,
    final File? image,
    final Status updateShortReviewStatus,
    final ExceptionModel updateShortReviewException,
  }) = _$UpdateShortReviewStateImpl;
  _UpdateShortReviewState._() : super._();

  @override
  int get rating;
  @override
  String get content;
  @override
  File? get image;
  @override
  Status get updateShortReviewStatus;
  @override
  ExceptionModel get updateShortReviewException;

  /// Create a copy of UpdateShortReviewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateShortReviewStateImplCopyWith<_$UpdateShortReviewStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
