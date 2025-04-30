// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../user_review_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UserReviewState {
  UserReviewModel get shortReview => throw _privateConstructorUsedError;
  Status get getMyShortReviewsStatus => throw _privateConstructorUsedError;
  ExceptionModel get getMyShortReviewsException =>
      throw _privateConstructorUsedError;

  /// Create a copy of UserReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserReviewStateCopyWith<UserReviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserReviewStateCopyWith<$Res> {
  factory $UserReviewStateCopyWith(
    UserReviewState value,
    $Res Function(UserReviewState) then,
  ) = _$UserReviewStateCopyWithImpl<$Res, UserReviewState>;
  @useResult
  $Res call({
    UserReviewModel shortReview,
    Status getMyShortReviewsStatus,
    ExceptionModel getMyShortReviewsException,
  });
}

/// @nodoc
class _$UserReviewStateCopyWithImpl<$Res, $Val extends UserReviewState>
    implements $UserReviewStateCopyWith<$Res> {
  _$UserReviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shortReview = null,
    Object? getMyShortReviewsStatus = null,
    Object? getMyShortReviewsException = null,
  }) {
    return _then(
      _value.copyWith(
            shortReview:
                null == shortReview
                    ? _value.shortReview
                    : shortReview // ignore: cast_nullable_to_non_nullable
                        as UserReviewModel,
            getMyShortReviewsStatus:
                null == getMyShortReviewsStatus
                    ? _value.getMyShortReviewsStatus
                    : getMyShortReviewsStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            getMyShortReviewsException:
                null == getMyShortReviewsException
                    ? _value.getMyShortReviewsException
                    : getMyShortReviewsException // ignore: cast_nullable_to_non_nullable
                        as ExceptionModel,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserReviewStateImplCopyWith<$Res>
    implements $UserReviewStateCopyWith<$Res> {
  factory _$$UserReviewStateImplCopyWith(
    _$UserReviewStateImpl value,
    $Res Function(_$UserReviewStateImpl) then,
  ) = __$$UserReviewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    UserReviewModel shortReview,
    Status getMyShortReviewsStatus,
    ExceptionModel getMyShortReviewsException,
  });
}

/// @nodoc
class __$$UserReviewStateImplCopyWithImpl<$Res>
    extends _$UserReviewStateCopyWithImpl<$Res, _$UserReviewStateImpl>
    implements _$$UserReviewStateImplCopyWith<$Res> {
  __$$UserReviewStateImplCopyWithImpl(
    _$UserReviewStateImpl _value,
    $Res Function(_$UserReviewStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shortReview = null,
    Object? getMyShortReviewsStatus = null,
    Object? getMyShortReviewsException = null,
  }) {
    return _then(
      _$UserReviewStateImpl(
        shortReview:
            null == shortReview
                ? _value.shortReview
                : shortReview // ignore: cast_nullable_to_non_nullable
                    as UserReviewModel,
        getMyShortReviewsStatus:
            null == getMyShortReviewsStatus
                ? _value.getMyShortReviewsStatus
                : getMyShortReviewsStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        getMyShortReviewsException:
            null == getMyShortReviewsException
                ? _value.getMyShortReviewsException
                : getMyShortReviewsException // ignore: cast_nullable_to_non_nullable
                    as ExceptionModel,
      ),
    );
  }
}

/// @nodoc

class _$UserReviewStateImpl implements _UserReviewState {
  _$UserReviewStateImpl({
    this.shortReview = const UserReviewModel(
      reviewCount: 0,
      reviews: <UserReviewDetailModel>[],
    ),
    this.getMyShortReviewsStatus = Status.loading,
    this.getMyShortReviewsException = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
  });

  @override
  @JsonKey()
  final UserReviewModel shortReview;
  @override
  @JsonKey()
  final Status getMyShortReviewsStatus;
  @override
  @JsonKey()
  final ExceptionModel getMyShortReviewsException;

  @override
  String toString() {
    return 'UserReviewState(shortReview: $shortReview, getMyShortReviewsStatus: $getMyShortReviewsStatus, getMyShortReviewsException: $getMyShortReviewsException)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserReviewStateImpl &&
            (identical(other.shortReview, shortReview) ||
                other.shortReview == shortReview) &&
            (identical(
                  other.getMyShortReviewsStatus,
                  getMyShortReviewsStatus,
                ) ||
                other.getMyShortReviewsStatus == getMyShortReviewsStatus) &&
            (identical(
                  other.getMyShortReviewsException,
                  getMyShortReviewsException,
                ) ||
                other.getMyShortReviewsException ==
                    getMyShortReviewsException));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    shortReview,
    getMyShortReviewsStatus,
    getMyShortReviewsException,
  );

  /// Create a copy of UserReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserReviewStateImplCopyWith<_$UserReviewStateImpl> get copyWith =>
      __$$UserReviewStateImplCopyWithImpl<_$UserReviewStateImpl>(
        this,
        _$identity,
      );
}

abstract class _UserReviewState implements UserReviewState {
  factory _UserReviewState({
    final UserReviewModel shortReview,
    final Status getMyShortReviewsStatus,
    final ExceptionModel getMyShortReviewsException,
  }) = _$UserReviewStateImpl;

  @override
  UserReviewModel get shortReview;
  @override
  Status get getMyShortReviewsStatus;
  @override
  ExceptionModel get getMyShortReviewsException;

  /// Create a copy of UserReviewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserReviewStateImplCopyWith<_$UserReviewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
