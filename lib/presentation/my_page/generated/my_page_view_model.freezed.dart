// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../my_page_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MyPageState {
  UserReviewModel get review => throw _privateConstructorUsedError;
  Status get getMyReviewsStatus => throw _privateConstructorUsedError;
  ExceptionModel get getMyReviewsException =>
      throw _privateConstructorUsedError;

  /// Create a copy of MyPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyPageStateCopyWith<MyPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPageStateCopyWith<$Res> {
  factory $MyPageStateCopyWith(
    MyPageState value,
    $Res Function(MyPageState) then,
  ) = _$MyPageStateCopyWithImpl<$Res, MyPageState>;
  @useResult
  $Res call({
    UserReviewModel review,
    Status getMyReviewsStatus,
    ExceptionModel getMyReviewsException,
  });
}

/// @nodoc
class _$MyPageStateCopyWithImpl<$Res, $Val extends MyPageState>
    implements $MyPageStateCopyWith<$Res> {
  _$MyPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? review = null,
    Object? getMyReviewsStatus = null,
    Object? getMyReviewsException = null,
  }) {
    return _then(
      _value.copyWith(
            review:
                null == review
                    ? _value.review
                    : review // ignore: cast_nullable_to_non_nullable
                        as UserReviewModel,
            getMyReviewsStatus:
                null == getMyReviewsStatus
                    ? _value.getMyReviewsStatus
                    : getMyReviewsStatus // ignore: cast_nullable_to_non_nullable
                        as Status,
            getMyReviewsException:
                null == getMyReviewsException
                    ? _value.getMyReviewsException
                    : getMyReviewsException // ignore: cast_nullable_to_non_nullable
                        as ExceptionModel,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MyPageStateImplCopyWith<$Res>
    implements $MyPageStateCopyWith<$Res> {
  factory _$$MyPageStateImplCopyWith(
    _$MyPageStateImpl value,
    $Res Function(_$MyPageStateImpl) then,
  ) = __$$MyPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    UserReviewModel review,
    Status getMyReviewsStatus,
    ExceptionModel getMyReviewsException,
  });
}

/// @nodoc
class __$$MyPageStateImplCopyWithImpl<$Res>
    extends _$MyPageStateCopyWithImpl<$Res, _$MyPageStateImpl>
    implements _$$MyPageStateImplCopyWith<$Res> {
  __$$MyPageStateImplCopyWithImpl(
    _$MyPageStateImpl _value,
    $Res Function(_$MyPageStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MyPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? review = null,
    Object? getMyReviewsStatus = null,
    Object? getMyReviewsException = null,
  }) {
    return _then(
      _$MyPageStateImpl(
        review:
            null == review
                ? _value.review
                : review // ignore: cast_nullable_to_non_nullable
                    as UserReviewModel,
        getMyReviewsStatus:
            null == getMyReviewsStatus
                ? _value.getMyReviewsStatus
                : getMyReviewsStatus // ignore: cast_nullable_to_non_nullable
                    as Status,
        getMyReviewsException:
            null == getMyReviewsException
                ? _value.getMyReviewsException
                : getMyReviewsException // ignore: cast_nullable_to_non_nullable
                    as ExceptionModel,
      ),
    );
  }
}

/// @nodoc

class _$MyPageStateImpl implements _MyPageState {
  _$MyPageStateImpl({
    this.review = const UserReviewModel(
      reviewCount: 0,
      reviews: <UserReviewDetailModel>[],
    ),
    this.getMyReviewsStatus = Status.loading,
    this.getMyReviewsException = const ExceptionModel(
      status: -1,
      code: '',
      message: '',
      timestamp: '',
    ),
  });

  @override
  @JsonKey()
  final UserReviewModel review;
  @override
  @JsonKey()
  final Status getMyReviewsStatus;
  @override
  @JsonKey()
  final ExceptionModel getMyReviewsException;

  @override
  String toString() {
    return 'MyPageState(review: $review, getMyReviewsStatus: $getMyReviewsStatus, getMyReviewsException: $getMyReviewsException)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyPageStateImpl &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.getMyReviewsStatus, getMyReviewsStatus) ||
                other.getMyReviewsStatus == getMyReviewsStatus) &&
            (identical(other.getMyReviewsException, getMyReviewsException) ||
                other.getMyReviewsException == getMyReviewsException));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    review,
    getMyReviewsStatus,
    getMyReviewsException,
  );

  /// Create a copy of MyPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyPageStateImplCopyWith<_$MyPageStateImpl> get copyWith =>
      __$$MyPageStateImplCopyWithImpl<_$MyPageStateImpl>(this, _$identity);
}

abstract class _MyPageState implements MyPageState {
  factory _MyPageState({
    final UserReviewModel review,
    final Status getMyReviewsStatus,
    final ExceptionModel getMyReviewsException,
  }) = _$MyPageStateImpl;

  @override
  UserReviewModel get review;
  @override
  Status get getMyReviewsStatus;
  @override
  ExceptionModel get getMyReviewsException;

  /// Create a copy of MyPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyPageStateImplCopyWith<_$MyPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
