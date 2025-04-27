// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../add_store_review_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AddStoreReviewState {
  int get rating => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  File? get image => throw _privateConstructorUsedError;
  Status get addStoreReviewStatus => throw _privateConstructorUsedError;
  ExceptionModel get addStoreReviewException =>
      throw _privateConstructorUsedError;

  /// Create a copy of AddStoreReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddStoreReviewStateCopyWith<AddStoreReviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddStoreReviewStateCopyWith<$Res> {
  factory $AddStoreReviewStateCopyWith(
    AddStoreReviewState value,
    $Res Function(AddStoreReviewState) then,
  ) = _$AddStoreReviewStateCopyWithImpl<$Res, AddStoreReviewState>;
  @useResult
  $Res call({
    int rating,
    String content,
    File? image,
    Status addStoreReviewStatus,
    ExceptionModel addStoreReviewException,
  });
}

/// @nodoc
class _$AddStoreReviewStateCopyWithImpl<$Res, $Val extends AddStoreReviewState>
    implements $AddStoreReviewStateCopyWith<$Res> {
  _$AddStoreReviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddStoreReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = null,
    Object? content = null,
    Object? image = freezed,
    Object? addStoreReviewStatus = null,
    Object? addStoreReviewException = null,
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
            addStoreReviewStatus:
                null == addStoreReviewStatus
                    ? _value.addStoreReviewStatus
                    : addStoreReviewStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            addStoreReviewException:
                null == addStoreReviewException
                    ? _value.addStoreReviewException
                    : addStoreReviewException // ignore: cast_nullable_to_non_nullable
                        as ExceptionModel,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AddStoreReviewStateImplCopyWith<$Res>
    implements $AddStoreReviewStateCopyWith<$Res> {
  factory _$$AddStoreReviewStateImplCopyWith(
    _$AddStoreReviewStateImpl value,
    $Res Function(_$AddStoreReviewStateImpl) then,
  ) = __$$AddStoreReviewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int rating,
    String content,
    File? image,
    Status addStoreReviewStatus,
    ExceptionModel addStoreReviewException,
  });
}

/// @nodoc
class __$$AddStoreReviewStateImplCopyWithImpl<$Res>
    extends _$AddStoreReviewStateCopyWithImpl<$Res, _$AddStoreReviewStateImpl>
    implements _$$AddStoreReviewStateImplCopyWith<$Res> {
  __$$AddStoreReviewStateImplCopyWithImpl(
    _$AddStoreReviewStateImpl _value,
    $Res Function(_$AddStoreReviewStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddStoreReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = null,
    Object? content = null,
    Object? image = freezed,
    Object? addStoreReviewStatus = null,
    Object? addStoreReviewException = null,
  }) {
    return _then(
      _$AddStoreReviewStateImpl(
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
        addStoreReviewStatus:
            null == addStoreReviewStatus
                ? _value.addStoreReviewStatus
                : addStoreReviewStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        addStoreReviewException:
            null == addStoreReviewException
                ? _value.addStoreReviewException
                : addStoreReviewException // ignore: cast_nullable_to_non_nullable
                    as ExceptionModel,
      ),
    );
  }
}

/// @nodoc

class _$AddStoreReviewStateImpl extends _AddStoreReviewState {
  _$AddStoreReviewStateImpl({
    this.rating = 3,
    this.content = '',
    this.image,
    this.addStoreReviewStatus = Status.initial,
    this.addStoreReviewException = const ExceptionModel(
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
  final Status addStoreReviewStatus;
  @override
  @JsonKey()
  final ExceptionModel addStoreReviewException;

  @override
  String toString() {
    return 'AddStoreReviewState(rating: $rating, content: $content, image: $image, addStoreReviewStatus: $addStoreReviewStatus, addStoreReviewException: $addStoreReviewException)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddStoreReviewStateImpl &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.addStoreReviewStatus, addStoreReviewStatus) ||
                other.addStoreReviewStatus == addStoreReviewStatus) &&
            (identical(
                  other.addStoreReviewException,
                  addStoreReviewException,
                ) ||
                other.addStoreReviewException == addStoreReviewException));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    rating,
    content,
    image,
    addStoreReviewStatus,
    addStoreReviewException,
  );

  /// Create a copy of AddStoreReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddStoreReviewStateImplCopyWith<_$AddStoreReviewStateImpl> get copyWith =>
      __$$AddStoreReviewStateImplCopyWithImpl<_$AddStoreReviewStateImpl>(
        this,
        _$identity,
      );
}

abstract class _AddStoreReviewState extends AddStoreReviewState {
  factory _AddStoreReviewState({
    final int rating,
    final String content,
    final File? image,
    final Status addStoreReviewStatus,
    final ExceptionModel addStoreReviewException,
  }) = _$AddStoreReviewStateImpl;
  _AddStoreReviewState._() : super._();

  @override
  int get rating;
  @override
  String get content;
  @override
  File? get image;
  @override
  Status get addStoreReviewStatus;
  @override
  ExceptionModel get addStoreReviewException;

  /// Create a copy of AddStoreReviewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddStoreReviewStateImplCopyWith<_$AddStoreReviewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
